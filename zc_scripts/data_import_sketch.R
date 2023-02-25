#
# ébauche de la future fonction import_data
#

# ---- packages
shelf(jsonlite)
#
# ce qu'on rentrera manuellement dans la fonction :

# nos chemins vers les données :
jatos_results <- "ze_data/jatos_results_20230224195553.txt"
jatos_meta <- "ze_data/jatos_meta_20230224195557.csv"
correction_sri <- "ze_data/correction_sri.csv"
correction_raven <- "ze_data/correction_raven.csv"

# notre nombre de composantes :
nb_composantes <- 17



# ---- première fonction : expecto_data ----------------------------------------

# on va créer une fonction pour importer les données depuis le jatos_results.txt
# et le jatos_meta.csv dans un dataframe propre

expecto_data <- function(jatos_results_path, jatos_meta_path, nb_composantes){
  # jatos_results_path : le chemin vers les résultats relativement au 
  #                      "working directory" - dans ce dossier:
  #                      "ze_data/jatos_results.txt"
  # jatos_meta_path : idem pour métadonnées, ici "ze_data/jatos_meta"
  # 
  # nb_composantes : le nombre de composantes de l'expérience sur jatos
  
  # Commençons
  
  # on vient lire le fichier texte
  composantes <- read_file(jatos_results_path) %>%
    # ... on sépare en lignes ...
    str_split('\n') %>% first() %>% 
    # ... enlève la dernière ligne toujours vide ...
    discard(function(x) x == '')
  # ... Et on a donc notre liste de composantes sous forme de strings JSON.
  
  # on initialise notre dataframe terminal
  data = data.frame()
  
  # on va maintenant le remplir itérativement en parcourant "composantes"
  # on prépare un compteur de tours
  compteur <- 0
  
  # on forme un sujet caméléon (avec un placeholder "1" pour "bind_cols")
  sujet <- list(1)
  
  # Puis vient notre boucle itérative :
  # on parcourt toutes les composantes individuelles sans regarder qui est où =
  # imaginons une production continue de pâte à churros
  for (i in (1:length(composantes))){
    
    # on ajoute les colonnes des composantes à chaque tour au sujet caméléon
    sujet <- bind_cols(sujet,jsonlite::fromJSON(composantes[i]))
    
    # notre compteur de composantes grossit
    compteur <- compteur + 1
    
    # si le compteur atteint le nombre de composantes par sujet ...
    if (compteur == nb_composantes){
      # ... on réinitialise le compteur ...
      compteur <- 0
      # ... on ajoute notre sujet au dataframe ...
      data <- bind_rows(data,sujet)
      # ... puis on réinitialise notre sujet caméléon.
      sujet <- list(1)
      
      # On a coupé la churros ! L'itération continue et la pâte recommence...
      } 
    # ... Jusqu'à avoir parcouru toutes les composantes du .txt sorti par JATOS.
    # (toute la pâte, si l'analogie vous a plu.)
    }
  
  # on enlève notre colonne "placeholder" composée que de "1"...
  # et le consentement, qui sera forcément "oui" si les gens ont participé
  data <- data %>% select(- c(...1, consentement))
  
  # on accole le dataframe de métadonnées à gauche
  data <- bind_cols(read_csv(jatos_meta_path), data)
  
  # ... et on récupère notre dataframe prêt à être nettoyé !
  return(data) 
}

# ---- importation manuelle ----------------------------------------------------

# faisons tourner ça : expecto dataframum !
data <- expecto_data(jatos_results, jatos_meta, nb_composantes)

# ---- tidying_data ------------------------------------------------------------

# on va nettoyer les données en calculant tous les scores qu'on va utiliser et
# en supprimant toutes les colonnes des réponses individuelles

# ---- ETAPES FAITES -----------------------------------------------------------
data <- data %>% 
  mutate(
    # -------- VVIQ : on additionne simplement toutes les colonnes
    vviq = rowSums(across(starts_with("vviq")), na.rm = TRUE),
    
    # -------- OSVIQ : idem
    osviq = rowSums(across(starts_with("osviq")), na.rm = TRUE),
    
    # ... puis on supprime toutes les colonnes qui ont été utilisées.
    .keep = "unused",
    ) %>% 
  
  # --------- MAI : on convertit en 0 ou 1
  mutate(across(starts_with("mai"), ~ifelse(.x == TRUE, 1, 0)),) %>%
  # on additionne tout...
  mutate(mai = rowSums(across(starts_with("mai")), na.rm = TRUE),
         # ... et on ne garde que notre résultat.
         .keep = "unused") %>% 

  # --------- latéralité : on la convertit en 1, 0 ou -1
  mutate(
    across(starts_with("Row"),
           ~case_when(.x == "gauche" ~ 1,
                      .x == "ambi" ~ 0,
                      .x == "droite" ~ -1,
                      is.na(.x) ~ 0))) %>% 
  # on fait la "moyenne de la latéralité"...
  mutate(lateralite = rowMeans(across(starts_with("Row"))),
         # ... et on ne garde que notre résultat.
         .keep = "unused") %>% 
  # on décide de la latéralité "globale" du sujet
  mutate(lateralite = ifelse(lateralite > 0, "gaucher", "droitier"),
         # à noter que les ambidextres ont été considérés droitiers
  ) %>% 
  
  # --------- Enfin... on remet tout le monde dans l'ordre.
  select(
    `Result ID`:vision, 
    lateralite, 
    vviq, 
    osviq, 
    mai, 
    # sri, 
    everything(),
    )

# nettoyage des NA s'il y en a 
if (any(is.na(data))){
  data <- data %>% 
    # remplacer les NA textuels par "" ...
    mutate_if(is.character, ~replace_na(.,"")) %>% 
    # ... et les NA numériques par 0
    mutate_if(is.numeric, ~replace_na(.,0))
}
# ---- ETAPES EN CONSTRUCTION --------------------------------------------------




# on crée une colonne vide avec le score au sri
data <- data %>% 

# on lit le df de correction
correction <- read_csv(correction_sri)

# resultats va prendre un subset avec les colonnes du SRI
resultats <- data %>% 
  # on ajoute d'abord une colonne pour la note finale
  mutate(sri = 0) %>% 
  # on va maintenant sélectionner les colonnes en question
  select(
  # on s'assure du bon ordre des colonnes :
  str_sort(
    # donc on prend le nom des colonnes...
    colnames(
      # ... qui commencent par "sri"...
      data %>% select(starts_with("sri"))),
    # ... et on les trie selon le numéro à la fin.
    numeric = TRUE)
  # la sélection est faite !
  )

# maintenant on corrige tout le monde
# on va parcourir tous les sujets = le nb de lignes
for(n_sujet in (1 : nrow(resultats))){
  # on parcourt toutes les questions de la correction = le nb de colonnes
  for(n_question in (1 : length(correction))){
    # maintenant notre condition : si réponse == réponse correcte...
    # (la correction n'a qu'une ligne, d'où le "1")
    if(resultats[n_sujet, n_question] == correction[1, n_question]){
      # ... alors sa note augmente d'un point.
      data$sri[n_sujet] = data$sri[n_sujet] + 1
    }
  }
}

# on enlève toutes les colonnes sri
data %>% select(-starts_with("sri"))
# ---- 
