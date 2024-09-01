###########################
#  ABE: QUIZ 03           #
#  Logan Kelly, Ph.D.     #
###########################

# Set Output Options
# -------------------
ex_name <- "quiz03_chi2"
ex_versions <- 20
ex_rep <- 4
ex_points <- 2
ex_tol <- 0.05
html <- F
qti <- T

# Set Exercises
# ---------------
ex_select <- 
  rep(c("chi2_uniform1.Rmd",
      "chi2_uniform2.Rmd",
      "chi2_goodfit1.Rmd",
      "chi2_goodfit2.Rmd",
      "chi2_independent1.Rmd",
      "chi2_independent2.Rmd"),ex_rep)     ## 

# Set Parameters
# ----------------
# Folders must be sub folders of the current working directory
ex_dir <- "exam_r"
ex_output <- "canvas_qti"
set.seed(Sys.time())

# Load Packages
# ----------------
if(!require("exams")){
  install.packages("exams", 
                   repos = "https://R-Forge.R-project.org",
                   type = "source")
}
pacman::p_load("tidyverse","markdown","knitr","htmltools")

# Helper Function
# -----------------

rdrr.io <- function(code,width="100%",height="600"){
  code <- gsub(" ", "%20", code) 
  code <- gsub("\t", "%09", code) 
  code <- gsub("\n", "%0A", code) 
  code <- gsub("<-", "%3C-", code) 
  code <- gsub(",", "%2C", code) 
  
  paste0("<iframe width='",
         width,
         "' height='",
         height,
         "' src='https://rdrr.io/snippets/embed/?code=",
         code,
         "' frameborder='0'></iframe>") %>% 
    cat() %>% 
    return()
}

youtube <- function(
    youtube.id,
    start = "0",
    title = "YouTube video player",
    width="100%",
    height="600"){
  paste0("<iframe width='",
         width,
         "' height='",
         height,
         "' src='https://www.youtube-nocookie.com/embed/",
         youtube.id,"?",
         "start=",start,"' ",
         "title= '", title,"' ",
         "frameborder='0' allow='accelerometer; clipboard-write;",
         " encrypted-media; gyroscope; picture-in-picture' allowfullscreen></iframe>"
  ) %>% cat() %>% return()
}

# Test Quiz to HTML
# -----------------

if(html){
  exams2html(
    file      = ex_select,                              # List of exersize files
    name      = ex_name,                                # Quiz file name
    n         = ex_versions,                            # Number of quiz versions
    dir       = paste(getwd(),ex_output, sep="/"),      # Output Folder
    edir      = paste(getwd(), ex_dir,
                      paste0("ex_",ex_name),sep="/"),   # Exersize folder
    converter = "pandoc",                               # Pandoc required for Canvas
    encoding  = "UTF-8"                                 # 
  )
}

# Make QTI file
# ---------------

if(qti){
  exams2canvas(
    points    = ex_points,
    file      = ex_select,                              # 
    name      = ex_name,                                # 
    n         = ex_versions,                            # 
    dir       = paste(getwd(),ex_output, sep="/"),      # 
    edir      = paste(getwd(), ex_dir,
                      paste0("ex_",ex_name),sep="/"),   # 
    converter = "pandoc",                               # 
    encoding  = "UTF-8"                                 # 
  )
}