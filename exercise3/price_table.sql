create table "Price" as
	(select
	id as listing_id,
	price,
	weekly_price,
	monthly_price,
	security_deposit,
	cleaning_fee,
	guests_included,
	extra_people,
	minimum_nights,
	maximum_nights,
	minimum_minimum_nights,
	maximum_minimum_nights,
	minimum_maximum_nights,
	maximum_maximum_nights,
	minimum_nights_avg_ntm,
	maximum_nights_avg_ntm from "Listings");

update "Price" set price = replace(price, '$', '');
update "Price" set price = replace(price, ',', '' );
update "Price" set weekly_price = replace(weekly_price, '$', '' );
update "Price" set weekly_price = replace(weekly_price, ',', '' );
update "Price" set monthly_price = replace(monthly_price, '$', '' );
update "Price" set monthly_price = replace(monthly_price, ',', '' );
update "Price" set security_deposit = replace(security_deposit, '$', '' );
update "Price" set security_deposit = replace(security_deposit, ',', '' );
update "Price" set cleaning_fee = replace(cleaning_fee, '$', '' );
update "Price" set cleaning_fee = replace(cleaning_fee, ',', '' );

alter table "Price" alter column price type numeric(7, 2) using price::numeric(7, 2);
alter table "Price" alter column weekly_price type numeric(7, 2) using weekly_price::numeric(7, 2);
alter table "Price" alter column monthly_price type numeric(7, 2) using monthly_price::numeric(7, 2);
alter table "Price" alter column security_deposit type numeric(7, 2) using security_deposit::numeric(7, 2);

alter table "Listings" drop column price;
alter table "Listings" drop column weekly_price;
alter table "Listings" drop column monthly_price;
alter table "Listings" drop column security_deposit;
alter table "Listings" drop column cleaning_fee;
alter table "Listings" drop column guests_included;
alter table "Listings" drop column extra_people;
alter table "Listings" drop column minimum_nights;
alter table "Listings" drop column maximum_nights;
alter table "Listings" drop column minimum_minimum_nights;
alter table "Listings" drop column maximum_minimum_nights;
alter table "Listings" drop column minimum_maximum_nights;
alter table "Listings" drop column maximum_maximum_nights;
alter table "Listings" drop column minimum_nights_avg_ntm;
alter table "Listings" drop column maximum_nights_avg_ntm;


alter table "Price" add foreign key (listing_id) references "Listings"(id);