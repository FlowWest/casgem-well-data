casgem_zip_url <- "https://d3.water.ca.gov/owncloud/index.php/s/YPFGd8p47s6jhu6/download"

files_in_zip <- list(
  "groundwater_data" = "gwl_file.csv", 
  "station_metadata" = "gst_file.csv"
)

#' @param d a data file to obtain from zip. Available options listed by names(files_in_zip)
get_casgem_data <- function(d=NULL) {
  if (is.null(d)) {
    message("You are attempting to extract all files in this archive, an action that could take a while")
    pr <- readline(prompt = "Proceed? [y/N]")
    if (tolower(pr) != "y")
      stop("action stopped")
    else {
      download.file(casgem_zip_url, "temp.zip")
      on.exit(file.remove("temp.zip"))
      
      data <- unzip(zipfile = "temp.zip")
      
      invisible(data)
    }
  }
  
  name_to_extract <- files_in_zip[[d]]
  if (is.null(name_to_extract)) 
    stop("data is not a valid choice for this zip file")
  
  download.file(casgem_zip_url, "temp.zip")
  on.exit(file.remove("temp.zip"))
  
  data <- unzip(zipfile = "temp.zip", files = files_in_zip[[d]])
  
  invisible(data)
}

