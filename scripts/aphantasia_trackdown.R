#
# ---- Trackdown commands for the project ----
# 

# loading
shelf(trackdown)

# upload the Rmd to GDrive
upload_file("aphantasia_project.Rmd",
            gfile = "aphantasia_project",
            gpath = "M2 EMC - Aphantasia/trackdown",
            hide_code = TRUE,
            path_output = "aphantasia_project.pdf",)

# update the GDoc with the Rmd
update_file("aphantasia_project.Rmd",
            gfile = "aphantasia_project",
            gpath = "M2 EMC - Aphantasia/trackdown",
            hide_code = TRUE,
            path_output = "aphantasia_project.pdf",)

# download the GDoc to Rmd
download_file("aphantasia_project.Rmd",
              gfile = "aphantasia_project",
              gpath = "M2 EMC - Aphantasia/trackdown",)

# render
render_file("aphantasia_project.Rmd",
            gfile = "aphantasia_project",
            gpath = "M2 EMC - Aphantasia/trackdown",)



