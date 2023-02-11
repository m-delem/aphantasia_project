---
title: "Profil cognitif des aphantasiques : étude exploratoire des stratégies de compensation spatiales et abstraites"
subtitle: "Simulation de données et analyses prévisionnelles dans le cadre de l'UE 'Data Science'"
author:
  - Maël Delem^[m.delem@univ-lyon2.fr]
  - Colin Fourment^[colin.fourment@univ-lyon2.fr]
  - Thomas Junoy^[thomas.junoy@univ-lyon2.fr]
  - Guillaume Leal de Almeida^[g.leal-de-almeida@univ-lyon2.fr]
date: "2023-02-11"
output:
  pdf_document:
    toc: yes
    toc_depth: 5
    number_sections: yes
    extra_dependencies: float
    keep_md: yes
    fig_height: 8
    fig_width: 10
    df_print: kable
  html_document:
    toc: yes
    toc_depth: '5'
    df_print: paged
lang: "fr"
fontsize: 12pt
geometry: margin=1in
documentclass: article
include-before:
- '`\newpage{}`{=latex}'
bibliography: references.bib
csl: apa.csl
---





<!-- Le manuscrit est divisé en plusieurs documents pour faciliter les modifications locales - ceux-ci sont dans le dossier du Drive. L'output complet du R Markdown (le pdf final) est en pdf dans le Drive, avec le même nom que ce fichier. Les GDoc de ce Drive servent à éditer le texte rédigé du document final : le code R sous-jacent et les analyses des données seront partagées et travaillées sur GitHub, lié localement à RStudio. Le repository GitHub en question : https://github.com/m-delem/aphantasia_project.git -->

\newpage
<!-- Introduction -->







# Introduction

## Imagerie visuelle et aphantasie

L'imagerie visuelle, parfois désignée poétiquement comme le fait de "voir dans les yeux de l'esprit", désigne l'expérience visuelle quasi-perceptive d'images mentales en l'absence du stimulus externe correspondant [@monzelAphantasiaDysikonesiaAnauralia2022; @pearsonHumanImaginationCognitive2019]. L'imagerie visuelle est considérée par la plupart des gens comme un élément central de leur vie mentale quotidienne, dans la mémorisation et la récupération d'informations sur des lieux, des objets ou des personnes connus, dans le vagabondage mental et la rêverie, voire plus généralement dans la créativité [@zemanLivesImageryCongenital2015]. Il a été démontré qu'elle joue un rôle prépondérant dans de nombreux processus cognitifs, tels que la mémoire autobiographique, la mémoire épisodique et la prospection d’évènements futurs [@greenbergRoleVisualImagery2014], la mémoire de travail visuelle [@pearsonHumanImaginationCognitive2019].

Cependant, il a été démontré qu'il pouvait exister une grande variabilité interindividuelle dans l'imagerie visuelle, et que certaines personnes pouvaient même en être totalement dépourvues. L'une des toutes premières études sur l'imagerie visuelle, une enquête menée par Sir Francis Galton en 1880, a apporté les premiers témoignages de la grande variété de la capacité des gens à produire des images mentales. Son "enquête sur la table du petit-déjeuner" invitait les participants à visualiser leur table du matin et à évaluer "l'illumination, la définition et la coloration" des images mentales qu'ils en avaient. À son grand étonnement, il a découvert que certaines personnes interrogées, parmi lesquelles beaucoup de ses collègues, dans ses termes des "hommes de science", ont protesté que l'imagerie mentale leur était inconnue - tout comme les daltoniens ne pouvaient pas concevoir la nature de la couleur, ces personnes ne pouvaient pas concevoir la nature de l'imagerie mentale [@galtonSTATISTICSMENTALIMAGERY1880].     

