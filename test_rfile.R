library(reticulate)
Sys.which("python.exe")

Sys.setenv("RETICULATE_PYTHON" = "python.exe")

use_python(Sys.which("python.exe"))
reticulate::import("numpy", convert = FALSE)

py_install("numpy")
np <- reticulate::import("numpy", convert = FALSE)
# do some array manipulations with NumPy
a <- np$array(c(1:4))
print(a)  # this should be a Python array
