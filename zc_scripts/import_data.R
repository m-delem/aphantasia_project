

# ------------------------------ Création d'une fonction d'import de données ---


# l'objectif ici sera de créer une fonction "import_data" qui prendra pour
# arguments nos deux fichiers JATOS bruts, notre nombre de composantes, et
# quelques fichiers annexes, et en ressortira un dataframe propre (et 
# extractible en csv). Cette fonction pourra ainsi être utilisée dans d'autres 
# scripts simplement en appelant :
#
#   > source("./zcscripts/data_import.R")
#
#   ... puis en faisant tourner la fonction.

# Nous allons procéder en plusieurs étapes :

# - la partie "expecto_data" va couper le "jatos_results" en petits JSON, les
#   aligner pour former nos sujets, et entasser progressivement les sujets pour
#   former le dataframe brut. l'accole alors à droite du "jatos_meta" (très 
#   facile à importer car tout prêt, à la bonne forme et taille) pour obtenir un
#   dataframe complet avec toutes les infos brutes, y compris de quoi identifier
#   les sujets directement dans les premières colonnes.

# - la partie "send_for_cotation" va extraire du dataframe les colonnes des
#   tâches à coter manuellement, comme le test des similitudes ou la
#   compréhension de texte, et les exporter dans un .csv appelé "for_cotation".
#   Les résultats de ces tâches seront ajoutés plus tard, quand ils seront 
#   cotés, mais en attendant on pourra analyser le reste.

# - la partie "compression" va calculer les scores aux différents questionnaires
#   et tâches : toutes les réponses individuelles sont séparés en colonnes, donc
#   il faut les "compresser" entre elles pour nous donner les jolis scores qu'on 
#   va analyser. Certaines parties sont particulièrement fastidieuses, comme le
#   calcul des scores au SRI ou au Raven, car il faut les comparer à des bonnes
#   réponses. Les fichiers contenant ces réponses sont créés à l'avance, et
#   seront récupérés grâce aux arguments "correction_test" pris par la fonction.


# ---- la fonction en question -------------------------------------------------


