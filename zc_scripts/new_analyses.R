

# And Clustering ?
check_clusterstructure(datanum)
# Clustering tendency
# The dataset is suitable for clustering (Hopkins H = 0.28).

# Loadings from Factor Analysis (no rotation)
# En fait nous c'est plutôt une analyse de facteurs !
# Dacodac donc -> la bonne factor analysis :
n_factors(datanum, rotation="cluster") %>% plot()
# 3 est le nombre idéal, mais 4 a l'air intéressant aussi, avec une composante mnésique qui vient s'ajouter
factor_analysis(datanum, 
                rotation = "cluster",
                n = 3,
                sort = TRUE,
                threshold = 0.2,
                standardize = TRUE) %>% 
  plot()
# WOW
factor_analysis(datanum, 
                rotation = "cluster",
                n = 3,
                sort = TRUE,
                threshold = 0.2,
                standardize = TRUE) %>% 
  summary()

data_latent <- factor_analysis(datanum,
                               rotation = "cluster",
                               n = 3,
                               sort = TRUE,
                               threshold = 0.2,
                               standardize = TRUE) %>% 
  predict(names = c("Imagerie Spatiale", 
                    "Imagerie Objet",
                    "Raisonnement"))


#

visualisation_recipe(
labs = list(title = "Correlations entre les facteurs principaux")) %>%
plot() +
theme(panel.grid.major = element_blank(),
      panel.grid.minor = element_blank())
