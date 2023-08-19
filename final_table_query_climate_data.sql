SELECT
cd.country as country,
cd.city_ascii as city,
cd.month as month,
ap.Average_Precipitation as average_precipitation,
atc.Average_Temperature_C as average_temperature_c,
atf.Average_Temperature_F as average_temperature_f,
sh.Sunshine_Hours as sunshine_hours
FROM
climate_data.city_month as cd
LEFT OUTER JOIN `processingtimesql-384706.climate_data.average_precipitation_pivot` as ap
ON LOWER(cd.city_ascii) = LOWER(ap.City) OR LOWER(cd.city) = LOWER(ap.City) AND LOWER(cd.country) = LOWER(ap.Country) AND LOWER(cd.month) = LOWER(ap.Month)
LEFT OUTER JOIN `processingtimesql-384706.climate_data.average_temperature_c_pivot` as atc
ON LOWER(cd.city_ascii) = LOWER(atc.City) OR LOWER(cd.city) = LOWER(atc.City) AND LOWER(cd.country) = LOWER(atc.Country) AND LOWER(cd.month) = LOWER(atc.Month)
LEFT OUTER JOIN `processingtimesql-384706.climate_data.average_temperature_f_pivot` as atf
ON LOWER(cd.city_ascii) = LOWER(atf.City) OR LOWER(cd.city) = LOWER(atf.City) AND LOWER(cd.country) = LOWER(atf.Country) AND LOWER(cd.month) = LOWER(atf.Month)
LEFT OUTER JOIN `processingtimesql-384706.climate_data.sunshine_hours_pivot` as sh
ON LOWER(cd.city_ascii) = LOWER(sh.City) OR LOWER(cd.city) = LOWER(sh.City) AND LOWER(cd.country) = LOWER(sh.Country) AND LOWER(cd.month) = LOWER(sh.Month)
ORDER BY city_ascii


/*
this subquery can be used if no location-month table was created, then the month-value in all joins would need to be removed and an additional CASE added to prevent row duplication:

(
  SELECT
  CASE WHEN ap.Month IS NOT NULL THEN ap.Month
  WHEN atc.Month IS NOT NULL THEN atc.Month
  WHEN atf.Month IS NOT NULL THEN atf.Month
  ELSE sh.Month
  END
  FROM `processingtimesql-384706.climate_data.average_precipitation_pivot` as ap
  JOIN `processingtimesql-384706.climate_data.average_temperature_c_pivot` as atc
  ON LOWER(ap.City) = LOWER(atc.City) AND LOWER(ap.country) = LOWER(atc.Country) AND LOWER(ap.Month) = LOWER(atc.Month)
  JOIN `processingtimesql-384706.climate_data.average_temperature_f_pivot` as atf
  ON LOWER(ap.City) = LOWER(atf.City) AND LOWER(ap.country) = LOWER(atf.Country) AND LOWER(atc.Month) = LOWER(atf.Month)
  JOIN `processingtimesql-384706.climate_data.sunshine_hours_pivot` as sh
  ON LOWER(ap.City) = LOWER(sh.City) AND LOWER(ap.country) = LOWER(sh.Country) AND LOWER(atf.Month) = LOWER(sh.Month)
)
as month,

*/
