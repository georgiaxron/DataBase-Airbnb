CREATE TABLE "Amenity" AS
(SELECT distinct unnest(amenities::text[]) as amenity_name from "Room" );

ALTER TABLE "Amenity" ADD amenity_id INT GENERATED ALWAYS AS IDENTITY;

ALTER TABLE "Amenity" ADD PRIMARY KEY (amenity_id);



CREATE TABLE "Listing_Amenity" AS
(SELECT temp.listing_id , "Amenity".amenity_id as amenity_id from "Amenity",
   (SELECT "Room".listing_id as listing_id, unnest(amenities::text[]) as amenity_name from "Room" ) AS temp
  where temp.amenity_name = "Amenity".amenity_name);
  
  
alter table "Room" drop column amenities;


ALTER TABLE "Listing_Amenity"
add foreign key(listing_id) REFERENCES "Listing"(id),
add foreign key(amenity_id) REFERENCES "Amenity"(amenity_id);
