# 
# ---- Project Title - Source code ---------------------------------------------
# 
# Delem, M.
# Email : m.delem@univ-lyon2.fr
# Last update : on that ultimate crunching day
#

# ---- package-related commands -----------------------------------------------

# librarian setting essential packages on startup (run once per device)
if (!require("librarian")) install.packages("librarian")
librarian::lib_startup(
  librarian,
  tidyverse,
  easystats,
  lib = ('C:/Users/Admin/Documents/r_library'),
  global = TRUE,
  )

# check packages
print(.packages())

# complete session report
report(sessionInfo())

#  add packages to a temporary file to feed Zotero and citr
knitr::write_bib(
  # package list
  x = c(
    # all packages
    # .packages(),
    # or individual packages
    # "that_forgotten_package",
    ),
  # output .bib
  file = "packages.bib",
  )

# ---- trackdown commands ------------------------------------------------------

# loading the package
shelf(trackdown)

# update the GDoc with the Rmds
update_file(
  "1_intro.Rmd",
  gfile = "1_introduction",
  gpath = "M2 EMC - Aphantasia/manuscrit_aphantasia",
  hide_code = TRUE,
  )

update_file(
  "2_methode.Rmd",
  gfile = "2_methode",
  gpath = "M2 EMC - Aphantasia/manuscrit_aphantasia",
  hide_code = TRUE,
  )

update_file(
  "3_resultats.Rmd",
  gfile = "3_resultats",
  gpath = "M2 EMC - Aphantasia/manuscrit_aphantasia",
  hide_code = TRUE,
  )

update_file(
  "4_discussion.Rmd",
  gfile = "4_discussion",
  gpath = "M2 EMC - Aphantasia/manuscrit_aphantasia",
  hide_code = TRUE,
  )

update_file(
  "5_annexes.Rmd",
  gfile = "5_annexes",
  gpath = "M2 EMC - Aphantasia/manuscrit_aphantasia",
  hide_code = TRUE,
  )

# download the GDocs for the Rmds
download_file(
  "1_intro.Rmd",
  gfile = "1_introduction",
  gpath = "M2 EMC - Aphantasia/manuscrit_aphantasia",
  )

download_file(
  "2_methode.Rmd",
  gfile = "2_methode",
  gpath = "M2 EMC - Aphantasia/manuscrit_aphantasia",
  )

download_file(
  "3_resultats.Rmd",
  gfile = "3_resultats",
  gpath = "M2 EMC - Aphantasia/manuscrit_aphantasia",
  )

download_file(
  "4_discussion.Rmd",
  gfile = "4_discussion",
  gpath = "M2 EMC - Aphantasia/manuscrit_aphantasia",
  )

# ---- no-output setup ---------------------------------------------------------

# packages
shelf(
  # visualization extensions
  ggpubr,     # publication plots
  ggradar,    # radar charts
  # analysis extensions
  lme4,       # mixed models
  cluster,     # self-explanatory
  lmerTest,   # tests for lmer
  factoextra, # multivariate data analysis visualization
  )

# global theme
theme_set(
  theme_bw(
    base_size = 14,
    base_family = "serif",
    ),
  )

# ---- importing data ----------------------------------------------------------
data <- 
  read_csv(
    "./data/data.csv",
    # sep = ";",
    # fileEncoding="UTF-8-BOM",
    # pas forcément nécessaires
    )

# structure check
str(data, path)

# ---- exporting data ----------------------------------------------------------
# exporting df as csv
write_csv(data)

# ---- ggplot2 structure -------------------------------------------------------
data %>% 
  ggplot(
    # variables
    aes(
      x = x_axis,
      y = y_axis,
      group = grouping_variable,
      fill = grouping_variable,
      ),
    # as it says :
    other_options(),
    ) +
  
  # my favourite geoms
  geom_violin(
    # option examples
    alpha = 0.3,
    position = position_dodge(1),
    draw_quantiles = FALSE,
  ) +
  geom_boxplot(
    alpha = 0.6,
    position = position_dodge(1),
    width = 0.15,
  ) +
  # other geoms
  geom_density(
    color = "aquamarine3",
    fill = "aquamarine",
    alpha = 0.4, 
    adjust = 0.9,
  ) +
  geom_jitter() + 
  geom_smooth() + 
  geom_point() +
  other_geoms() +
  
  # other functions
  # ggpubr : significance indicator labels
  stat_compare_means(
    # list of comparisons to display
    comparisons = list(
      c("cond1","cond2"),
      c("cond1","cond3"),
      #etc
    ),
    method = "t.test",
    # choosing p value or stars
    label = "p.format",
    # height of the labels
    label.y = c(41,43,47),
  ) +
  other_functions() +
  
  # different filler colors
  scale_fill_brewer(
    # cool palettes
    palette = "Dark2",
  ) +
  scale_colour_brewer() +
  other_scales() +
  
  # plot information
  labs(
    title = "Y selon X",
    x = "Abcisse",
    y = "Ordonnée",
    )

