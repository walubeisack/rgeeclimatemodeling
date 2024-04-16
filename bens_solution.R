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
# Get the image collection
testCollection <- ee$ImageCollection('NASA/NEX-DCP30')

# Filter the dates and create a mosaic
filteredDate <- testCollection$filterDate('1950-01-01', '2099-01-01')
mosaic <- filteredDate$mosaic()

# Select the desired bands or create a composite
vis <- list(bands = c('pr'))

# Add the layer to the map with the parameters
Map$addLayer(mosaic, vis)

library(stars)
library(future)
library(googledrive)

# bot left, bot right, top right, top left
box <- ee$Geometry$Polygon(
  list(
    c(-123, 25),
    c(-65, 23),
    c(-63, 50),
    c(-128, 50)
  )
)

library(raster)
library(terra)

mosaic_with_extent <- mosaic$clip(box)

mosaic_raster <- ee_as_raster(mosaic_with_extent)

plot(mosaic_raster)

writeRaster(mosaic_raster, filename = file.path("images", "tp_data.tif"))

r <- rast(file.path("images", "tp_data.tif"))
plot(r)