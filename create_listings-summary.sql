create table "Listings-Summary"(
   id int primary key not null,
   name varchar(140),
   host_id int,
   host_name varchar(60),
   neighbourhood_group varchar(10),
   neighbourhood varchar(70),
   latitude varchar(10),
   longitude varchar(10),
   room_type varchar(20),
   price int,
   minimum_nights int,
   number_of_reviews int,
   last_review varchar(10),
   reviews_per_month varchar(10),
   calculated_host_listings_count int,
   availability_365 int
);