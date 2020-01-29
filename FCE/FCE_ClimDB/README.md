## Files for conversion of FCE ClimDB/HydroDB data into CUAHSI ODM format.

### ClimDB data table has 10 columns
1. LTER_Site
2. Station,Date
3. Daily_AirTemp_Mean_C
4. Flag_Daily_AirTemp_Mean_C
5. Daily_AirTemp_AbsMax_C
6. Flag_Daily_AirTemp_AbsMax_C
7. Daily_AirTemp_AbsMin_C
8. Flag_Daily_AirTemp_AbsMin_C
9. Daily_Precip_Total_mm
10. Flag_Daily_Precip_Total_mm

Requirements

    Create ODM tables: 1. Variables.csv, 2.Methods.csv, 3.Sites.csv, 4.Sources.csv 5.QualityControlLevels.csv according to instructions in "CUAHSI Data Formatting Guide" using controlled vocabulary.
    In R working directory create subdirectories "odm_tables" and "data".
    Place ODM tables in "odm_tables" dir and input data in "data" dir.

Questions

