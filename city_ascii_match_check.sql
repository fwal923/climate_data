SELECT
ap.country,
cd.city_ascii,
ap.City,
ap.Month,
ap.Sunshine_Hours as average_temperature_c,
FROM
climate_data.city_details as cd
RIGHT OUTER JOIN `processingtimesql-384706.climate_data.sunshine_hours_pivot` as ap
ON LOWER(cd.city_ascii) = LOWER(ap.City) OR LOWER(cd.city) = LOWER(ap.City) AND LOWER(cd.country) = LOWER(ap.Country)
ORDER BY cd.city_ascii
