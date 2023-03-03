
# ------------------------------ Création d'une fonction d'import de données ---


# l'objectif ici sera de créer une fonction "import_data" qui prendra pour
# arguments nos deux fichiers JATOS bruts, notre nombre de composantes, et
# quelques fichiers annexes, et en ressortira un dataframe propre (et
# extractible en csv). Cette fonction pourra ainsi être utilisée dans d'autres
# scripts simplement en appelant :
#
#   > source("./zcscripts/import_data.R")
#
#   ... puis en faisant tourner la fonction.


# ---- la fonction en question -------------------------------------------------


# ---- package routine
# librairian (s'il n'est pas déjà là) pour gérer les packages efficacement
if (!require(librarian)) install.packages(librarian)
library(librarian)
# et on met nos packages sur l'étagère :
shelf(
  # la base de tout...
  tidyverse,
  # ... et nos besoins du moment :
  jsonlite
)


# ---- ... donc on disait :
#'
#' @title import_data
#'
#' Permet de récupérer un dataframe des résultats de notre expérience à partir
#' des fichiers de résultats et de métadonnées issus de JATOS, ainsi que de
#' différents fichiers d'information sur nos tâches - des corrections par
#' exemple.
#'
#' Les arguments de la fonction :
#'
#' @param jatos_results_path Le chemin vers le fichier de résultats en .txt
#' @param jatos_meta_path Le chemin vers le fichier de métadonnées en .csv
#'
#' @return -> Un dataframe contenant nos données finales pour tous les sujets
#' + Deux "produits secondaires" sortiront : un csv "data.csv" contenant le du
#' dataframe finalisé, et un csv avec les scores à coter à la main nommé
#' "for_cotation.csv".
#'
#' @author Maël Delem
#'
import_data <- function(
    jatos_results_path,
    jatos_meta_path
    ) {
  # Commençons


  # ------------------------ expecto_data ! le dataframe brut (sans WCST...) ---


  composantes <-
    # on va lire le fichier texte...
    read_file(jatos_results_path) %>%
    # ... on le sépare en lignes ...
    str_split("\n") %>%
    first() %>%
    # ... on enlève la dernière ligne, systématiquement vide ...
    discard(function(x) x == "")
  # ... Et on a donc notre liste de composantes sous forme de strings JSON.

  # on initialise notre dataframe final (Rome ne s'est pas faite en un jour...)
  df <- data.frame()

  # on va maintenant le remplir itérativement en parcourant "composantes"

  # - on prépare un compteur de tours
  compteur <- 0
  # - on forme un sujet caméléon (avec un placeholder "1" pour le "bind_cols")
  sujet <- list(1)

  # puis vient notre boucle itérative :

  # on va d'abord parcourir toutes les composantes sauf :
  # - les réponses aux similitudes et à la compréhension de texte, qu'on va 
  #   envoyer pour cotation, et qui ont un nombre irrégulier de lignes
  # - le WCST car le WCST et les spans n'ont pas le même nombre de résultats :
  
  for (i in (seq_along(composantes))) {
    
    # notre compteur de composantes grossit à chaque tour :
    compteur <- compteur + 1
    
    # si le compteur est sur la position : 
    # - d'une composante similitudes (composante 10)
    # - ou d'une composante compréhension (composante 11)...
    if (compteur == 10 || compteur == 11){
      # ... on passe à la boucle suivante.
      next
    }
    
    # si le compteur arrive sur la position d'un WCST (composante 14)...
    if (compteur == 14){
      # ... on ajoute notre sujet au dataframe (on "l'entasse" par dessus) ...
      df <- bind_rows(sujet, df)
      # ... on réinitialise le compteur...
      compteur <- 0
      # ... on réinitialise notre sujet caméléon...
      sujet <- list(1)
      # ... et on passe le WCST pour commencer le sujet suivant.
      next
    }
    
    # pour toutes les autres composantes :
    # on ajoute les colonnes des composantes à chaque tour au sujet caméléon !
    sujet <- bind_cols(sujet, jsonlite::fromJSON(composantes[i]))
    }
  # l'itération continue jusqu'à avoir parcouru toutes les composantes du .txt
  # sorti par JATOS. En sortie on a donc tous les résultats des sujets entassés 
  # dans "df" ! - sauf les questions textuelles et le WCST.

  
  # ---------------------------------- mémoire mémoire : résultats des spans ---


  # pour pouvoir ajouter les résultats du WCST, il faudra ramener ce dataframe
  # intermédiaire de 59 lignes à une seule ligne par sujet. on doit donc
  # extraire tout ce qui nous intéresse des 59 lignes de digit et corsi, puis
  # ne garder que la première avec head(df,1).

  # beaucoup de traitement en prévision :
  df <- df %>%
  relocate(
    c(
      # les colonnes à garder du digit et du corsi...
      rt...182,
      trial_id...186,
      num_spaces,
      correct...207,
      rt...209,
      trial_id...213,
      num_digits,
      correct...234
    ),
    # ... se placent juste après le raven...
    .after = "score_raven"
  ) %>%
  # ... pour pouvoir supprimer toutes celles inutiles après elles.
  select(nom:correct...234) %>%
  # du renommage pour se repérer :
  rename(
    "rt_corsi" = "rt...182",
    "trial_corsi" = "trial_id...186",
    "nb_blocs" = "num_spaces",
    "correct_corsi" = "correct...207",
    "rt_digit" = "rt...209",
    "trial_digit" = "trial_id...213",
    "nb_chiffres" = "num_digits",
    "correct_digit" = "correct...234"
    ) %>%
  # on ne garde que les lignes des réponses (identiques chez corsi et digit).
  filter(trial_corsi == "response") %>%
    
  # il est temps de calculer les résultats des spans :
  
  # on rassemble les lignes appartenant au même sujet
  group_by(nom) %>% 
  mutate(
    # on calcule la moyenne des RT pour chaque span
    corsi_rt_mean = mean(as.numeric(rt_corsi)),
    digit_rt_mean = mean(as.numeric(rt_digit)),
    # on supprime les valeurs de span pour les essais incorrects...
    nb_chiffres = ifelse(correct_digit == FALSE, 0, nb_chiffres),
    # ... et on identifie le span maximum.
    digit_span = max(nb_chiffres),
    # idem pour le deuxième span
    nb_blocs = ifelse(correct_corsi == FALSE, 0, nb_blocs),
    corsi_span = max(nb_blocs),
  ) %>% 
  # on peut donc supprimer les colonnes utilisées !
  select(-c(
    rt_corsi,
    trial_corsi,
    nb_blocs,
    correct_corsi,
    rt_digit,
    trial_digit,
    nb_chiffres,
    correct_digit
    )) %>% 
  # (on défait le groupement par nom au cas où)
  ungroup() %>% 

  # ... et on est parés pour ne garder qu'une ligne par sujet ! pour chaque
  # sujet, toutes les lignes sont identiques. ça équivaut donc tout simplement à
  # supprimer les doublons de notre dataframe, ce qui tient en une ligne :
  distinct()
  
  # ------------------------------------------------------------ métadonnées ---
  
  # on peut alors ajouter les métadonnées, qui ont la même forme que le
  # dataframe à ce moment là, i.e. une ligne par sujet - on vient les coller à 
  # gauche de notre dataframe :
  df <- bind_cols(read_csv(jatos_meta_path), df)
  
  # un peu de renommage :
  df <- df %>% 
    rename(
      id = `Result ID`,
      duration = Duration,
      batch = Batch,
      worker_type = `Worker Type`,
      state = State
      ) %>% 
    # et on ne garde que ces colonnes, les seules intéressantes :
    select(id, duration, batch, worker_type, state, nom : corsi_span)
  
  
  # --------------------------------- playing cards : the infamous wisconsin ---


  # étant revenus à une ligne par sujet, on peut donc ajouter la dernière partie
  # de notre dataframe, le WCST. on le fusionnera à la fin, quand il sera ramené
  # à une ligne par sujet, pour éviter les complications.
  
  # on va recommencer une itération sur toutes les composantes
  # - on s'assure que notre compteur et notre caméléon sont réinitialisés
  compteur <- 0
  sujet <- list(1)
  
  # on initialise un dataframe temporaire
  df_temp <- data.frame()

  # on parcourt toutes les composantes
  for (i in (seq_along(composantes))) {
    
    # notre compteur de composantes grossit à chaque tour :
    compteur <- compteur + 1
    
    # cette fois, si le compteur N'EST PAS sur la position d'un WCST, on passe 
    # au tour suivant
    if (compteur != 14){next}
    
    # sinon :
    # on ajoute les colonnes du WCST au sujet caméléon...
    sujet <- bind_cols(sujet, jsonlite::fromJSON(composantes[i]))
    
    # ... on ajoute notre sujet au dataframe temporaire...
    df_temp <- bind_rows(sujet, df_temp)
    # ... puis on réinitialise notre compteur et notre sujet caméléon.
    compteur <- 0
    sujet <- list(1)
    }
  # Et l'itération reprend jusqu'à avoir parcouru toutes les WCST.
  # on a donc tous les résultats du WCST entassés dans "df_temp" !
  
  # c'est l'heure du score :
  df_temp <- df_temp %>% 
    # on selectionne les deux seules colonnes utiles :
    select(
      # un id pour pouvoir grouper par sujet
      jatosStudyResultId,
      # la précision
      acc,
      # le temps de réponse
      avg_rt
    ) %>% 
  # OpenSesame fait les scores et rt tout seul, donc on prend juste les 
  # dernières valeurs...
  # ... par sujet :
  group_by(jatosStudyResultId) %>% 
  mutate(
    # la colonne score est égale à la dernière ligne de celle "acc"
    wcst_score = acc[length(acc)], 
    # la colonne rt_mean est égale à la dernière ligne de "avg_rt"
    wcst_rt_mean = avg_rt[length(avg_rt)]) %>% 
  # et on ne garde que la dernière ligne par sujet !
  filter(row_number() == n()) %>%
  # on enlève les colonnes utilisées :
  select(-c(acc, avg_rt)) %>%
  # un peu de renommage :
  rename(id = jatosStudyResultId) %>% 
  # et changement de type pour fusionner :
  mutate(id = as.numeric(id))
  
  # et on l'ajoute à notre dataframe final !
  df <- left_join(df, df_temp, by = "id")
  
  # un peu de ménage :
  
  # on nettoie les NA (données manquantes) s'il y en a
  if (any(is.na(df))) {
    df <- df %>%
      # on remplace alors les NA textuels par "" ...
      mutate_if(is.character, ~ replace_na(., "")) %>%
      # ... et les NA numériques par 0.
      mutate_if(is.numeric, ~ replace_na(., 0))
  }
  
  # et voilà notre dataframe brut ! Un énorme pavé, sur lequel on va devoir
  # faire beaucoup de travail.
  
  
  # ---------------------------- send_for_cotation : un csv pour les humains ---
  
  
  # enfin, pour en finir avec l'extraction des données brutes, il nous reste à 
  # récupérer les résultats des similitudes et de la compréhension. Cependant 
  # ces colonnes sont particulières car de longueur variable : cela explique 
  # leur traitement à part. on va les extraire ensemble avec le nom des sujets,
  # i.e. on prendra les composantes 1, 10 et 11. On ne les traitera pas
  # directement informatiquement, elles doivent être cotées à la main. on va  
  # donc les extraire dans un csv.
  
  # on recommence une extraction en parcourant les composantes :
  # - on s'assure que notre compteur et notre caméléon sont réinitialisés
  compteur <- 0
  sujet <- list(1)
  
  # on initialise un dataframe temporaire
  df_cot <- data.frame()
  
  # on parcourt toutes les composantes
  for (i in (seq_along(composantes))) {
    
    # notre compteur de composantes grossit à chaque tour :
    compteur <- compteur + 1
    
    # cette fois, si le compteur n'est pas sur un nom, les similitudes ou la
    # compréhension, on passe au tour suivant (on garde le WCST pour boucler)
    if (compteur != 1 & compteur != 10 & compteur != 11 & compteur != 14){next}
    
    # si le compteur arrive sur la position d'un WCST (composante 14)...
    if (compteur == 14){
      # ... on ajoute notre sujet au dataframe (on "l'entasse" par dessus) ...
      df_cot <- bind_rows(sujet, df_cot)
      # ... on réinitialise le compteur...
      compteur <- 0
      # ... on réinitialise notre sujet caméléon...
      sujet <- list(1)
      # ... et on passe le WCST pour commencer le sujet suivant.
      next
    }
    
    # sinon, on ajoute les colonnes au sujet caméléon...
    sujet <- bind_cols(sujet, jsonlite::fromJSON(composantes[i]))
    
    # ... et on ajoute notre sujet au dataframe temporaire.
    df_cot <- bind_rows(sujet, df_cot)
  }
  # Et l'itération reprend jusqu'à avoir parcouru toutes les composantes.
  # on a donc tous les résultats à coter dans "df_cot" !
  
  # on extrait alors ce petit dataframe dans un .csv "for_cotation".
  write_csv(df_cot, "ze_data/for_cotation.csv")
  
  
  # ------------------------ "compression" en scores de beaucoup de colonnes ---
  
  
  # ---------------------------------------------- questionnaires additifs : ---
  
  df <- df %>%

    # ------------------ VVIQ : on additionne simplement toutes les colonnes ---
    mutate(
      vviq = rowSums(across(starts_with("vviq"))),
      # ... puis on supprime les 16 colonnes utilisées.
      .keep = "unused",
    ) %>%

    # --------------------------- latéralité : on la convertit en 1, 0 ou -1 ---
    mutate(
      across(
        starts_with("lat_"),
        ~ case_when(
          .x == "gauche" ~ 1,
          .x == "ambi" ~ 0,
          .x == "droite" ~ -1,
          .x == "" ~ 0
        )
      )
    ) %>%
    mutate(
      # on fait la "moyenne de la latéralité"...
      lateralite = rowMeans(across(starts_with("lat_"))),
      # ... et on ne garde que notre résultat.
      .keep = "unused"
    ) %>%
    mutate(
      # enfin on décide de la latéralité "globale" du sujet !
      lateralite = ifelse(lateralite > 0, "gaucher", "droitier"),
      # (à noter que les ambidextres ont été considérés droitiers)
    ) %>%

    # --------------------------------------------------------- SRI et Raven ---

    # le code de l'expérience a déjà calculé les scores au SRI et au Raven : on
    # va donc supprimer...
    select(
    # ... les questions individuelles du SRI...
    -starts_with("sri"),
    # ... et les questions individuelles du Raven.
    -starts_with("raven")
    ) %>%
    # on va faire la moyenne des rt à ces questionnaires
    mutate(
      # celle du SRI...
      sri_rt_mean = rowMeans(across(starts_with("rt_sri_"))),
      # ... celle du Raven...
      raven_rt_mean = rowMeans(across(starts_with("rt_raven_"))),
      # ... et on supprime toutes les colonnes utilisées.
      .keep = "unused"
    ) %>%
    # renommage car TOC
    rename(
      sri_score = score_sri,
      raven_score = score_raven,
      mai_know = score_mai_know,
      mai_reg = score_mai_reg
    )
  # fin de la première compression de masse
  
  # ------------------------------------------ OSVIQ : pourquoi faire simple ---
  
  # l'OSVIQ est un peu plus complexe, il doit être séparé en trois notes

  # on récupère à la main la répartition objet/spatial/verbal des items
  # (elle a une randomisation fixe créée par Kozhevnikov et al. (2008))
  o <- c(6, 11, 12, 13, 15, 18, 20, 23, 26, 29, 33, 34, 40, 43, 45)
  s <- c(1, 3, 5, 7, 10, 14, 17, 25, 27, 30, 31, 32, 38, 42, 44)
  v <- c(2, 4, 8, 9, 16, 19, 21, 22, 24, 28, 35, 36, 37, 39, 41)
  # on les convertit sous forme de noms de colonnes
  o <- paste0("osviq_", o)
  s <- paste0("osviq_", s)
  v <- paste0("osviq_", v)
  # il est temps de calculer les scores :
  df <- df %>%
    mutate(
      # score objet cumulé
      osviq_o = rowSums(across(all_of(o))),
      # score spatial cumulé
      osviq_s = rowSums(across(all_of(s))),
      # score verbal cumulé
      osviq_v = rowSums(across(all_of(v))),
      # ... et on supprime les 45 anciennes colonnes.
      .keep = "unused"
    ) %>%
    
  # -- après cette tambouille, on remet tout le monde dans l'ordre de départ ---
  select(
    id : vision, lateralite,
    vviq, osviq_o : osviq_v,
    mai_know, mai_reg,
    sri_score, sri_rt_mean,
    raven_score, raven_rt_mean,
    digit_span, digit_rt_mean,
    corsi_span, corsi_rt_mean,
    wcst_score, wcst_rt_mean
    )
  
  # ------------------ on extrait notre petit protégé en .csv, ça coûte rien --- 
  
  write_csv(df, "ze_data/data.csv")
  
  # --------------------- la collecte de notre précieux rectangle... Enfin ! ---
  return(df)
}




# ---- imports tests -----------------------------------------------------------

df <- import_data(
  # les chemins vers nos fichiers JATOS
  jatos_results_path = "ze_data/jatos_results_complete.txt",
  jatos_meta_path    = "ze_data/jatos_meta_complete.csv"
)

# on check les colonnes de "df"
colnames(df)

# ---- to-do -------------------------------------------------------------------

# osviq simplified thanks to the renaming in the JSON
# sri extension : inidividual questions are now going to be used for subscales 
# instead of being straight-up deleted
