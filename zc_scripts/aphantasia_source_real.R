# 
# ---- Aphantasia Project - Source code ----------------------------------------
# 
# Delem, M., Turkben, S., Plancher, G., Cavalli, E.
# Email : m.delem@univ-lyon2.fr

# ---- setup -------------------------------------------------------------------

# packages
shelf(
  ggpubr,     # publication plots
  ggradar,    # radar charts
  cluster,     # self-explanatory
  factoextra,
  jsonlite
  )

# thème esthétique global
theme_set(theme_bw(base_size = 14, base_family = "serif"))

# récupération de la fonction pour importer les données
source(zc_scripts/data_import.R)

# les chemins vers nos fichiers JATOS
jatos_results <- "./ze_data/jatos_results_XXXXXXXXXXX"
jatos_meta <- "./ze_data/jatos_meta_XXXXXXXXXX"
# (à noter : la partie xxxxx indique la date d'export, ça peut être utile)

# les chemins vers les corrections
correction_sri <- "ze_data/correction_sri.csv"
correction_raven <- "ze_data/correction_raven.csv"

# notre nombre de composantes
nb_composantes <- x

# import des données toutes prêtes dans un dataframe 
data <- import_data(
  jatos_results, 
  jatos_meta, 
  nb_composantes,
  correction_sri,
  correction_raven)

# ---- analyses de données ------------------------------------------------------
#
# ---- previous pca and clustering ---------------------------------------------
# data_latent <- 
#   factor_analysis(data_standardisee,
#                   rotation = "cluster",
#                   n = 3,
#                   sort = TRUE,
#                   standardize = TRUE) %>% 
#   predict(names = c("Imagerie Spatiale", 
#                     "Imagerie Objet",
#                     "Raisonnement"))
# 
# # ajout des clusters identifiés
# data_latent$cluster <- 
#   cluster_analysis(data_standardisee, n = 4, method = "hkmeans") %>%
#   predict() %>% 
#   as.factor()

# ---- descriptives ------------------------------------------------------------
datascores %>% 
  report() %>% 
  as.data.frame() %>% 
  summary() %>%
  select(Variable:Max) %>%
  mutate(
    Variable=replace(Variable,Variable=="OSIQ_O","OSIQ-Objet"),
    Variable=replace(Variable,Variable=="OSIQ_S","OSIQ-Spatial"),
    Variable=replace(Variable,Variable=="Empan_MDT","Empan verbal"),
    Variable=replace(Variable,Variable=="Lecture","Compréhension en lecture")
  ) %>% 
  knitr::kable(row.names = FALSE,
               caption = "Statistiques descriptives de l'ensemble des variables mesurées : Moyenne (*Mean*), Écart-type (*SD*), Minimum (*Min*) et Maximum (*Max*).\\label{descriptives}")

# ---- correlation_matrix ------------------------------------------------------
datascores %>% 
  mutate(across(everything(), ~ scale(.x))) %>% 
  correlation(partial = TRUE) %>% 
  cor_sort() %>% 
  summary() %>% 
  plot() +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank()) +
  labs(title = NULL)

# ---- ggm_graph ----------------------------------------------------------------
datascores %>%
  correlation(partial = FALSE) %>%
  filter(abs(r) >= .3) %>% 
  mutate(Parameter1 = replace(Parameter1, Parameter1 == "Empan_MDT", "Empan"),
         Parameter2 = replace(Parameter2, Parameter2 == "Empan_MDT", "Empan")) %>%
  plot() +
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
  theme_graph(base_family = "serif", base_size = 10)

# ---- mfa_graph ---------------------------------------------------------------
# check_factorstructure(datascores)
# n_factors(datascores, rotation="cluster") 

datascores %>% 
  prcomp(scale = TRUE) %>% 
  fviz_pca_var(repel = TRUE,
               col.var = "contrib",
               title = "Analyse Factorielle Multiple des variables",
  ) + 
  theme_bw(base_size = 14, base_family = "serif") +
  theme(axis.text.x=element_blank(),
        axis.ticks.x=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank()) +
  labs(x = "Dimension 1 (43.2%)",
       y = "Dimension 2 (34.4%)")

# ---- loadings_graph ----------------------------------------------------------
factor_analysis(datascores, 
                rotation = "cluster",
                n = 3,
                sort = TRUE,
                standardize = TRUE) %>% 
  plot() + labs(title=NULL)

# Rotated loadings from factor analysis

