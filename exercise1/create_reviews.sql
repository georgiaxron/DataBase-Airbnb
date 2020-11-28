create table "Reviews"(
   listing_id int,
   id int primary key not null,
   date date,
   reviewer_id int,
   reviewer_name varchar(70),
   comments text
);