# ---- (package pour les JSON au cas où il serait pas là...)
shelf(jsonlite)

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
#' @param nb_composantes Le nombre total de composantes de notre expé JATOS
#' @param correction_sri Le chemin vers la correction du SRI en .csv
#' @param correction_raven Le chemin vers la correction du Raven en .csv
#'
#' @return -> Un dataframe contenant nos données finales pour tous les sujets
#' + Un "produit secondaire" sortira : un csv avec les scores à coter à la main,
#'   nommé "for_cotation.csv"
#' 
#' @author Maël Delem
#' 
import_data <- function(
    jatos_results_path, 
    jatos_meta_path, 
    nb_composantes,
    correction_sri,
    correction_raven
    ){ 
  
  # Commençons
  
  
  # --------------------------- expecto_data ! la création du dataframe brut ---
  
  
  composantes <- 
    # on va lire le fichier texte...
    read_file(jatos_results_path) %>%
    # ... on le sépare en lignes ...
    str_split('\n') %>% first() %>% 
    # ... on enlève la dernière ligne, systématiquement vide ...
    discard(function(x) x == '')
  # ... Et on a donc notre liste de composantes sous forme de strings JSON.
  
  # on initialise notre dataframe final (Rome ne s'est pas faite en un jour...)
  df <- data.frame()
  
  # on va maintenant le remplir itérativement en parcourant "composantes"
  
  # - on prépare un compteur de tours
  compteur <- 0
  # - on forme un sujet caméléon (avec un placeholder "1" pour "bind_cols")
  sujet <- list(1)
  
  # puis vient notre boucle itérative :
  
  # on parcourt toutes les composantes individuelles sans regarder qui est où
  for (i in (1:length(composantes))){
    
    # on ajoute les colonnes des composantes à chaque tour au sujet caméléon...
    sujet <- bind_cols(sujet,jsonlite::fromJSON(composantes[i]))
    
    # ... et notre compteur de composantes grossit à chaque tour.
    compteur <- compteur + 1
    
    # si le compteur atteint le nombre de composantes par sujet (i.e. tout ce 
    # qu'a passé un sujet donné dans l'expé)...
    if (compteur == nb_composantes){
      # ... on réinitialise le compteur ...
      compteur <- 0
      # ... on ajoute notre sujet au dataframe (on "l'entasse" par dessus) ...
      df <- bind_rows(sujet, df)
      # ... puis on réinitialise notre sujet caméléon.
      sujet <- list(1)
      
      # Et l'itération reprend, avec un sujet tout neuf et le compteur à zéro...
      } 
    # ... jusqu'à avoir parcouru toutes les composantes du .txt sorti par JATOS.
    } 
  # on a donc tous les résultats des sujets entassés dans "data" !
  
  # on accole le dataframe de métadonnées à gauche
  df <- bind_cols(read_csv(jatos_meta_path), df)
  
  # quelques suppressions
  df <- df %>% 
    select(
      # on retire...
    - c(
      # ... la colonne "placeholder" composée que de "1" (celle du caméléon)
      `...10`,
      # ... "consentement", qui sera forcément "oui" si les gens ont participé
      consentement,
      # ... "message" qui sera redondante avec "State" (= expé finie/pas finie)
      Message
      # on peut en retirer d'autres ici au besoin
      ))
      
  # on nettoie les NA (données manquantes) s'il y en a 
  if (any(is.na(df))){
    df <- df %>% 
      # on remplace alors les NA textuels par "" ...
      mutate_if(is.character, ~replace_na(.,"")) %>% 
      # ... et les NA numériques par 0.
      mutate_if(is.numeric, ~replace_na(.,0))
    }
  
  # et voilà notre dataframe brut ! Un énorme pavé, sur lequel on va devoir 
  # faire beaucoup de travail.
  
  
  # ---------------------------- send_for_cotation : un csv pour les humains ---
  
  
  # on va extraire les colonnes qui ont besoin d'être cotées manuellement
  reponses <- df %>% 
    # on isole...
    select(
      # # ... les similitudes...
      # starts_with("similitudes"),
      # # ... la compréhension de texte...
      # starts_with("similitudes"),
      # # a minima.
      # ici on est encore en test, on va isoler "question"
      starts_with("question"),
    )
  # on extrait ce petit dataframe dans un .csv "for_cotation"...
  write_csv(reponses, "./ze_data/for_cotation.csv")
  # ... et on supprime les colonnes extraites de notre dataframe principal :
  df <- df %>% 
    select(
      # on retire...
      -c(
        # # ... les similitudes...
        # starts_with("similitudes"),
        # # ... la compréhension de texte...
        # starts_with("lecture"),
        # # a minima.
        # ici on est encore en test, on va enlever "question"
        starts_with("question")
        ))
  

  # ------------------------ "compression" en scores de beaucoup de colonnes ---
  
  
  # pour commencer, les scores additifs très simples des questionnaires 
  df <- df %>% 
    
    # --------- VVIQ : on additionne simplement toutes les colonnes...
    mutate(
      vviq = rowSums(across(starts_with("vviq"))),
      # ... puis on supprime les 16 colonnes utilisées.
      .keep = "unused",
      ) %>% 
    
    # --------- MAI : on commence par convertir en 0 ou 1
    mutate(across(starts_with("mai"), ~ifelse(.x == TRUE, 1, 0)),) %>%
    mutate(
      # on additionne tout...
      mai = rowSums(across(starts_with("mai"))),
      # ... et on ne garde que notre résultat.
      .keep = "unused",
      ) %>% 
    
    # --------- latéralité : on la convertit en 1, 0 ou -1
    mutate(
      across(starts_with("Row"), # à changer en "lat"
             ~case_when(.x == "gauche" ~ 1,
                        .x == "ambi" ~ 0,
                        .x == "droite" ~ -1,
                        .x == "" ~ 0))
      ) %>% 
    mutate(
      # on fait la "moyenne de la latéralité"...
      lateralite = rowMeans(across(starts_with("Row"))),
      # ... et on ne garde que notre résultat.
      .keep = "unused"
      ) %>% 
    mutate(
      # enfin on décide de la latéralité "globale" du sujet !
      lateralite = ifelse(lateralite > 0, "gaucher", "droitier"),
      # (à noter que les ambidextres ont été considérés droitiers)
      ) %>% 
    
    # après cette tambouille, on remet tout le monde dans l'ordre de départ
    select(
      `Result ID`:education,
      domaine,
      vision,
      lateralite, 
      vviq,
      mai, 
      everything(),
      )
  # fin de la première compression massive

  # ----------- OSVIQ : un peu plus complexe, à séparer en trois notes
  
  # on récupère à la main la répartition objet/spatial/verbal des items
  # (elle a une randomisation fixe créée par Kozhevnikov et al. (2008))
  o <- c(6,11,12,13,15,18,20,23,26,29,33,34,40,43,45)
  s <- c(1,3,5,7,10,14,17,25,27,30,31,32,38,42,44)
  v <- c(2,4,8,9,16,19,21,22,24,28,35,36,37,39,41)
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
    # enfin on remet tout le monde dans l'ordre
    select(
      `Result ID`:vviq,
      osviq_o:osviq_v,
      everything()
      )

  # ----------- SRI : nouveau chantier
  
  # on lit le df de correction du SRI
  correction <- read_csv(correction_sri)
  
  # on va créer un petit dataframe dans "resultats"
  resultats <- df %>% 
    # on veut sélectionner les colonnes du SRI...
    select(
      # ... et s'assurer du bon ordre des colonnes :
      df %>% 
        # on prend les colonnes qui commencent par "sri"...
        select(starts_with("sri")) %>% 
        # ... on extrait leur nom...
        colnames() %>% 
        # ... on les trie selon le numéro à la fin. 
        str_sort(numeric = TRUE)
      # et on extrait les colonnes avec ces noms !
      ) %>% 
    # on ajoute une colonne pour la note finale...
    mutate(sri = 0)
  # ... et nos résultats sont prêts à être corrigés.
  
  # maintenant on corrige TOUT le monde
  # on va parcourir tous les sujets = le nb de lignes
  for(n_sujet in (1 : nrow(resultats))){
    # on parcourt toutes les questions de la correction = le nb de colonnes
    for(n_question in (1 : length(correction))){
      # maintenant notre condition : si réponse == réponse correcte...
      # (la correction n'a qu'une ligne, d'où le "1")
      if(resultats[n_sujet, n_question] == correction[1, n_question]){
        # ... alors sa note augmente d'un point.
        resultats$sri[n_sujet] <- resultats$sri[n_sujet] + 1
      }
      # on recommence pour toutes les questions...
    }
    # ... et pour tous les participants !
  }
  # resultats contient désormais une colonne "sri" avec toutes les notes
  
  # compression finale du SRI
  df <- df %>% 
    # on supprime toutes les anciennes colonnes sri de data...
    select(-starts_with("sri")) %>% 
    # ... et on récupère la colonne des notes depuis resultats !
    mutate(sri = resultats$sri) %>% 
    # on remet tout le monde dans l'ordre
    select(
      `Result ID`: mai,
      sri,
      everything()
      )
  
  # ----------- Raven : belote et rebelote (Ctrl+C -> ...?)
  
  # on lit le df de correction du Raven
  correction <- read_csv(correction_raven)
  
  # on va créer un petit dataframe dans "resultats"
  resultats <- df %>% 
    # on isole les colonnes du Raven
    select(starts_with("raven")) %>% 
    # on ajoute une colonne pour la note finale...
    mutate(raven = 0)
  # ... et nos résultats sont prêts à être corrigés.
  
  # maintenant on corrige TOUT le monde
  # on va parcourir tous les sujets = le nb de lignes
  for(n_sujet in (1 : nrow(resultats))){
    # on parcourt toutes les questions de la correction = le nb de colonnes
    for(n_question in (1 : length(correction))){
      # maintenant notre condition : si réponse == réponse correcte...
      # (la correction n'a qu'une ligne, d'où le "1")
      if(resultats[n_sujet, n_question] == correction[1, n_question]){
        # ... alors sa note augmente d'un point.
        resultats$raven[n_sujet] = resultats$raven[n_sujet] + 1
      }
      # on recommence pour toutes les questions...
    }
    # ... et pour tous les participants !
  }
  # resultats contient désormais une colonne "raven" avec toutes les notes
  
  # compression finale du Raven
  df <- df %>% 
    # on supprime toutes les anciennes colonnes raven de data...
    select(-starts_with("raven")) %>% 
    # ... et on récupère la colonne des notes depuis resultats !
    mutate(raven = resultats$raven) %>% 
    # on remet tout le monde dans l'ordre
    select(
      `Result ID`: sri,
      raven,
      everything()
      )
  
  
  # --------------------- la collecte de notre précieux rectangle... Enfin ! ---
  return(df) 
  }


