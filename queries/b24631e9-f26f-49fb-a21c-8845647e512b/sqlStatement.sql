select belgium.time, value_fi, value_be, value_gr from (
    select country, time, sum(value) as value_fi from debt where country = 'finnland' group by country, time
) as finnland join (
    select country, time, sum(value) as value_be from debt where country = 'belgium' group by country, time
) as belgium on finnland.time = belgium.time join (
    select country, time, sum(value) as value_gr from debt where country = 'greece' group by country, time
) as greece on greece.time = belgium.time