#
# ---- Création de dataframes de correction pour SRI et Raven ------------------

# ---- SRI ---------------------------------------------------------------------

# on crée un dataframe vide avec un placeholder pour fusionner le reste
correction_sri <- data.frame(placeholder = 0)

# on rentre manuellement nos réponses correctes
reponses_correctes <- c(
  # 1
  "b",
  # 2
  "a", 
  # 3
  "c", 
  # 4
  "c", 
  # 5
  "b", 
  # 6
  "c", 
  # 7
  "a", 
  # 8
  "c", 
  # 9
  "c", 
  # 10
  "b", 
  # 11
  "a", 
  # 12
  "a", 
  # 13
  "a", 
  # 14
  "c", 
  # 15
  "c", 
  # 16
  "d", 
  # 17
  "b", 
  # 18
  "c", 
  # 19
  "c", 
  # 20
  "b", 
  # 21
  "b", 
  # 22
  "c", 
  # 23
  "c", 
  # 24
  "d", 
  # 25
  "b", 
  # 26
  "a", 
  # 27
  "d", 
  # 28
  "d", 
  # 29
  "a", 
  # 30
  "a"
)

# maintenant la création itérative du dataframe :
# on parcourt le vecteur de réponses correctes...
for(i in (seq_along(reponses_correctes))){
  # ... on en récupère une...
  reponse <- reponses_correctes[i]
  # ... on l'ajoute à une nouvelle colonne sans nom...
  correction_sri[, ncol(correction_sri) + 1] <- reponse
  # ... puis on renomme la colonne pour le plaisir.
  colnames(correction_sri)[ncol(correction_sri)] <- paste0("sri_", i)
}

correction_sri <- correction_sri %>% 
  # on supprime la colonne placeholder...
  select(-placeholder) 

# ... et on vérifie que tout est bon (niveau nombre de colonnes notamment) :
correction_sri %>% str()
correction_sri %>% view()

# nettoyage de l'environnement (important de nos jours)
rm(i, reponse, reponses_correctes)

# on va séparer les chunks d'exportation pour pouvoir tester ceux de création des
# dataframes sans exporter à chaque fois (et peut-être écraser de bons csv)

# ---- Raven -------------------------------------------------------------------

# on crée un dataframe vide avec un placeholder pour fusionner le reste
correction_raven <- data.frame(placeholder = 0)

# on rentre manuellement nos réponses correctes
reponses_correctes <- c(
  # 1 a11
  "4",
  # 2 b12
  "5", 
  # 3 c4
  "8", 
  # 4 c12
  "2", 
  # 5 d7
  "5", 
  # 6 d12
  "6", 
  # 7 e1
  "7", 
  # 8 e5
  "1", 
  # 9 e7
  "1",
  # 10 a10
  "3", 
  # 11 b4
  "2", 
  # 12 b9
  "4", 
  # 13 c6
  "4", 
  # 14 c10
  "6", 
  # 15 d8
  "4", 
  # 16 e2
  "6", 
  # 17 e4
  "2", 
  # 18 e9
  "3"
  )

# maintenant la création itérative du dataframe :
# on parcourt le vecteur de réponses correctes...
for(i in (seq_along(reponses_correctes))){
  # ... on en récupère une...
  reponse <- reponses_correctes[i]
  # ... on l'ajoute à une nouvelle colonne sans nom...
  correction_raven[, ncol(correction_raven) + 1] <- reponse
  # ... puis on renomme la colonne pour le plaisir.
  colnames(correction_raven)[ncol(correction_raven)] <- paste0("raven_", i)
}

correction_raven <- correction_raven %>% 
  # on supprime la colonne placeholder...
  select(-placeholder) 

# ... et on vérifie que tout est bon (niveau nombre de colonnes notamment) :
correction_raven %>% str()
correction_raven %>% view()

# nettoyage de l'environnement (important de nos jours)
rm(i, reponse, reponses_correctes)

# ---- exportation des dataframes de réponses correctes dans le bon dossier ----

# SRI
write_csv(correction_sri,"./ze_data/correction_sri.csv")

# Raven
write_csv(correction_raven,"./ze_data/correction_raven.csv")