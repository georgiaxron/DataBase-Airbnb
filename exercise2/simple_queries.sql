/* Count how many listings are located in ΚΕΡΑΜΕΙΚΟΣ and their price is below 20 and they dont require a phone verification
Output: 62
*/

Select Count("Listings".id)
from "Listings"
join "Neighbourhoods" on "Listings".neighbourhood_cleansed = "Neighbourhoods".neighbourhood
where "Listings".price < '20' and "Neighbourhoods".neighbourhood = 'ΚΕΡΑΜΕΙΚΟΣ' and "Listings".require_guest_phone_verification is false



/* Display listings id and number of reviews where the listing is available, is located in 'ΓΚΑΖΙ' and requires license
Output: 93
*/

Select distinct "Listings".number_of_reviews, "Listings".id
from "Listings"
join "Calendar" on "Listings".id = "Calendar".listing_id
where "Calendar".available is true and "Listings".neighbourhood_cleansed = 'ΓΚΑΖΙ' and "Listings".requires_license is true


/* Display listings id, url and neighbourhood where "Geolocation".properties_neighbourhood = 'ΠΑΓΚΡΑΤΙ'
Output: 538
*/

select "Listings".id, "Listings".listing_url, "Geolocation".properties_neighbourhood
from "Listings"
join "Neighbourhoods" on "Listings".neighbourhood_cleansed = "Neighbourhoods".neighbourhood
join "Geolocation" on "Neighbourhoods".neighbourhood = "Geolocation".properties_neighbourhood
where "Geolocation".properties_neighbourhood = 'ΠΑΓΚΡΑΤΙ'


/* Display reviewer_id  when they appear in "Reviews" table more than 10 times
Output: 129
*/

select Count("Reviews".reviewer_id), "Reviews".reviewer_id 
from "Reviews"
GROUP BY "Reviews".reviewer_id
HAVING COUNT("Reviews".reviewer_id)>10

/* Display all listings available for one day renting on a specific date in a specific area.  
Output: 45
*/
select *
from "Listings-Summary"
join "Calendar" on "Listings-Summary".id = "Calendar".listing_id
where "Listings-Summary".neighbourhood = 'ΑΜΠΕΛΟΚΗΠΟΙ' and "Calendar".date = '2020-05-14' and "Calendar".available = 't' and "Listings-Summary".minimum_nights < 2 and "Listings-Summary".price < 40

/* Display all listings available for one day renting on a specific date in a specific area with no reviews. 
Output: 3
*/
select *
from "Listings-Summary"
join "Calendar" on "Listings-Summary".id = "Calendar".listing_id
full outer join "Reviews" on "Listings-Summary".id = "Reviews".listing_id
where "Listings-Summary".neighbourhood = 'ΑΜΠΕΛΟΚΗΠΟΙ' and "Calendar".date = '2020-05-14' and "Calendar".available = 't' and "Listings-Summary".minimum_nights < 2 and "Listings-Summary".price < 40 and "Reviews".reviewer_id is NULL


/*Display the id and the price of a listing when the type of the listing is Entire home/apt and its available on 2020-05-14 with price lower than 20
Output: 142
*/

select "Listings-Summary".id, "Listings-Summary".price
from "Listings-Summary" join "Calendar" 
on "Listings-Summary".id = "Calendar".listing_id
where "Listings-Summary".price <= 20 and "Calendar".available = 'TRUE' and "Calendar".date ='2020-05-14' and "Listings-Summary".room_type = 'Entire home/apt'


/*Display in asceding order the date, the id of a listing and the price of the listing when the hosts name is 'Vaggelis'
Output: 1460
*/


Select "Calendar".date, "Listings".id, "Calendar".price
from "Listings"  right outer join "Calendar" on "Listings".id = "Calendar".listing_id
where "Listings".host_name = 'Vaggelis'
order by "Calendar".date



/*Display the Listings url , host name and price of the listing if it is available on 2020-05-14 and the host is superhost
Output: 4367
*/

select "Listings".listing_url, "Listings".host_name, "Listings".price
from "Listings"
inner join "Calendar" on "Listings".id="Calendar".listing_id
where "Listings".host_is_superhost=TRUE AND "Calendar".date= '2020-05-14'



/* Display the url and the id of a listing that has not a review score
Output: 63
*/

select distinct "Listings".listing_url, "Listings".id
from "Listings"
inner join "Reviews" on "Listings".id="Reviews".listing_id
where "Listings".review_scores_rating is null



 /* Display the url and the review score for available houses that have minimum_nights between 3 to 5
Output: 10492
*/

select distinct "Listings".listing_url, "Listings".review_scores_rating
from "Listings"
inner join "Calendar" on "Listings".id="Calendar".listing_id
where "Calendar".available = TRUE and "Listings".minimum_nights BETWEEN 3 AND 5

 /* Display the url of listings that have the word 'worst' in their review comments
Output: 228
*/

select "Listings".listing_url
from "Listings" join "Reviews" 
on "Listings".id = "Reviews".listing_id
where "Reviews".comments like '%worst%' or "Reviews".comments like '%Worst%' or "Reviews".comments like '%WORST%'

