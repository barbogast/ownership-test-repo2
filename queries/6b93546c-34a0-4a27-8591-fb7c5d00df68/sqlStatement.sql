select 
    financial_corporations.time, 
    financial_corporations, 
    non_financial_corporations, 
    general_government,
    households_npish

from (
    select sum(value) as financial_corporations, time from debt 
    where country = 'greece' and category_2 = 'Residents' and category_3 = 'Financial corporations' group by time
) as financial_corporations

join (
    select sum(value) as non_financial_corporations, time from debt 
    where country = 'greece' and category_2 = 'Residents' and category_3 = 'Non-financial corporations' group by time
) as non_financial_corporations on financial_corporations.time = non_financial_corporations.time

join (
    select sum(value) as general_government, time from debt 
    where country = 'greece' and category_2 = 'Residents' and category_3 = 'General government' group by time
) as general_government on financial_corporations.time = general_government.time

join (
    select sum(value) as households_npish, time from debt 
    where country = 'greece' and category_2 = 'Residents' and category_3 = 'Households-NPISH' group by time
) as households_npish on financial_corporations.time = households_npish.time
