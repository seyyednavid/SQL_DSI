-- UNION AND UNION ALL
select product_area_name from grocery_db.product_areas where product_area_id in (1,2)
union
select product_area_name from grocery_db.product_areas where product_area_id in (4,5);

-- UNION does not consider repetitve record
select product_area_name from grocery_db.product_areas where product_area_id in (1,2)
union 
select product_area_name from grocery_db.product_areas where product_area_id in (1,2);

-- UNION ALL consider repetitive record
select product_area_name from grocery_db.product_areas where product_area_id in (1,2)
union all
select product_area_name from grocery_db.product_areas where product_area_id in (1,2);