Il est intéressant de noter que, bien qu'il y ait eu une résurgence des recherches et des débats sur l'imagerie mentale à la fin du siècle qui a suivi (e.g. @kosslynCognitiveNeuroscienceMental1995; @pylyshynMentalImagerySearch2002; @reisbergIntuitionsIntrospectionsImagery2002), cette condition d'"imagination aveugle" n'a pas suscité beaucoup d'attention. Une exception notable est Faw [-@fawConflictingIntuitionsMay2009], qui a soulevé le fait que les théories des chercheurs sur l'imagerie pourraient être fortement biaisées par leur propre expérience subjective de celle-ci. Il a indiqué que les "non-visualiseurs", ignorés par la recherche jusqu'à présent, pourraient représenter 2 à 3 % des personnes, selon son enquête (*N* = 2500). En 2010, Zeman et al. ont rapporté le cas d'un patient qui a perdu la capacité de produire des images mentales après avoir subi une intervention chirurgicale [@zemanLossImageryPhenomenology2010]. L'article a attiré l'attention du public après un reportage dans le magazine *Discovery* [@zimmerBrainLookDeep2010] : bien qu'il s'agisse apparemment d'imagination aveugle "acquise", l'article a conduit de nombreuses personnes à se reconnaître dans cette condition et à contacter l'équipe pour témoigner de leur expérience, avec la différence importante qu'elles avaient toujours eu cette absence d'imagerie. En décrivant leurs cas, Zeman et al. [-@zemanLivesImageryCongenital2015] ont créé le terme "*aphantasie*" pour décrire l'absence d'imagerie mentale.    

L'aphantasie, en tant que terme et phénomène, a attiré l'attention des médias et a entraîné une augmentation importante du nombre de personnes signalant leur cas d'imagerie extrême [@monzelAphantasiaDysikonesiaAnauralia2022]. Les études à grande échelle sur les extrêmes de l'imagerie visuelle suggèrent une prévalence de 2-4% d'aphantasie dans la population générale (@dancePrevalenceAphantasiaImagery2022 : *N* = 1004 ; @dawesCognitiveProfileMultisensory2020 : *N* = 715 ; @fawConflictingIntuitionsMay2009 : *N* = 2500 ; @palermoCongenitalLackExtraordinary2022 : *N* = 490 ; @takahashiDiversityAphantasiaRevealed2022: *N* = 2885 ; @zemanPhantasiaPsychologicalSignificance2020) avec de nombreuses variations (entre 0,5 et 11%) selon les seuils choisis pour caractériser l'affection. L'étude de l'aphantasie est récente, et bien qu'il n'existe pas actuellement de " profil " clairement défini des individus aphantasiques, la recherche a lentement assemblé plusieurs caractéristiques associées à cette condition. 

## Les corrélats de l'aphantasie

### Corrélats cognitifs

### Corrélats comportementaux et physiologiques

### L'aphantasie est elle un trouble ?

### Expériences de vie et "styles cognitifs"

## La disctinction entre imagerie visuelle-objet et visuospatiale

### Voies ventrales et dorsales dans la perception et l'imagerie visuelle

### L'imagerie objet et spatiale chez les aphantasiques

### Des styles cognitifs équilibrés entre imagerie objet et spatiale

### Un "trade-off" entre imagerie objet et spatiale chez les aphantasiques ?


\newpage
<!-- Méthodologie -->






# Expérience

## Méthode

### Participants

### Questionnaires

### Procédure

## Variables et hypothèses

### Variables indépendantes

### Variables dépendantes

### Hypothèses opérationnelles

## Résultats

### Corrélations entre les variables mesurées
\begin{figure}[H]

{\centering \includegraphics[width=0.8\linewidth,height=0.5\textheight,]{aphantasia_project_files/figure-latex/correlation_matrix-1} 

}

\caption{Matrice de corrélation entre les variables mesurées.}\label{fig:correlation_matrix}
\end{figure}

\begin{figure}[H]

{\centering \includegraphics[width=0.8\linewidth,height=0.5\textheight,]{aphantasia_project_files/figure-latex/network_plot-1} 

}