# ---- ggpubr ------------------------------------------------------------------

# arranging multiple plots
ggarrange(
  plot1, 
  plot2, 
  plot3, 
  plot4,
  # labels = "AUTO" possible
  labels = c("Plot 1", 
             "Plot 2", 
             "Plot 3", 
             "Plot 4",
  ),
  font.label = list(
    size = 16, 
    family = "serif",
  ),
  ncol = 2,
  nrow = 2,
  )

# lollipop chart
data %>% 
  ggdotchart(
    x = "x",
    y = "y",
    group = "grouping",
    color = "variable", 
    size = 1, dot.size = 3,
    palette = "aas",
    add = "segment",
    position = position_dodge(.5),
    sorting = "descending",
    # facet.by = "cluster",
    rotate = TRUE,
    # legend = "none",
    ggtheme = theme_bw(
      base_size = 14, 
      base_family = "serif",
      ),
    xlab = "x",
    ylab = "y",
    ) +
  # geom_smooth(
  #   aes(
  #     group = grouping, 
  #     color = cluster,
  #     ),
  #   size = .8,
  #   ) +
  theme(
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    )

# ---- 3D plotting -------------------------------------------------------------
scatter3d(
  x = df$var1,
  y = df$var2,
  z = df$var3,
  fit = "smooth",
  xlab = "Dimension 1",
  ylab = "Dimension 2",
  zlab = "Dimension 3",
  )

# ---- exporting outputs -------------------------------------------------------

# creating a folder for tidied data
if (!dir.exists("./z_data")) dir.create(
  path = "./z_data",
  recursive = TRUE,
)
# exporting tidied data as csv
write.csv(
  x = tidy_data,
  file = "./outputs/data/df.csv",
  row.names = FALSE,
  quote = FALSE,
)

# creating a folder for plots
if (!dir.exists("./z_plots")) dir.create(
  path = "./z_plots",
  recursive = TRUE,
  )
# saving the last plot created
ggsave(
  filename = "./z_plots/that_plot.png",
  # size in inches
  width = 10,
  height = 8,
  units = "in",
  # quality
  dpi = 300,
  )

# ---- descriptive statistics --------------------------------------------------
data %>% 
  report() %>% 
  as.data.frame() %>% 
  summary() %>% 
  # print as a LaTeX-ready table
  knitr::kable(
    row.names = FALSE,
    caption = "Descriptive statistics of the whole sample.\\label{descriptives}")

# ---- correlation matrices ----------------------------------------------------
data %>% 
  # standadize
  mutate(across(everything(), ~ scale(.x))) %>% 
  # partial correlations
  correlation(partial = TRUE) %>% 
  # sorting by strength
  cor_sort() %>% 
  summary() %>% 
  plot() +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank()) +
  # no titles in publications
  labs(title = NULL)

# ---- gaussian graphical models -----------------------------------------------
data %>%
  # partial correlations
  correlation(partial = FALSE) %>%
  # setting a minimum strength not to overclutter
  filter(abs(r) >= .3) %>%
  plot() +
  # settings for edges
  geom_edge_arc(
    strength = 0.1,
    aes(
      # transparency depends on strength
      edge_alpha = abs(r),
      # width depends on strength
      edge_width = abs(r),
      # colour depends on valence
      colour = r),
    ) +
  # legend
  guides(
    edge_alpha = "none", 
    edge_width = "none",
    ) +
  # color gradient for -1 -> 1 correlation
  scale_edge_colour_gradientn(
    limits = c(-1, 1),
    colors = c("firebrick2", "dodgerblue2"),
    ) +
  # node settings
  geom_node_point(
    size = 20,
    ) +
  # node text settings
  geom_node_text(
    aes(label = name,
        family = "serif",
        ),
    colour = "white",
    repel = FALSE,
    ) +
  # global theme
  theme_graph(
    base_family = "serif", 
    base_size = 10,
    )

# ---- data transformation --------------------------------------------------

# Box-Cox
Box <- 
  boxcox(
  RT ~ 1, 
  data = data, 
  lambda = seq(-5, 5, 0.1),
  )
Cox <- 
  data.frame(
    Box$x,
    Box$y,
    )[with(
      Cox,
      order(-Cox$Box.y),
      ),
      ]
lambda <- Cox[1, "Box.x"]
data_box <- 
  data %>% 
  mutate(RT_box = ((RT ^ lambda - 1) / lambda) %>% scale())

# ---- linear mixed models -----------------------------------------------------
model1 <- 
  lmer(
    RT_box ~ condition +
      (1|subject),
    data = data,
    )
