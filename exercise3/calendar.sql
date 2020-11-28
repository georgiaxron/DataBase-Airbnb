update "Calendar" set price = replace(price, '$', '');
update "Calendar" set price = replace(price, ',', '' );
update "Calendar" set adjusted_price = replace(adjusted_price, '$', '');
update "Calendar" set adjusted_price = replace(adjusted_price, ',', '' );

alter table "Calendar" alter column price type numeric(7, 2) using price::numeric(7, 2);
alter table "Calendar" alter column adjusted_price type numeric(7, 2) using adjusted_price::numeric(7, 2);
