--QUERY 1
CREATE INDEX index_for_Host ON "Host"(id);
DROP INDEX index_for_Host;


--QUERY 2

CREATE INDEX index_for_price ON "Price"(price);
DROP INDEX index_for_price;


--QUERY 3

CREATE INDEX index_for_listing_amenity ON "Listing_Amenity"(listing_id, amenity_id);
DROP INDEX index_for_listing_amenity;


--QUERY 4

CREATE INDEX index_for_price_room ON "Price"(price);
CREATE INDEX index_for_room ON "Room"(bedrooms);
CREATE INDEX index_for_availability ON "Listing"(has_availability);

DROP INDEX index_for_price_room;
DROP INDEX index_for_room;
DROP INDEX index_for_availability;


--QUERY 5
CREATE INDEX index_for_host_name ON "Host"(name);
CREATE INDEX index_for_review_name ON "Review"(reviewer_name);

DROP INDEX index_for_host_name;
DROP INDEX index_for_review_name;


--QUERY 6

CREATE INDEX index_for_location ON "Location"(neighbourhood_cleansed);
DROP INDEX index_for_location;


--QUERY 7

CREATE INDEX index_for_bed_type	ON "Room"(bed_type);
DROP INDEX index_for_bed_type;

