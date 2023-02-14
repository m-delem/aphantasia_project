#
# ---- Trackdown commands for the project ----
# 

# loading
shelf(trackdown)

# check packages
print(.packages())

#  add packages to a new .bib
knitr::write_bib(x = c(.packages()), file = "packages.bib")
# --> add the .bib to Zotero and use citr here

# upload the Rmds to GDrive
upload_file("xxxxxxxxxxxx.Rmd",
            gfile = "xxxxxxxxxxxx",
            gpath = "M2 EMC - Aphantasia/manuscrit",
            hide_code = TRUE,)


# update the GDoc with the Rmd
update_file("aphantasia_project.Rmd",
            gfile = "aphantasia_project",
            gpath = "M2 EMC - Aphantasia/manuscrit",
            hide_code = TRUE,
            path_output = "aphantasia_project.pdf",)

update_file("1_intro.Rmd",
            gfile = "introduction",
            gpath = "M2 EMC - Aphantasia/manuscrit",
            hide_code = TRUE,)

update_file("2_methode.Rmd",
            gfile = "methode",
            gpath = "M2 EMC - Aphantasia/manuscrit",
            hide_code = TRUE,)

update_file("3_resultats.Rmd",
            gfile = "resultats",
            gpath = "M2 EMC - Aphantasia/manuscrit",
            hide_code = TRUE,)

update_file("4_discussion.Rmd",
            gfile = "discussion",
            gpath = "M2 EMC - Aphantasia/manuscrit",
            hide_code = TRUE,)


# download the GDoc to Rmd
download_file("aphantasia_project.Rmd",
            gfile = "aphantasia_project",
            gpath = "M2 EMC - Aphantasia/manuscrit",)

download_file("1_intro.Rmd",
            gfile = "introduction",
            gpath = "M2 EMC - Aphantasia/manuscrit",)

download_file("2_experience.Rmd",
            gfile = "experience",
            gpath = "M2 EMC - Aphantasia/manuscrit",)

download_file("3_discussion.Rmd",
            gfile = "discussion",
            gpath = "M2 EMC - Aphantasia/manuscrit",)


