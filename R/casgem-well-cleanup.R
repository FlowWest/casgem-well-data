library(readr)
library(dplyr)
library(lubridate)

# Constants ------
# groundwater data from casgem
gwl_update_filepath <- "raw-data/gwl_file.csv" 
# well station data from casgem
gst_update_filepath <- "raw-data/gst_file.csv" 

# data imports ----
gwl <- read_csv(gwl_update_filepath) 
gst <- read_csv(gst_update_filepath)


# Add a derived wse variable defined by 
# wse = RP_ELEVATION - (RP_READING - WS_READING)
gwl_with_wse <- gwl %>% 
  mutate(wse = RP_ELEVATION - RP_READING + WS_READING)

# if wanting to get rid of ~160mb of data
#rm(gwl)

# parse columns to their appropriate type 
gwl_with_wse$MEASUREMENT_DATE <- lubridate::mdy_hms(gwl_with_wse$MEASUREMENT_DATE) 


# Save Locally --------------------------------
write_csv(gwl_with_wse, "data/casgem_groundwater_data_as_of_03-2017.csv")
write_rds(gwl_with_wse, "data/casgem_groundwater_data_as_of_03-2017.rds")

# write slimmed down versions for apps use
slim_gwl <- gwl_with_wse %>% 
  select(SITE_CODE, MEASUREMENT_DATE, GS_ELEVATION, wse)

write_csv(slim_gwl, "data/casgem_groundwater_data_as_of_03-2017_slim.csv")
write_rds(slim_gwl, "data/casgem_groundwater_data_as_of_03-2017_slim.rds")


# Save to S3 ----------------------------------
# for cloud storage (s3)
# set up your keys here, flowwest uses us-west-2 by default, change if required
Sys.setenv("AWS_ACCESS_KEY_ID" = "",
           "AWS_SECRET_ACCESS_KEY" = "",
           "AWS_DEFAULT_REGION" = "us-west-2")

save_to_S3 <- function() {

    aws.signature::use_credentials()
  
  if (Sys.getenv("AWS_ACCESS_KEY_ID") == "")
    stop("aws credentials not set")
  
  # save full rds to bucket: casgem-well-data
  put_object("data/casgem_groundwater_data_as_of_03-2017.csv", 
             bucket = "casgem-well-data", 
             object = paste0("casgem-well-data", today(), ".csv"))
  
  put_object("raw-data/gst_file.csv", 
             bucket = "casgem-well-data", 
             object = paste0("casgem-station-data", today(), ".csv"))
}

#save_to_s3() # push casgem data to s3

