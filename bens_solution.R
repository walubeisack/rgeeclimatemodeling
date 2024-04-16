#----------------------------------- Setup ------------------------------------#
library(reticulate)
library(rgee)

#  Not used
# install_python(version = '3.12.3')

py_config()

# Not used
# use_python(Sys.which("python.exe"))

# # Not used
# ee_install_set_pyenv(
#   py_path = "/usr/bin/python3",
#   py_env = "rgee",
#   Renviron = "global",
#   confirm = interactive(),
#   quiet = FALSE
# )

#-------------------------------- NEED TO DO THIS -----------------------------#
# Restart and Terminate R
# Run this again:
# library(rgee)
# library(reticulate)

ee_check_python(quiet = FALSE)


ee_clean_pyenv()
#-------------------------------- NEED TO DO THIS -----------------------------#
# Restart and Terminate R
# Run this again:
# library(rgee)
# library(reticulate)

ee_install()
#-------------------------------- NEED TO DO THIS -----------------------------#
# Restart and Terminate R
# Run this again:
# library(rgee)
# library(reticulate)

ee_check()

# # Should no longer be necessary but included for reference
# ee_clean_user_credentials()
# ee_Authenticate()
# 
# ee_Initialize(
#   user = "bengaskill12@gmail.com"
# )

# https://rstudio.github.io/reticulate/articles/calling_python.html
# https://developers.google.com/earth-engine/guides/python_install
# https://github.com/r-spatial/rgee/issues/355
reticulate::py_run_file("C:/Users/BMONE/OneDrive/Documents/ee_authentication.py")



# -------------------------------- Initialize ---------------------------------#
# Import rgee.
library(rgee)

ee$Authenticate(auth_mode='notebook')

ee$Initialize(project='bengaskill12-remote-sensing')  # <-- EDIT THIS FOR YOUR PROJECT

ee$String('Hello from the Earth Engine servers!')$getInfo()



# -------------------------------- Analysis -----------------------------------#
# Test our dataset
climate2 <- ee$Image('NASA/NEX-DCP30/rcp26_BNU-ESM_201807')

#climate2 <- ee$ImageCollection('NASA/NEX-DCP30')
Map$centerObject(climate2)
Map$addLayer(climate2)