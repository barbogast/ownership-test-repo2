select residents.time, residents, nonresidents from (
    select sum(value) as residents, time from debt where country = 'greece' and category_2 = 'Residents' group by time
) as residents

join (
    select sum(value) as nonresidents, time from debt where country = 'greece' and category_2 = 'Non-residents' group by time
) as nonresidents on residents.time = nonresidents.time

