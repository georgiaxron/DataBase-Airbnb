/*Triger for host*/
CREATE FUNCTION decrease_host()
	RETURNS trigger AS $$
	BEGIN
		UPDATE "Host" 
		SET listings_count = listings_count - 1 WHERE id = OLD.id;
		RETURN OLD;
	END;
$$ LANGUAGE plpgsql;


CREATE FUNCTION increase_host()
	RETURNS trigger AS $$
	BEGIN
		UPDATE "Host" 
		SET listings_count = listings_count + 1 WHERE id = NEW.id;
		RETURN NEW;
	END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER listing_erasion AFTER DELETE ON "Listing"
FOR EACH ROW
EXECUTE PROCEDURE decrease_host();


CREATE TRIGGER listing_addition AFTER INSERT ON "Listing"
FOR EACH ROW
EXECUTE PROCEDURE increase_host();

/*Triger for reviews*/
CREATE FUNCTION decrease_reviews()
	RETURNS trigger AS $$
	BEGIN
		UPDATE "Listing" 
		SET number_of_reviews = number_of_reviews - 1 WHERE id = OLD.listing_id;
		RETURN OLD;
	END;
$$ LANGUAGE plpgsql;


CREATE FUNCTION increase_reviews()
	RETURNS trigger AS $$
	BEGIN
		UPDATE "listing" 
		SET number_of_reviews = number_of_reviews + 1 WHERE id = NEW.listing_id;
		RETURN NEW;
	END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER reviews_erasion AFTER DELETE ON "Review"
FOR EACH ROW
EXECUTE PROCEDURE decrease_reviews();


CREATE TRIGGER reviews_addition AFTER INSERT ON "Review"
FOR EACH ROW
EXECUTE PROCEDURE increase_reviews();
