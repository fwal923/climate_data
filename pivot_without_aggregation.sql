SELECT
-- below: add list of columns you want in the table
Country, City, Month, Average_Temperature_F
FROM
-- below: insert columns to be used from table-to-pivot
(SELECT Country, City, January, February, March, April, May, June, July, August, September, October, November, December, Annual 
FROM `processingtimesql-384706.climate_data.average_temperature_f`) -- table-to-pivot's name
UNPIVOT
-- below: name of column holding values from pivot, name for list of columns to pivot (both names need to correspond to named columns in line 3), within brackets list the columns that need to be pivoted (note: all of these columns need to be of the same TYPE, e.g. FLOAT/STRING)
(Average_Temperature_F FOR Month IN (January, February, March, April, May, June, July, August, September, October, November, December, Annual))
