# Usage 

These are a set of R scripts to be used interactively for CASGEM well data retrieval. 
The workflow is pretty simple, and starts with the `retrieve-data.R` file. This script
defines a function `get_casgem_data()` that allows the user to download a desired 
dataset provided by DWR. 

If you wish to use the script to download the raw file you can do by running: 

```r
# download the casgem stations data
get_casgem_data("station_metadata")
```

This will download the zip file temporarily (deletes it once complete) and extracts
this file from within in into the working directory. 

In order to no break workflow, this function when assigned to a variable (or passed in to as a parameter to another function) will return 
the path to the downloaded file, thus allowing you to read into memory as follows:

```r
casgem_stations <- read_csv(get_casgem_data("station_metadata"))

dplyr::glimpse(casgem_stations)
```

```
Observations: 42,069
Variables: 15
$ CASGEM_STATION_ID       <int> 37521, 37522, 37523, 37524, 37525, 37526, 37527, 37528, 37529, 37530,...
$ SITE_CODE               <chr> "385590N1225215W001", "385292N1225015W001", "356347N1177226W004", "35...
$ STATE_WELL_NUMBER       <chr> "08N06W09H002M", "08N06W23M001M", "26S40E31D006M", "26S40E31D009M", "...
$ LOCAL_WELL_DESIGNATION  <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, "23J001M", NA, "42N11E30F001M...
$ LATITUDE                <dbl> 38.55900, 38.52920, 35.63470, 35.63630, 35.63630, 35.63630, 35.63110,...
$ LONGITUDE               <dbl> -122.5215, -122.5015, -117.7226, -117.7232, -117.7232, -117.7232, -11...
$ LOC_METHOD              <chr> "Unknown", "Unknown", "Unknown", "Unknown", "Unknown", "Unknown", "Un...
$ LOC_ACCURACY            <chr> "Unknown", "Unknown", "Unknown", "Unknown", "Unknown", "Unknown", "Un...
$ BASIN_CD                <chr> "2-2.01", "2-2.01", "6-54", "6-54", "6-54", "6-54", "6-54", "6-54", "...
$ BASIN_DESC              <chr> "Napa Valley", "Napa Valley", "Indian Wells Valley", "Indian Wells Va...
$ COUNTY_NAME             <chr> "Napa", "Napa", "Kern", "Kern", "Kern", "Kern", "Kern", "Kern", "Kern...
$ IS_VOLUNTARY_REPORTING  <chr> "Y", "Y", "Y", "Y", "Y", "Y", "Y", "Y", "Y", "Y", "Y", "Y", "Y", "Y",...
$ TOTAL_DEPTH_FT          <int> 175, 113, NA, NA, NA, NA, NA, NA, NA, NA, NA, 60, 600, 125, 665, 65, ...
$ COMPLETION_RPT_NBR      <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, "11051", "86123", "89...
$ CASGEM_STATION_USE_DESC <chr> "Residential", "Residential", "Unknown", "Unknown", "Unknown", "Unkno...
```


# Archive Metadata 

*metadata provided for CASGEM from California Department of Water Resources* 

<pre>The export you requested contains 3 files with a naming convention corresponding to the following data type:
GST - station (well) header data
GWL - groundwater level data
PERF - well perforation details 

The data files are in CSV-delimited format. Each file contains a header row 
describing the contents of the file.
The field descriptions for each file are given below:
*******************************************************************************
GST
        Field   Field Name              Description                             Data Type	 
        =====   ===========             ============================            =========	 
          1     casgem_station_id       Station Identifier (datasbase key)      Number
          2     site_code               Unique station identifier               Char
          3     state_well_nbr          State Well Number                       Char
          4     local_well_designation  Identifier used by local agency         Char
          5     latitude                station latitude, dec. degrees          Number
          6     longitude               station longitude, dec. degrees         Number
          7     loc_method              method by which well was located        Char
          8     loc_accuracy            accuracy of well location               Char
          9     basin_cd                Groundwater basin code of well          Char
         10     basin_name              Groundwater basin name of well          Char
         11     is_voluntary_reporting  Code (Y/N) indicating rept status       Char
         12     total_depth_ft          Total depth of well (if public)         Number
         13     well_use                Reported use of well                    Char