model2 <- 
  lmer(
    RT_box ~ condition +
      (1|subject) +
      (1|item) +
      (1|bloc),
    data = data,
    )

aov(
  model1,
  model2,
  )

# model assumptions
best_model %>% check_model()

# variance analysis
best_model %>% aov()

#report
best_model %>% summary()
best_model %>%
  summary() %>% 
  report()

# ---- linear general binomial models ------------------------------------------
glm <- 
  glmer(
    correct ~ condition +
      (1|subject),
    data = data,
    family = binomial,
    )

# ---- factor analysis (and pca) -----------------------------------------------

# is it suitable for factor analysis ?
data %>% check_factorstructure()

# estimating the optimal number of factors
n_factors(
  data, 
  rotation="cluster", # oblimin is the most common one
  )

# factoextra : circle plot
data %>% 
  prcomp(scale = TRUE) %>% 
  fviz_pca_var(
    repel = TRUE,
    col.var = "contrib",
    title = "Analyse Factorielle Multiple des variables",
  ) +
  theme_bw(
    base_size = 14,
    base_family = "serif") +
  theme(
    axis.text.x=element_blank(),
    axis.ticks.x=element_blank(),
    axis.text.y=element_blank(),
    axis.ticks.y=element_blank()) +
  labs(
    title = NULL,
    # x = "Dimension 1",
    # y = "Dimension 2" ,
    )

# plot of the loadings of each factor
factor_analysis(
  data, 
  rotation = "cluster",
  n = "auto",
  sort = TRUE,
  standardize = TRUE,
  ) %>% 
  plot() + 
  labs(
    title=NULL,
    )

# summary table of performance and eigenvalues
factor_analysis(
  data, 
  rotation = "cluster",
  n = "auto",
  sort = TRUE,
  standardize = TRUE,
  ) %>%
  summary() %>%
  # LaTeX-ready printing
  knitr::kable(
    caption = "Summary table of the MFA. \\label{loadings_tbl}",
    digits = 3,
    )

# creating a df with only factor scores
data_latent <- 
  factor_analysis(
    data,
    rotation = "cluster", 
    n = "auto",
    sort = TRUE,
    standardize = TRUE,
    ) %>%
  # predicting scores to each factor
  predict(
    names = c(
      "dimension_1",
      "dimension_2",
      # etc.
      "dimension_x",
      ),
    )

# ---- cluster analysis --------------------------------------------------------

# is it suitable for cluster analysis ?
data %>% check_clusterstructure()

# estimating the optimal number of clusters
data %>% 
  n_clusters() %>% 
  plot()

# hierarchical k-means clustering
data %>%
  cluster_analysis(
    n = "auto",
    method = "hkmeans",
    )

# factoextra : clustering plot
kmeans(
  data %>% mutate(across(everything(), ~ scale(.x))),
  centers = 4,
  nstart = 100,
  ) %>%
  fviz_cluster(
    data,
    geom = "point",
    repel = TRUE,
    ellipse.type = "convex",
    shape = "circle", pointsize = 1.2,
    # xlab = "Dimension 1",
    # ylab = "Dimension 2",
    ) +
  theme_bw(
    base_size = 14, 
    base_family = "serif",
    ) +
  labs(
    title = NULL,
    )

# adding clusters belonging to data
data <-
  data %>%
  mutate(
    # analysis
    cluster = 
      cluster_analysis(
        n = "auto",
        method = "hkmeans",
        ) %>%
      # predicting the cluster of each observation
      predict() %>% 
      # adding clusters as factors
      as.factor()
    )

# radar chart of cluster profiles
graph <- 
  data %>%
  group_by(cluster) %>% 
  summarise(across(everything(),mean)) %>% 
  mutate(across(-cluster, ~ rescale(.x, to = c(0,1))),) %>% 
  ggradar(
    base.size = 10,
    font.radar = "serif",
    values.radar = c("0","0.5","1"),
    grid.label.size = 4,
    grid.min = 0, grid.mid = .5, grid.max = 1,
    label.gridline.min = FALSE,
    group.line.width = 1, group.point.size = 3,
    # group.colours =,
    background.circle.transparency = .1,
    legend.title = "Clusters",
    legend.text.size = 8,
    axis.label.size = 4,
    legend.position = "bottom",
    fill = TRUE,
    fill.alpha = 0.1,
    ) + 
  theme_bw(
    base_size = 14, 
    base_family = "serif",
    ) +
  theme(
    axis.text.x=element_blank(),
    axis.ticks.x=element_blank(),
    axis.text.y=element_blank(),
    axis.ticks.y=element_blank(),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    )

# ggpubr : facet the profiles
facet(graph,facet.by = "cluster")


# ---- the next thing we'll learn ? --------------------------------------------