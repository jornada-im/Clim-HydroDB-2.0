# This script executes an EMLassemblyline workflow.

library(EMLassemblyline)
library(dplyr)
library(tidyr)
library(stringr)
library(lubridate)

template_core_metadata(
  path = '.',
  license = 'CCBY'
)


template_table_attributes(
  path = '.',
  data.path = './odm_tables',
  data.table = c('DataValues.csv',
                 'Methods.csv',
                 'QualityControlLevels.csv',
                 'Sites.csv',
                 'Sources.csv',
                 'Variables.csv')
)

# get start and end date
df_data <- read.csv('./odm_tables/DataValues.csv', header = T, as.is = T)
df_data$LocalDateTime <- ymd_hms(df_data$LocalDateTime)
temp_cov_min <- min(date(df_data$LocalDateTime))
temp_cov_max <- max(date(df_data$LocalDateTime))

# get lat longs
df_sites <- read.csv('./odm_tables/Sites.csv', header = T, as.is = T)
lat <- df_sites$Latitude[1]
long <- df_sites$Longitude[1]

make_eml(
  path = '.',
  data.path = './odm_tables',
  eml.path = '.',
  dataset.title = 'Meteorological data from benchmark stations at the Andrews Experimental Forest, 1957 to present.',
  temporal.coverage = c(temp_cov_min, temp_cov_max),
  geographic.description = 'Atmosphere,Central Meteorological Station',
  geographic.coordinates = c(lat, long, lat, long),
  maintenance.description = 'completed',
  data.table = c('DataValues.csv',
                 'Methods.csv',
                 'QualityControlLevels.csv',
#                 'Sites.csv',
                 'Sources.csv',
                 'Variables.csv'),
  data.table.description = c('Values and variable names in long format',
                             'Method desciptions',
                             'Quality control levels as provided by CUAHSI',
#                             'Site description and lat longs',
                             'Research project providing these data',
                             'Variable definitions'),
  data.table.quote.character = c('\"',
                                 '\"',
                                 '\"',
#                                 '\"',
                                 '\"',
                                 '\"'),
  other.entity = c('convert2odm_and_single_sensor.R'),
  other.entity.description = c('R script to convert original data into ODM format'),
  user.id = 'AND',
  user.domain = 'LTER',
  package.id = 'knb-lter-and.100.1'
)

