# Du Profil Cognitif des Aphantasiques

Code et manuscrit de l'étude exploratoire sur l'aphantasie conduite au laboratoire EMC de l'Université Lumière Lyon 2 sur le premier et deuxième trimestre 2023 par Maël DELEM et Sema TURKBEN sous la direction de Gaën PLANCHER et Eddy CAVALLI.

## Manuscrit et analyses pour le projet de simulation et d'analyse prévisionnelle (Février 2023)

Le code utilisé est la dernière version de `\zc_scripts\aphantasia_source_simu.R`. 

Le fichier de base du manuscrit est `simu_0_aphantasia.qmd`, créé sur RStudio via Quarto et une distribution LaTeX, qui appelle `simu_a_header`, `simu_b_beforebody`,`simu_1_intro`, `simu_2_methode`, `simu_3_resultats`, `simu_4_discussion`, `simu_5_annexes` pour générer le .pdf `simu_0_aphantasia.pdf`.

La liste intégrale des références au format BibTex est dans le fichier `simu_references.bib`.

## Traitement des données réelles

Les données seront récupérées sur JATOS sous forme de deux fichiers, un fichier `jatos_results.txt` composé d'une concaténation des JSON de toutes les composantes passées par tous les participants, et un fichier `jatos_meta.csv` avec des données essentielles pour associer un ensemble de données à un seul id. Ces données seront stockées dans le dossier `ze_data`.

Le traitement de telles données implique de traduire le premier fichier en .csv sans faire de mélange des résultats d'un sujet à l'autre, puis d'y accoler le second pour les informations. Le code utilisé pour réaliser cette tâche puis pour nettoyer les données (calcul des scores et suppression des colonnes multiples, cumul des questions, etc.) est la dernière version de `zc_scripts\import_data.R`.
