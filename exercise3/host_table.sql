create table "Host" as
	(select distinct
	host_id as id, 
	host_url as url, 
	host_name as name, 
	host_since as since, 
	host_location as location, 
	host_about as about, 
	host_response_time as response_time, 
	host_response_rate as response_rate,
	host_acceptance_rate as acceptance_rate, 
	host_is_superhost as is_superhost, 
	host_thumbnail_url as thumnail_url, 
	host_picture_url as pisture_url, 
	host_neighbourhood as neighbourhood, 
	host_listings_count as listings_count, 
	host_total_listings_count as total_listings_count, 
	host_verifications as verifications, 
	host_has_profile_pic as has_profile_pic, 
	host_identity_verified as identity_verified, 
	calculated_host_listings_count as calculated_listings_count from "Listings");

alter table "Listings" drop column host_url;
alter table "Listings" drop column host_name;
alter table "Listings" drop column host_since;
alter table "Listings" drop column host_location;
alter table "Listings" drop column host_about;
alter table "Listings" drop column host_response_time;
alter table "Listings" drop column host_response_rate;
alter table "Listings" drop column host_acceptance_rate;
alter table "Listings" drop column host_is_superhost;
alter table "Listings" drop column host_thumbnail_url;
alter table "Listings" drop column host_picture_url;
alter table "Listings" drop column host_neighbourhood;
alter table "Listings" drop column host_listings_count;
alter table "Listings" drop column host_total_listings_count;
alter table "Listings" drop column host_verifications;
alter table "Listings" drop column host_has_profile_pic;
alter table "Listings" drop column host_identity_verified;
alter table "Listings" drop column calculated_host_listings_count;

alter table "Host" add primary key(id);
alter table "Listings" add foreign key (host_id) references "Host"(id);