# ---- loadings_tbl ------------------------------------------------------------
factor_analysis(datascores, 
                rotation = "cluster",
                n = 3,
                sort = TRUE,
                standardize = TRUE,) %>% 
  summary() %>%
  knitr::kable(caption = "Analyses des performances en termes de variance expliquée des facteurs détérminés selon une rotation adaptée à une analyse de clusters.\\label{loadings_tbl}",
               digits = 3)

# ---- loadings_graph_annex ----------------------------------------------------------
factor_analysis(datascores, 
                rotation = "cluster",
                n = 4,
                sort = TRUE,
                standardize = TRUE) %>% 
  plot() + labs(title=NULL)

# Rotated loadings from factor analysis

# ---- kmeans_plot -------------------------------------------------------------

kmeans(datascores %>% mutate(across(everything(), ~ scale(.x))), 
       centers = 4,
       nstart = 100) %>%
  fviz_cluster(
    datascores,
    geom = "point",
    repel = TRUE,
    ellipse.type = "convex",
    shape = "circle", pointsize = 1.2,
    xlab = "Dimension 1 (40.2%)",
    ylab = "Dimension 2 (18.7%)",
    ) +
  theme_bw(base_size = 14, base_family = "serif") +
  labs(title = NULL)

#"Représentation des clusters selon les deux composantes principales"

# ---- radar -------------------------------------------------------------------
p <- data_latent %>%
  group_by(cluster) %>%  
  summarise(across(everything(),mean)) %>% 
  mutate(across(-cluster, ~ rescale(.x, to = c(0,1))),) %>% 
  ggradar(base.size = 10,
          font.radar = "serif",
          values.radar = c("0","0.5","1"),
          grid.label.size = 4,
          grid.min = 0, grid.mid = .5, grid.max = 1,
          label.gridline.min = FALSE,
          group.line.width = 1, group.point.size = 3,
          group.colours =,
          background.circle.transparency = .1,
          legend.title = "Clusters",
          legend.text.size = 8,
          axis.label.size = 4,
          legend.position = "bottom",
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

facet(p,facet.by = "cluster")

# Profils cognitifs des clusters identifies par partition non-supervisee (*hierachical k-means*)"

# ---- repartition ------------------------------------------------------
data_latent %>% 
  group_by(cluster) %>% 
  summarise(across(everything(),mean)) %>% 
  rename(Cluster = cluster) %>% 
  mutate(`Aphantasiques` = c(29,42,126,0) ,
         `Non-Aphantasiques` = c(49,73,0,81)) %>% 
  knitr::kable(
    caption =
      "Moyennes évaluées à chaque compétence et répartion des effectifs par cluster.\\label{repartition}",
    row.names = FALSE
  )

# ---- lollipop ----------------------------------------------------------------
data_latent %>% 
  mutate(across(-cluster, ~ rescale(.x, to = c(0,1))),) %>% 
  gather(key = variable, value = value, -cluster) %>% 
  group_by(variable, cluster) %>% 
  summarise(mean = mean(value)) %>% 
  ggdotchart(
    x = "cluster",
    y = "mean",
    group = "variable",
    color = "variable", size = 1, dot.size = 3,
    palette = "aas",
    add = "segment",
    position = position_dodge(.5),
    sorting = "descending",
    #facet.by = "cluster",
    rotate = TRUE,
    #legend = "none",
    ggtheme = theme_bw(base_size = 14, base_family = "serif"),
    xlab = "Cluster",
    ylab = "Moyennes",
    # title =
    #   "Scores aux differentes fonctions cognitives en fonction des clusters"
  ) +
  # geom_smooth(aes(group = cluster, color = cluster),size = .8) +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
  )
    
# Représentation des moyennes de chaque cluster pour les trois capacités cognitives
  
# ---- analyses pour clusters
# data_latent %>% check_clusterstructure()
# data_latent %>% n_clusters() %>% plot()
# cluster_analysis(datascores, n = 2, method = "hkmeans")
# cluster_analysis(data_latent, n = 4, method = "hkmeans")

# # ---- modélisation et tests
# model1c <- lm(Raisonnement ~ 0 + cluster,data_latent)
# model2c <- lm(`Imagerie Objet` ~ 0 + cluster,data_latent)
# model3c <- lm(`Imagerie Spatiale` ~ 0 + cluster,data_latent)
# 
# model1c %>% check_model()
# model1c %>% report()