GWL
        Field   Field Name                 Description                             Data Type	 
        =====   ===========                ============================            =========	 
          1     casgem_station_id          Station Identifier (datasbase key)      Number
          2     site_code          	   Unique station Identifier               Char
          3     elevation_id 		   Record identifier                       Number
          4     measurement_date           Measurement Date/Time                   Date (YYYY-MM-DD HH:MI:SS.S)
          5     rp_elevation               Reference Point Elevation               Number
          6     gs_elevation               Ground Surface Elevation                Number
          7     ws_reading                 Water surface reading                   Number
          8     rp_reading                 Reference point reading                 Number
          9     measurement_issue_id       Measurement problem code                Number
         10     measurement_method_id      Measurement method code                 Number
         11     measurement_accuracy_id    Measurement accuracy code               Number
	 12     casgem_reading             Reading is a casgem submittal           Number
	 13     org_id                     Monitoring Enity Agency Code            Number
         14     org_name                   Monitoring Enity Agency Code            Number
         15     comments                   Measurement Remarks                     Char
         16     coop_agency_org_id         Cooperating Agency Code                 Number
         17     coop_org_name              Cooperating Agency Name                 Number

Perf
        Field   Field Name              Description                                   Data Type	 
        =====   ===========             ============================                  =========	 
          1     casgem_station_id       Station Identifier (datasbase key)            Number
          2     site_code          	Unique station Identifier                     Char
          3     perf_top_ft             Top of perfs depth for this interval          Number
          4     bottom_top_ft           Bottom of perfs depth for this interval       Number


Following are lookup file for codes found in the GWL file:

measurement_issue_type
        Field   Field Name                 Description                                Data Type	 
        =====   ===========                ============================               =========	 
          1     measurement_issue_id       Measurement issue code (datasbase key)     Number
          2     measurement_issue_code     Measurement issue display code             Char
          3     measurement_issue_desc 	   Measurement issue description              Char
          4     measurement_issue_class    Class of measurement issue                 Char 
	                                        (q = questionable
						 n = no measurement )

elevation_measure_method_type
        Field   Field Name                 Description                                Data Type	 
        =====   ===========                ============================               =========	 
          1     measurement_method_id      Measurement method code (datasbase key)    Number
          2     measurement_method_desc    Measurement method description             Char
          3     measurement_method_cd      Measurement method display code            Char

elevation_measure_accuracy_type
        Field   Field Name                 Description                                Data Type	 
        =====   ===========                ============================               =========	 
          1     measurement_accuracy_id    Measurement accuracy code (datasbase key)  Number
          2     measurement_accuracy_desc  Measurement accuracy description           Char
          3     measurement_accuracy_cd    Measurement accuracy display code          Char


measurement_accuracy_type.csv = contains lookups to RP/GS elevation measurement accuracy fields in the GWL and GST files 

measurement_method_type.csv = contains lookups to RP/GS elevation measurement method in thes GWL and GST files.  

basin.csv is a lookup to the groundwater basin IDs in the GST file.

basin_region.csv is a lookup for the hydrologic region IDs in the basin.csv file


*******************************************************************************
The horizontal datum for all coordinates is NAD83.
The vertical datum for all elevations is NAVD88.
All depth measurements are in feet.
*******************************************************************************
Please see the WDL web site for a key to the codes you find in the files
(http://www.water.ca.gov/waterdatalibrary/includes/Key_Codes_Abb_gw.cfm).
*******************************************************************************
If you encounter problems, find any errors, or have any suggestions,
please contact the WDL site administrator at wdlweb@water.ca.gov
Last updated 09/20/2016
*******************************************************************************
</pre>
