select belgium.time, finnland, belgium, greece from (
    select country, time, sum(value) as finnland from debt where country = 'finnland' group by country, time
) as finnland join (
    select country, time, sum(value) as belgium from debt where country = 'belgium' group by country, time
) as belgium on finnland.time = belgium.time join (
    select country, time, sum(value) as greece from debt where country = 'greece' group by country, time
) as greece on greece.time = belgium.time