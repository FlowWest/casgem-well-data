library(readr)
library(dplyr)

gwl <- read_rds("data/casgem_groundwater_data_as_of_03-2017_slim.rds")
gst <- read_csv("raw-data/gst_file.csv")

# first find the site codes that correspond to wells in Solano 
gst_solano <- gst %>% 
  filter(COUNTY_NAME == "Solano") 

site_codes_in_solano <- 
  gst_solano %>% pull(SITE_CODE)

# now simply use site codes list to subset the full gwl
gwl_in_solano <- gwl %>% 
  filter(SITE_CODE %in% site_codes_in_solano)

# for local use
write_rds(gwl_in_solano, "../Solano1A-Project/Solano1A/data/casgem/gwl_in_solano_2017.rds")
write_rds(gst_solano, "../Solano1A-Project/Solano1A/data/casgem/gst_in_solano_2017.rds")












