library(rgee)
library(reticulate)

# install_python(version = '3.12.3')

py_config()

use_python(Sys.which("python.exe"))

ee_install_set_pyenv(
  py_path = "/usr/bin/python3",
  py_env = "rgee",
  Renviron = "global",
  confirm = interactive(),
  quiet = FALSE
)

ee_check_python(quiet = FALSE)

ee_install()
ee_check()

ee_clean_user_credentials()
ee_Authenticate()

ee_Initialize(
  user = "bengaskill12@gmail.com"
)

# https://rstudio.github.io/reticulate/articles/calling_python.html
# https://developers.google.com/earth-engine/guides/python_install
# https://github.com/r-spatial/rgee/issues/355
reticulate::py_run_file("C:/Users/BMONE/OneDrive/Documents/ee_authentication.py")


# Import rgee.
library(rgee)

ee$Authenticate(auth_mode='notebook')

ee$Initialize(project='bengaskill12-remote-sensing')  # <-- EDIT THIS FOR YOUR PROJECT

ee$String('Hello from the Earth Engine servers!')$getInfo()

# Test import image collection
image <- ee$Image('LANDSAT/LC08/C02/T1_L2/LC08_012031_20230327')
climate <- ee$ImageCollection('NASA/NEX-DCP30')
Map$centerObject(climate)
Map$addLayer(climate)


# Test our dataset
climate2 <- ee$Image('NASA/NEX-DCP30/rcp26_BNU-ESM_201807')

#climate2 <- ee$ImageCollection('NASA/NEX-DCP30')
Map$centerObject(climate2)
Map$addLayer(climate2)