# ---- imports tests -----------------------------------------------------------

df <- import_data(
  # les chemins vers nos fichiers JATOS
  jatos_results_path = "./ze_data/jatos_results_20230224195553.txt",
  jatos_meta_path    = "./ze_data/jatos_meta_20230224195557.csv",
  # notre nombre de composantes
  nb_composantes     = 17,
  # les chemins vers les corrections
  correction_sri     = "./ze_data/correction_sri.csv",
  correction_raven   = "./ze_data/correction_raven.csv"
  )

# on check les colonnes de "data"
colnames(df)

# ---- wip ---------------------------------------------------------------------

# maintenant il faut reprendre le design de l'expé, corriger des trucs, tester/
# modifier/ajouter les tâches d'Exp Factory, regarder comment les résultats 
# sortent avec jspsych et OS

# y a que corsi, lecture et wcst de désactivé par rapport à l'expé complète en
# l'état. Donc très peu à faire ici en fait - prochaines étapes :
# - corriger les noms des outputs pour tout le monde
# - rajouter la lecture dans l'expé, sortir 2/3 tests et préparer de quoi 
# - rajouter la lecture dans l'expé, sortir 2/3 tests et préparer de quoi 
#   l'accueillir ici (vraisemblablement juste l'exporter dans "for_cotation")
# - hop done
# - après il faut redesign l'expé :
# - regarder la forme des résultats du wcst
# - comparer corsi actuel et nouveau
# - regarder comment raccourcir le digit span, garder que le reverse + idem pour
#   nouveau corsi


# ---- to-do prévisionnel ------------------------------------------------------

# renommages dans les résultats des composantes de l'expé :
#
# - changer "Row" en "lat"
# - "question" est un placeholder pour "similitudes" et "lecture"

