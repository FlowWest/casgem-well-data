
# Archive Metadata 

*metadata provided for CASGEM from California Department of Water Resources* 

The export you requested contains 3 files with a naming convention corresponding to the following data type:
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