\caption{Graphique en réseau représentant l'intensité des corrélations entre les variables.}\label{fig:network_plot}
\end{figure}



### Analyses des groupes par partition non-supervisée
\begin{figure}[H]

{\centering \includegraphics[width=0.8\linewidth,height=0.5\textheight,]{aphantasia_project_files/figure-latex/cluster_number-1} 

}

\caption{Graphique représentatant l'évalution du nombre idéal de clusters par la méthode 'Within Sum of Squares'}\label{fig:cluster_number}
\end{figure}

\begin{figure}[H]

{\centering \includegraphics[width=0.8\linewidth,height=0.5\textheight,]{aphantasia_project_files/figure-latex/pca_variables-1} 

}

\caption{Représentation de l'analyse en composantes principales des variables mesurées.}\label{fig:pca_variables}
\end{figure}

\begin{figure}[H]

{\centering \includegraphics[width=0.8\linewidth,height=0.5\textheight,]{aphantasia_project_files/figure-latex/k_means-1} 

}

\caption{Représentation des clusters reconnus par la méthode des 'k-means', selon les deux composantes principales de l'ACP.}\label{fig:k_means}
\end{figure}

### Analyse des clusters
\begin{figure}[H]

{\centering \includegraphics[width=0.8\linewidth,height=0.5\textheight,]{aphantasia_project_files/figure-latex/cluster_repatition-1} 

}

\caption{Répartion des groupes par cluster.}\label{fig:cluster_repatition}
\end{figure}

\begin{figure}[H]

{\centering \includegraphics[width=0.8\linewidth,height=0.5\textheight,]{aphantasia_project_files/figure-latex/profiles_radar-1} 

}

\caption{Diagramme représentatant les profils cognitifs associés à chaque cluster, selon quatre dimensions principales : l'imagerie visuelle-objet, l'imagerie visuo-spatiale, le raisonnement et les fonctions exécutives.}\label{fig:profiles_radar}
\end{figure}

\begin{figure}[H]

{\centering \includegraphics[width=0.8\linewidth,height=0.5\textheight,]{aphantasia_project_files/figure-latex/profiles_lollipop-1} 

}

\caption{Représentation alternative des profils cognitifs associés aux clusters.}\label{fig:profiles_lollipop}
\end{figure}

### Différences entre les groupes identifiés

```
## [1] FALSE
```

\begin{figure}[H]

{\centering \includegraphics[width=0.8\linewidth,height=0.5\textheight,]{aphantasia_project_files/figure-latex/object_img_violins-1} 

}

\caption{Comparaison des moyennes de score d'imagerie visuelle-objet entre les quatre groupes identifiés.}\label{fig:object_img_violins}
\end{figure}


```
## [1] FALSE
```

\begin{figure}[H]

{\centering \includegraphics[width=0.8\linewidth,height=0.5\textheight,]{aphantasia_project_files/figure-latex/spatial_img_violins-1} 

}

\caption{Comparaison des moyennes de score d'imagerie visuospatiale entre les quatre groupes identifiés.}\label{fig:spatial_img_violins}
\end{figure}

\newpage
<!-- Discussion -->






# Discussion

\newpage
# Références {-}

<div id="refs"></div>

\newpage
# Annexes {-}
Code complet des analyses :

```r
# 
# ---- Aphantasia Project - Source code ----------------------------------------
# 
# Delem, Fourment, Junoy, Leal De Almeida
# Email : m.delem@univ-lyon2.fr
# Last update : February 11, 2022

# ---- setup -------------------------------------------------------------------

# packages
shelf(
  MASS,       # functions and data frame ecosystem
  easystats,  # modelling, visualization and reporting ecosystem
  ez,         # analysis and visualization of factorial exp
  rstatix,    # pipe friendly statistical functions
  scale,      # scale functions
  corrr,      # correlations
  lme4,       # mixed models
  lmerTest,   # tests in lmer
  cluster,    # cluster analysis
  factoextra, # multivariate data analysis visualization
  GGally,     # more ggplot2 plots
  ggpubr,     # publication plots
  ggradar,    # radar charts
  ggraph,     # auto graph layout
  igraph,     # network graphs
)

# global theme
theme_set(theme_bw(base_size = 14, base_family = "serif"))

# random seed
set.seed(14051998)

# Simulation des donnees

# definition des variables et groupes
# groupe non-aphantasique
Non_A <- data.frame(
  name = c("OSIQ_O", "OSIQ_S", "VVIQ",
           "Raven", "Simili", "Wason",
           "Empan_MDT", "WCST", "Lecture",
           "Corsi","MRT", "SRI"),
  mean = c(54.6,  46.2,  63.8,
           20.9,  37.8,  32.2,
           6.43,  32.1,  50.2,
           5.81,  16.5,  35.7),
    sd = c(8.45,  9.54,  9.67,
           5.34,  4.25,  3.78,
           2.12,  5.32,  8.89,
           1.87,  3.54,  6.23),
  group = ("Non_A") %>% factor(),
  n_subjects = 200
)

# groupe aphantasique
Aph <- data.frame(
  name = c("OSIQ_O", "OSIQ_S", "VVIQ",
           "Raven", "Simili", "Wason",
           "Empan_MDT", "WCST", "Lecture",
           "Corsi","MRT", "SRI"),
  
  mean = c(32.5,  58.9,  30.2,
           23.6,  42.2,  36.1,
           7.53,  33.8,  48.4,
           6.8,   18.2,  38.5),
  
    sd = c(8.45,  9.54,  9.67,
           4.24,  6.15,  3.47,
           1.45,  2.62,  9.67,
           1.65,  5.78,  8.21),
  group = ("Aph") %>% factor(),
  n_subjects = 200
)

# dataset fusionné
variables <- bind_rows(Aph,Non_A)
rm(Aph,Non_A)

# liens variables-capacites cognitives
fmodel <- matrix(c ( .8,   0,  0,  0,  0, # OSIQ-O = img objet
                      0,  .9,  0,  0,  0, # OSIQ-S = img spatiale
                     .9,   0,  0,  0,  0, # VVIQ = img objet
                     .1,  .3, .8,  0,.05, # Raven = raisonnmt > img s/o > flex
                    -.2,   0, .6,  0, .1, # Simili = raisonnmt >  flex
                    -.1,   0, .3,  0,  0, # Wason = raisonnmt
                      0,   0,  0, .8,  0, # Empan = MDT 
                    -.1,   0, .2,  0, .6, # WCST = Flex > raisonnmt
                     .4,   0, .6,  0,  0, # Lecture = img objet > raisonnmt
                     .1,  .7,  0, .8,  0, # Corsi = MDT > img s
                     .2, .85,  0,  0,  0, # MRT = img s
                     .1,  .9,  0,  0,  0  # SRI = img s
                    ), 
                 nrow=12, ncol=5, byrow=TRUE)

# liens entre capacites cognitives
effect <- matrix(c (  1,-.1,-.1, .2,  0, # img o
                    -.1,  1, .3, .2,  0, # img s
                    -.1, .3,  1,  0, .2, # raisonnmt
                     .2, .2,  0,  1,  0, # MDT
                      0,  0, .2,  0,  1  # flex
                     ),
                 nrow=5, ncol=5, byrow=TRUE)

# fonction de simulation
simulation <- function(variables, fmodel, effect) {
  
  ### preparatifs ###
  n_variables <- dim(fmodel)[1] # notre nb de mesures/variables (rows)
  n_skills <- dim(fmodel)[2]    # les capacites sous-jacentes evaluees (columns)
  
  # matrice de poids des erreurs
  errorweight <- (1 - diag(fmodel %*% t(fmodel))) %>% 
                  abs() %>%   # necessaire pour la racine carree
                  sqrt() %>%  # doit avoir des arguments positifs
                  diag()      # recree une matrice diagonalisee
  
  # initialisation d'un dataframe vide
  data <- data.frame()
  
  ### simulation ###
  for (i in levels(variables$group)){   # on simule separement chaque groupe
    
    var_group = variables %>% filter(group == i) # donnees du groupe isolees
    n_subjects = var_group$n_subjects[1]         # nb de sujets dans le groupe
    group = i                                    # nom du groupe
    
    # generation de scores aleatoires normaux pour chaque capacite cognitive
    randomscores <- matrix(rnorm(n_subjects * (n_skills)),
                           nrow = n_subjects,
                           ncol = n_skills)
    # ponderation par la matrice d'effets = les scores sont desormais correles
    # entre eux
    skillscores <- randomscores %*% effect
    
    # genere les valeurs standardisees des mesures/variables grace a fmodel 
    observedscores <- skillscores %*% t(fmodel)
    
    # generation d'erreurs normales pour chaque mesure/variable
    randomerror <- matrix(rnorm(n_subjects * (n_variables)), 
                          nrow = n_subjects,
                          ncol = n_variables)
    # ponderation par notre matrice de poids des erreurs
    error <- randomerror %*% errorweight
    
    # nos mesures effectives = les valeurs reeles + une erreur standard
    measures <- observedscores + error
    
    # on cree un dataframe avec le nom de groupe
    data_group <- data.frame(measures) %>% 
      mutate(Group = group %>% factor())
    
    # ajout des valeurs reeles de moyenne et d'ecart-type pour chaque variable 
    # et renommage
    for (i in 1:length(var_group$name)){
      data_group[,i] = data_group[,i]*var_group$sd[i] + var_group$mean[i]
      colnames(data_group)[i] = var_group$name[i]
      }
    
    # fusion avec le dataframe complet
    data <- bind_rows(data,data_group)
    }
  
  # ajout d'id individuels et stats demographiques
  n = length(data[,1])  # nombre total de participants
  data <- data %>% 
    mutate(Subject_nr = row_number() %>% as.character(),
           Sex = (c("H","F") %>% rep(times = n/2) %>% factor()),
           Age = seq(from = 16, to = 55, by = 1) %>% sample(size = n, 
                                                            replace = TRUE)
           ) %>% 
    relocate(Subject_nr)

  # mission accomplished!
  return(data)  
  }

# la fonction est donc clefs en main
data <- simulation(variables,fmodel,effect)

# standardisation
# Paradoxalement on va defaire ce qu'on a construit avec les moyennes,
# en re-standardisant tous les scores sous forme de z-scores
data_scale <- data %>% 
  select(OSIQ_O:SRI) %>% 
  mutate(across(everything(), ~ scale(.x)))

# k-means clustering
data_kmeans <- kmeans(data_scale, 
                      centers = 4,
                      nstart = 100)

# on ajoute les clusters aux donnees des participants
data <- data %>% mutate(Cluster = data_kmeans$cluster %>% factor())

# Profils cognitifs sous-jacents des clusters
# on fusionne les scores des composantes proches
deep <- data %>% 
  mutate(Spatial_Img = OSIQ_S + Corsi + MRT + SRI,
         Object_Img = OSIQ_O + VVIQ,
         Reasoning = Raven + Simili + Wason,
         Executive = Empan_MDT + WCST + Lecture) %>% 
  select(Spatial_Img : Executive, Cluster) %>% 
  mutate(across(c(Spatial_Img : Executive), 
                ~ rescale(.x, to = c(0,1))),)

# on cree un dataset d'analyse avec les variables continues standardisees
# (pour plus tard)
data_analysis <- data %>% 
  mutate(across(c(-Subject_nr,-Group,-Sex,-Age,-Cluster), 
                ~ scale(.x))
  )

# ---- correlation_matrix ------------------------------------------------------
# package "correlations" de easystats
data_scale %>% 
  correlation(partial = TRUE) %>% 
  cor_sort() %>% 
  summary() %>% 
  visualisation_recipe(
    labs = list(title = "Correlations entre les variables mesurees")) %>% 
  plot() +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())

# ---- network_plot ------------------------------------------------------------
# graphe en reseau (corrr, igraph & ggraph)
data_scale %>%
  correlate() %>% 
  stretch %>% 
  filter(abs(r) >= .1) %>% 
  mutate(x = replace(x, x == "Empan_MDT", "Empan"),
         y = replace(y, y == "Empan_MDT", "Empan")) %>% 
  graph_from_data_frame(directed = FALSE) %>% 
  ggraph() +
    geom_edge_arc(strength = 0.1,
                  aes(edge_alpha = abs(r),
                      edge_width = abs(r),
                      colour = r)) +
    guides(edge_alpha = "none", edge_width = "none") +
    scale_edge_colour_gradientn(limits = c(-1, 1), 
                                colors = c("firebrick2", "dodgerblue2")) +
    geom_node_point(size = 20) +
    geom_node_text(aes(label = name,
                       family = "serif"),
                   colour = "white",
                   repel = FALSE) +
    theme_graph(base_family = "serif", base_size = 10) +
    #theme(legend.position = "none") +
    labs(title = "Correlations entre les variables mesurees")

# ---- mixed_matrix ------------------------------------------------------------
# matrice avec graphes et distributions
# GGally package
data_scale %>% 
  mutate(across(everything(), ~as.numeric(.x))) %>% 
  ggpairs(title = "Correlations et distributions des variables mesurees",
          lower = list(continuous = wrap("points", alpha = 0.2)),
          )

# ---- cluster_number ----------------------------------------------------------
data_scale %>% 
  fviz_nbclust(kmeans, method = "wss",
               linecolor = "white") +
  geom_vline(xintercept = 4, linetype = 2) +
  theme_bw(base_size = 14, base_family = "serif") +
  geom_line(aes(group = 1), color = "aquamarine2",size = 1.3) + 
  geom_point(group = 1, size = 3, color = "aquamarine4") +
  labs(title = "Nombre optimal de clusters (methode `Within Sum of Squares`)",
       x = "Nombre de clusters",
       y = "Total des Somme des Carres intra-clusters")

# ---- pca_variables -----------------------------------------------------------
data_scale %>% 
  prcomp(scale = TRUE) %>% 
  fviz_pca_var(repel = TRUE,
               col.var = "contrib",
               title = "Analyse en Composantes Principales des variables") + 
  theme_bw(base_size = 14, base_family = "serif") +
  theme(axis.text.x=element_blank(),
        axis.ticks.x=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank()) +
  labs(x = "Dimension 1 (40.7%)",
       y = "Dimension 2 (18.4%)")

# ---- k-means -----------------------------------------------------------------
data_kmeans %>% 
  fviz_cluster(
    data_scale,
    geom = "point",
    repel = TRUE,
    ellipse.type = "convex",
    shape = "circle", pointsize = 1.2,
    main = 
      "Representation des clusters selon les deux composantes principales",
    xlab = "Dimension 1 (40.7%)",
    ylab = "Dimension 2 (18.4%)",
    ) +
  theme_bw(base_size = 14, base_family = "serif")

# ---- cluster_repatition ------------------------------------------------------
# repartion des groupes par cluster
data %>% 
  ggbivariate(outcome = "Group",
              explanatory = "Cluster") +
  scale_fill_manual("Groupe", 
                    values = c("aquamarine2", "coral"),
                    labels = c("Aphantasiques","Non-Aphantasiques")) +
  labs(title = 
    "Repartition des aphantasiques et non-aphantasiques dans les clusters")

# ---- profiles_radar ----------------------------------------------------------
deep %>%
  group_by(Cluster) %>%  
  summarise(across(everything(),mean)) %>% 
  ggradar(base.size = 10,
          font.radar = "serif",
          values.radar = c("0","0.5","1"),
          grid.label.size = 4,
          axis.labels = c( "Imagerie Spatiale",
                           "Imagerie\n Objet", 
                           "Raisonnement",
                           "Fonctions\n Executives"),
          grid.min = 0, grid.mid = .5, grid.max = 1,
          label.gridline.min = FALSE,
          group.line.width = 1, group.point.size = 3,
          group.colours =,
          background.circle.transparency = .1,
          legend.title = "Clusters",
          legend.text.size = 12,
          legend.position = "bottom",
          plot.title = "Profils cognitifs des clusters identifies 
par partition non-supervisee (k-means)",
          fill = TRUE,
          fill.alpha = 0.1
  ) + 
  theme_bw(base_size = 14, base_family = "serif") +
  theme(axis.text.x=element_blank(),
        axis.ticks.x=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank()) +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())
  #facet(facet.by = "Cluster")

# ---- profiles_lollipop -------------------------------------------------------
deep %>% 
  gather(key = variable, value = value, -Cluster) %>% 
  mutate(variable = replace(variable, variable == "Spatial_Img", "Imagerie\n Spatiale"),
         variable = replace(variable, variable == "Reasoning", "Raisonnement"),
         variable = replace(variable, variable == "Object_Img", "Imagerie\n Objet"),
         variable = replace(variable, variable == "Executive", "Fonctions\n Exectutives")) %>% 
  group_by(variable, Cluster) %>% 
  summarise(mean = mean(value)) %>% 
  ggdotchart(
    x = "variable",
    y = "mean",
    group = "Cluster",
    color = "Cluster", size = 1, dot.size = 3,
    palette = "aas",
    add = "segment",
    position = position_dodge(0),
    #sorting = "descending",
    #facet.by = "Cluster",
    #rotate = TRUE,
    #legend = "none",
    ggtheme = theme_bw(base_size = 14, base_family = "serif"),
    xlab = "Fonctions Cognitives",
    ylab = "Moyennes",
    title =
      "Scores aux differentes fonctions cognitives en fonction des clusters"
    ) +
  geom_smooth(aes(group = Cluster, color = Cluster),size = .8) +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        )

# ---- object_img_violins ------------------------------------------------------
# Comparaisons de moyennes entre clusters par variable

# Object mean comparison
data %>% 
  ggplot(aes(x = Cluster,reorder(1, 2, 3, 4),
             y = OSIQ_O,
             fill = Cluster,)) +
  geom_violin(alpha = 0.3,
              position = position_dodge(1),
              draw_quantiles = FALSE,) +
  geom_boxplot(alpha = 0.6,
               position = position_dodge(1),
               width = 0.15,) +
  # significance indicator labels
  stat_compare_means(comparisons = list(c("1","2"),
                                        c("3","4"), 
                                        c("1","4")
  ),
  method = "t.test",
  label = "p.format",
  # height of the labels
  label.y.npc = c("top")) +
  # different filler colors
  scale_fill_brewer(palette = "Dark2") +
  scale_colour_brewer(palette = "Dark2") +
  labs(title = "Distribution des scores d'imagerie visuelle-objet par cluster",
       x = "Cluster",
       y = "Score à l'OSIQ Object Scale")

#---- spatial_img_violins
# Spatial mean comparison
data %>% 
  ggplot(aes(x = Cluster,reorder(1, 2, 3, 4),
             y = OSIQ_S,
             fill = Cluster,)) +
  geom_violin(alpha = 0.3,
              position = position_dodge(1),
              draw_quantiles = FALSE,) +
  geom_boxplot(alpha = 0.6,
               position = position_dodge(1),
               width = 0.15,) +
  # significance indicator labels
  stat_compare_means(comparisons = list(c("1","2"),
                                        c("2","3"), 
                                        c("3","4"),
                                        c("1","4")
  ),
  method = "t.test",
  label = "p.format",
  # height of the labels
  label.y.npc = c("top")) +
  # different filler colors
  scale_fill_brewer(palette = "Dark2") +
  scale_colour_brewer(palette = "Dark2") +
  labs(title = "Distribution des scores d'imagerie visuospatiale par cluster",
       x = "Cluster",
       y = "Score à l'OSIQ Spatial Scale")
```
