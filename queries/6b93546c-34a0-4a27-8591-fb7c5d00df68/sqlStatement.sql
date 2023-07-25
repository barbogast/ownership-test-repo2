select time, sum(value), category_3 from debt 
where country = 'belgium' and category_2 = 'Residents'
group by category_3, time