/* Display the for every listing the kind of the amenity and the amenity id
Output: 290020
*/

select "Listing_Amenity".listing_id, "Listing_Amenity".amenity_id, "Amenity".amenity_name
from "Listing_Amenity"
full outer join "Amenity" on "Listing_Amenity".amenity_id = "Amenity".amenity_id


/* Display the price and the url of a listing that is available and has more than 5 bedrooms in a price less than 10
Output: 968
*/

Select "Price".price, "Listing".listing_url, "Room".bedrooms
from "Price", "Listing"
join "Room" on "Listing".id = "Room".listing_id
where "Listing".has_availability is true and "Price".price < 10 and "Room".bedrooms > 5

/* Count how many times a reviewer that did more than 1000 reviews has the same name as a Host and display the name
Output: 164
*/

select Count("Review".reviewer_name), "Review".reviewer_name
from "Review"
full outer join "Host" on "Host".name = "Review".reviewer_name
GROUP BY "Review".reviewer_name
HAVING COUNT("Review".reviewer_name)>1000

/* Count how many times the name of a location appears in the listings and display the names of the locations that appeared more than 500 times
Output: 7
*/

select Count("Geolocation".properties_neighbourhood), "Geolocation".properties_neighbourhood
from "Geolocation"
join "Location" on "Location".neighbourhood_cleansed = "Geolocation".properties_neighbourhood
GROUP BY "Geolocation".properties_neighbourhood
HAVING (Count("Geolocation".properties_neighbourhood)) > 500

/* Display the listing id when a Room has a Pull-out Sofa and it is available
Output: 61
*/

SELECT distinct "Room".listing_id
from "Room"
join "Calendar" on "Calendar".listing_id = "Room".listing_id
WHERE "Calendar".available is true and "Room".bed_type = 'Pull-out Sofa'
