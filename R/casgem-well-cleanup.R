library(readr)
library(dplyr)
library(lubridate)

# data imports ----
gwl <- read_csv("raw-data/gwl_file.csv") # a big file
gst <- read_csv("raw-data/gst_file.csv")


# Add a derived wse variable defined by 
# wse = RP_ELEVATION - (RP_READING - WS_READING)
gwl_with_wse <- gwl %>% 
  mutate(wse = RP_ELEVATION - RP_READING + WS_READING)

# if wanting to get rid of ~160mb of data
#rm(gwl)

# parse columns to their appropriate type 
gwl_with_wse$MEASUREMENT_DATE <- lubridate::mdy_hms(gwl_with_wse$MEASUREMENT_DATE) 


# write data to csv and rds

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

# or if aws cli was installed ~/.aws holds these credentials
aws.signature::use_credentials()

# save full rds to bucket: casgem-well-data
s3saveRDS(gwl_with_wse, bucket = "casgem-well-data", object = "casgem-well-data-2017.rds")
