create table myntra_sales(
			product_id int primary key,
			brand_name	varchar(50) not null,
			pants_description	varchar(100),
			price	int,
			mrp	float,
			discount_percent	float(50),	
			ratings	float(50),
			number_of_ratings int
);

select * from myntra_sales;

select count(*) from myntra_sales;


--Which brands have the most products?
select
		brand_name,
		count(product_id) as total_products
		from myntra_sales
		group by brand_name
		order by total_products desc
		limit 10;
	
--Which brands have the highest average selling price? Business Question

select brand_name,
		round(avg(price),2) as avg_price
		from myntra_sales
		group by brand_name
		order by avg_price desc;

--Which brands offer the biggest discounts?

select brand_name,
		round(avg(discount_percent)) as avg_discount
		from myntra_sales
		group by brand_name
		order by avg_discount desc;
		
--Which brands have the highest-rated products?

select brand_name,
		avg(ratings) as avg_ratings
		from myntra_sales
		group by brand_name
		having count(product_id) >=20
		order by avg_ratings desc;

--Which products are the most popular?

select product_id,
		brand_name,
		pants_description,
		price,
		ratings,
		number_of_ratings
		from myntra_sales
		order by number_of_ratings desc;

		
--Does discount influence product popularity?
	select 
		case
			when discount_percent < 0.20 then 'Low discount'
			when discount_percent < 0.40 then 'Medium discount'
			when discount_percent < 0.60 then 'High discount'
			else 'Very High Discount'
			end as discount_category,
			count(*) as total_products,
			avg(number_of_ratings) as avg_ratings
			from myntra_sales
			group by discount_category
			order by avg_ratings desc;

--Does price affect product ratings?

	select 
		case
			when price < 500 then 'Under 500'
			when price < 1000 then '500-999'
			when price < 2000 then '1000-1999'
			when price < 3000 then '2000-2999'
			else '3000+'
			end as price_category,
			count(*) as total_products,
			avg(ratings) as avg_ratings,
			avg(number_of_ratings) as avg_number_of_ratings
			from myntra_sales
			group by price_category
			order by price_category;

--Which products give customers the biggest discount?

	select product_id,
		brand_name,
		price,
		mrp,
		pants_description,
		discount_percent,
		mrp - price as discount_amount
		from myntra_sales
		order by discount_amount desc;
	

--Which brands have the highest discount value?

	select brand_name,
		avg(mrp-price) as avg_discount_amount
		from myntra_sales
		group by brand_name
		order by avg_discount_amount desc;


--Which brands have the best value proposition?

	select brand_name,
	round(avg(price),2) as avg_price,
	avg(discount_percent) as avg_discount_percent,
	avg(ratings) as avg_ratings,
	round(avg(number_of_ratings),2) as avg_number_of_ratings
	from myntra_sales
	group by brand_name
	having count(*) >=20
	order by avg_ratings desc;