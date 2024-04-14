library(rgee)
library(reticulate)

use_python(Sys.which("python3"))

py_config()

install_python(version = '3.12.3')

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

ee_Initialize(
  user = "Boone799@gmail.com"
)