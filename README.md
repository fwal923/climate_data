# climate_data
This repo lets you download the final tables for my climate data map dashboard on Tableau Public.

Please note that, whilst I did generate the tables, the data within the tables was sourced from wikipedia, google maps, and a citymapper. Links to the references can be found on the "Data info" dash in the Tableau dashboard, a link to the dashboard and a description of my method are outlined below.

Link to the map:
https://public.tableau.com/app/profile/fiona.walter923/viz/ClimateDataMap/Dashboard1

Method:

Temperature, sunshine and precipitation data is documented for the years 2016 - 2022. The data was extracted from Wikipedia and loaded into a Google Sheet document as seperate sheets. The data was cleaned. Then, a list of locations was extracted as a new sheet ("climate_data_city_details"). All repeat values were removed and the cell values cross-referenced with city names within the world cities database. Mismatching location names were corrected in the individual temperature, sunshine and precipitation (TSP) sheets. For all city matches, columns were added to include alternate and ascii spellings, country information, population counts, and map coordinates. Unknown cities and non-city locations (e.g. atolls, hamlets, national parks) from the TSP sheets were identified using conditional formatting and the corresponding missing data was manually added (google maps/wikipedia).

All sheets were then loaded into BigQuery. A new table containing a column for location names and a column for months was generated. The individual TSP tables and the location-month table were joined using a non-aggregate pivot to generate a final climate data table ("climate_data_collated.csv"). All numeric and string values were parsed accordingly to enable correct classification by Tableau (you must complete this step as otherwise Tableau will not be able to map and visualise the datapoints!). A final data clean was completed and the two final tables ("climate_data_collated.csv" and "climate_data_city_details.csv") loaded into Tableau to construct this dashboard.
