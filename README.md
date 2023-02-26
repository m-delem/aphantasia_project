# Du Profil Cognitif des Aphantasiques

Code et manuscrit de l'étude exploratoire sur l'aphantasie conduite au laboratoire EMC de l'Université Lumière Lyon 2 sur le premier et deuxième trimestre 2023 par Maël DELEM et Sema TURKBEN sous la direction de Gaën PLANCHER et Eddy CAVALLI.

## Manuscrit et analyses pour le projet de simulation et d'analyse prévisionnelle (finalisés le 16/02/2023)

Le code de simulation et d'analyse est la dernière version de `/zc_scripts/aphantasia_source_simu.R`. 

Le fichier de base du manuscrit est `simu_0_aphantasia.qmd`, créé sur RStudio via Quarto et une distribution LaTeX. Il appelle ses racines `simu_a_header.tex` et `simu_b_beforebody.tex`, ainsi que ses branches `simu_1_intro.Rmd`, `simu_2_methode.Rmd`, `simu_3_resultats.Rmd`, `simu_4_discussion.Rmd`, `simu_5_annexes.Rmd` pour générer le .pdf `simu_0_aphantasia.pdf`.

La liste intégrale des références au format BibTex est dans le fichier `simu_references.bib`.

## Traitement des données réelles

Les données seront récupérées sur JATOS sous forme de deux fichiers, un fichier `jatos_results.txt` composé d'une concaténation des JSON de résultats de toutes les composantes JATOS passées par tous les participants, et un fichier `jatos_meta.csv` avec des données essentielles pour associer un ensemble de données à un seul id. Ces données seront stockées dans le dossier `ze_data`.

Le traitement de telles données implique de traduire le premier fichier `.txt` en `.csv` sans faire de mélange des résultats d'un sujet à l'autre, puis d'y accoler le second pour récupérer les informations de chaque sujet. Le code utilisé pour réaliser cette tâche puis pour nettoyer les données (calcul des scores et suppression des colonnes multiples, cumul des questions, etc.) est dans la dernière version de `zc_scripts/data_import.R`. Celui-ci produit simplement une fonction, `import_data()` : elle peut donc être importée dans n'importe quel autre script d'analyse en appelant `source(zc_scripts/data_import.R)`, puis en utilisant la fonction sur place.

## Analyses de données

La procédure d'analyse de données sera codée dans `/zc_scripts/aphantasia_source_real.R`

## Manuscrit final

Le code des analyses, figures et tables sera issu de `/zc_scripts/aphantasia_source_real.R`. Le tronc du manuscrit sera donc `0_aphantasia.qmd`, qui utilisera ses racines `0_1_header` et `0_2_beforbody`, ainsi que ses branches `1_intro.Rmd`, `2_methode.Rmd`, `3_resultats.Rmd`, `4_discussion.Rmd` et `5_annexes.Rmd`.

La liste intégrale des références au format BibTex sera dans le fichier `6_references.bib`.
