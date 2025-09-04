drop table if exists Nashville_Housing;

CREATE TABLE Nashville_Housing (
UniqueID VARCHAR(255),
ParcelID VARCHAR(255),
LandUse VARCHAR(255),
PropertyAddress VARCHAR(255),	
SaleDate date, 	
SalePrice VARCHAR(255),
LegalReference VARCHAR(255),	
SoldAsVacant VARCHAR(255),	
OwnerName VARCHAR(255),
OwnerAddress VARCHAR(255),	
Acreage VARCHAR(255),
TaxDistrict VARCHAR(255),	
LandValue VARCHAR(255),
BuildingValue VARCHAR(255),	
TotalValue VARCHAR(255),	
YearBuilt VARCHAR(255),	
Bedrooms VARCHAR(255),	
FullBath VARCHAR(255),	
HalfBath VARCHAR(255));

-- CREATE TABLE nueva_tabla AS SELECT * FROM tabla_original;

-- CMD
-- mysql --local-infile -u root -p
-- USE data_base_name;

-- LOAD DATA LOCAL INFILE 'C:\\file.csv'
-- INTO TABLE Nashville_Housing
-- FIELDS TERMINATED BY ','
-- LINES TERMINATED BY '\n';



SELECT * 
FROM portafolio_project.nashville_housing
;

-- delete unused data

SELECT * 
FROM portafolio_project.nashville_housing
;

alter table nashville_housing
drop column PropertyAddress;

alter table nashville_housing
drop column OwnerAddress;