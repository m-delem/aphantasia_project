#
# ---- References commands -----------------------------------------------------

# check packages
print(.packages())

#  add packages to a new .bib
knitr::write_bib(x = c(.packages()), file = "packages.bib")
# --> add the .bib to Zotero and use citr here

# ---- Trackdown commands for the project --------------------------------------

# loading
shelf(trackdown)

# update the GDoc with the Rmds
upload_file("1_intro.Rmd",
            gfile = "1_introduction",
            gpath = "M2 EMC - Aphantasia/manuscrit",
            hide_code = TRUE,)

upload_file("2_methode.Rmd",
            gfile = "2_methode",
            gpath = "M2 EMC - Aphantasia/manuscrit",
            hide_code = TRUE,)

upload_file("3_resultats.Rmd",
            gfile = "3_resultats",
            gpath = "M2 EMC - Aphantasia/manuscrit",
            hide_code = TRUE,)

upload_file("4_discussion.Rmd",
            gfile = "4_discussion",
            gpath = "M2 EMC - Aphantasia/manuscrit",
            hide_code = TRUE,)

upload_file("5_annexes.Rmd",
            gfile = "5_annexes",
            gpath = "M2 EMC - Aphantasia/manuscrit",
            hide_code = TRUE,)

# download the GDoc to Rmds
download_file("1_intro.Rmd",
            gfile = "1_introduction",
            gpath = "M2 EMC - Aphantasia/manuscrit",)

download_file("2_methode.Rmd",
            gfile = "2_methode",
            gpath = "M2 EMC - Aphantasia/manuscrit",)

download_file("3_resultats.Rmd",
              gfile = "3_resultats",
              gpath = "M2 EMC - Aphantasia/manuscrit",)

download_file("4_discussion.Rmd",
            gfile = "4_discussion",
            gpath = "M2 EMC - Aphantasia/manuscrit",)


