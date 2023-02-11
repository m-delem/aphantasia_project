#
# ---- TEMPLATE Clean ----
# 
# Written by Mael Delem
# Email : m.delem@univ-lyon2.fr
# Last Updated on December 19, 2022

# ---- librarian adds packages loading on startup (run once per device) ----
if (!require("librarian")) install.packages("librarian")
librarian::lib_startup(librarian, 
                       tidyverse,
                       ggplot2,
                       lib = "C:/Users/Admin/OneDrive/Documents/R Library", 
                       global = TRUE)

# ---- package loading with librarian (loaded on startup) ----
shelf(
  MASS,       # functions and data frame ecosystem
  easystats,  # modelling, visualization and reporting ecosystem
  ez,         # analysis and visualization of factorial exp
  rstatix,    # pipe friendly statistical functions
  scales,      # scale functions
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
  crsh/citr,  # rmarkdown citations
)

# global theme
theme_set(theme_bw(base_size = 14, base_family = "serif"))

# ---- Preparation ----

# ---- : import and tidying : ----
df <- read.csv("./data/datafile.csv", 
               sep = ";", 
               fileEncoding="UTF-8-BOM") 
str(df)

# ---- : descriptive statistics : ----

# ---- : data visualization : ----
# --- personal ggplot2 structure ---
# df %>% ggplot +
# geom - density, violin, boxplot, jitter, smooth, point
# other functions - stat_compare_means, stat_summary, etc.
# colors - scale_fill_brewer, scale_color_brewer
# labels - labs

# mean comparison
df %>% 
  ggplot(aes(x = conditions, # reorder(cond1, cond3, cond2) possible
             y = dependent_variable,
             fill = conditions,)) +
  geom_violin(alpha = 0.3,
              position = position_dodge(1),
              draw_quantiles = FALSE,) +
  geom_boxplot(alpha = 0.6,
               position = position_dodge(1),
               width = 0.15,) +
  # significance indicator labels
  stat_compare_means(comparisons = list(c("cond1","cond2"),
                                        c("cond1","cond3"), #etc
                                        ),
                     method = "t.test",
                     label = "p.format",
                     # height of the labels
                     label.y = c(41,43,47)) +
  # different filler colors
  scale_fill_brewer(palette = "Dark2") +
  scale_colour_brewer(palette = "Dark2") +
  labs(title = "Dependant variable distribution for each condition",
       x = "Conditions",
       y = "Dependant variable")

# dependent variable density
df %>% 
  ggplot(aes(x = dependent_variable,
             # to divide per condition :
             # colour = conditions,
             # fill = conditions,
             )) +
  geom_density(# color = "aquamarine3",
               # fill = "aquamarine",
               alpha = 0.4, 
               adjust = 0.9) +
  scale_fill_brewer(palette = "Dark2") +
  scale_color_brewer(palette = "Dark2") +
  labs(title = "Dependant variable distribution",
       x = "Dependant variable",
       y = "Density")

# arranging multiple plots
ggarrange(plot1, plot2, plot3, plot4,
          labels = c("Plot 1", "Plot 2", "Plot 3", "Plot 4",),
          # labels = "AUTO" possible
          font.label = list(size = 16, family = "serif"),
          ncol = 2,
          nrow = 2,)

# 3D plotting
scatter3D(data = df,
          x = df$var1,
          y = df$var2,
          z = df$var3,
          fit = "smooth",)

# creating an output data and plots folder
if (!dir.exists("./data")) dir.create("./outputs/data", 
                                      recursive = TRUE)
if (!dir.exists("./outputs")) dir.create("./outputs", 
                                         recursive = TRUE)
if (!dir.exists("./outputs/plots")) dir.create("./outputs/plots", 
                                               recursive = TRUE)

# exporting df as csv
write.csv(x = df, 
          file = "./outputs/data/df.csv",
          row.names = FALSE,
          quote = FALSE)

# exporting plots as png
a_plot %>%
  ggexport(filename = "./outputs/plots/mon-expe.png",
           width = 1600,
           height = 800)

a_plot %>% 
  ggsave("outputs/plots/correlation_network.png", dpi=300)

# ---- Analyses ----

# ---- : accuracy check : ----

# ---- : transformation - Box-Cox : ----
Box = boxcox(RT ~ 1, data = df, lambda = seq(-5, 5, 0.1))
Cox = data.frame(Box$x, Box$y)
Cox2 = Cox[with(Cox, order(-Cox$Box.y)),]
Cox2[1,]
lambda = Cox2[1, "Box.x"]
df <- df %>% mutate(RT_box = (df$RT ^ lambda - 1) / lambda,
                    RT_box = scale(RT_box))

# ---- : ANOVA : ----
#anova
ezANOVA(df, dv = Score, wid = Participants, within = Age, between = Group)

# ---- : linear mixed models : ----
model1 <- lmer(RT_box ~ condition + (1|subject),
               data = df)
model2 <- lmer(RT_box ~ condition + (1|subject) + (1|item) + (1|bloc),
                 data = df)
anova(model1, model2)

check_model(best_model)
anova(best_model)
summary(best_model)
summary(report(best_model))

# ---- : linear general binomial models : ----
glm <- glmer(correct ~ condition + (1|subject),
              data = df,
              family = binomial)
summary(glm)