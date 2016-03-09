-- Which collars have a known owner? Display only collars with known owners and those owners' names.
SELECT lost_dog_collars.dog_name as dog_name_on_collar,
       dog_owners.name AS owner_name
FROM lost_dog_collars
INNER JOIN dog_owners
ON (dog_owners.dog_name = lost_dog_collars.dog_name);

-- For which collars is there no known owner? Display only collars without known owners.
SELECT lost_dog_collars.dog_name as dog_name_on_collar,
       dog_owners.name AS owner_name
FROM lost_dog_collars
LEFT JOIN dog_owners
ON (dog_owners.dog_name = lost_dog_collars.dog_name)
WHERE dog_owners.name IS NULL;

-- What collars are in our possession? Display all collars in our possession. If an owner exists for a given collar, display that also.
SELECT lost_dog_collars.dog_name as dog_name_on_collar,
       dog_owners.name AS owner_name
FROM lost_dog_collars
LEFT JOIN dog_owners
ON (dog_owners.dog_name = lost_dog_collars.dog_name);

-- What owners do we know about? Display all owners known to us. If a collar matches that owner, display the collar also.
SELECT DISTINCT ON (dog_owners.name) 
       dog_owners.name as owner_name, 
       lost_dog_collars.dog_name as dog_name_on_collar
FROM lost_dog_collars
JOIN dog_owners ON (dog_owners.dog_name = lost_dog_collars.dog_name);