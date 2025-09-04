SELECT * 
FROM portafolio_project.nashville_housing
;

-- update table where the property adreess was empty

SELECT *
FROM portafolio_project.nashville_housing
where PropertyAddress = '';

select t1.ParcelID, t1.PropertyAddress, t2.ParcelID, t2.PropertyAddress, if(t2.PropertyAddress, '', t1.PropertyAddress) address
FROM nashville_housing t1
join nashville_housing t2 
	on t1.ParcelID = t2.ParcelID 
    and t1.UniqueID <> t2.UniqueID
where t2.PropertyAddress = ''
;

update nashville_housing nh
join nashville_housing nh2 on nh.ParcelID = nh2.ParcelID and nh.UniqueID <> nh2.UniqueID
set nh.PropertyAddress = if(nh.PropertyAddress, '', nh2.PropertyAddress)
where nh.PropertyAddress = ''
;

-- breaking property adreess into individual columns (adress, city, state)

SELECT 
	SUBSTRING_INDEX(PropertyAddress,'.', 1) AS Adress, 
    SUBSTRING_INDEX(PropertyAddress,'.', -1) AS City
FROM nashville_housing
;

alter table Nashville_housing
add Property_Split_Address varchar(255)
;
update nashville_housing
set Property_Split_Address = SUBSTRING_INDEX(PropertyAddress,'.', 1)
;

alter table nashville_housing
add Property_Split_City varchar(255)
;
update nashville_housing
set Property_Split_city = SUBSTRING_INDEX(PropertyAddress,'.', -1) 
;
select PropertyAddress, Property_Split_Address, Property_Split_city
FROM nashville_housing
;



-- breaking Owner address into individual columns (adress, city, state)

select OwnerAddress
FROM nashville_housing
;

select 
	OwnerAddress, 
    SUBSTRING_INDEX(OwnerAddress,'.', 1) AS Adress,
    SUBSTRING_INDEX(SUBSTRING_INDEX(OwnerAddress,'.', -2),'.', 1) as City,
    SUBSTRING_INDEX(OwnerAddress,'.', -1) AS State
FROM nashville_housing
;

alter table nashville_housing
add Owner_Split_adress varchar(255)
;

alter table nashville_housing
add Owner_Split_City varchar(255)
;

alter table nashville_housing
add Owner_Split_State varchar(255)
;

update nashville_housing
set Owner_Split_Adress = SUBSTRING_INDEX(OwnerAddress,'.', 1),
Owner_Split_city = SUBSTRING_INDEX(SUBSTRING_INDEX(OwnerAddress,'.', -2),'.', 1),
Owner_Split_State = SUBSTRING_INDEX(OwnerAddress,'.', -1)
;

-- update nashville_housing
-- set Owner_Split_city = SUBSTRING_INDEX(SUBSTRING_INDEX(OwnerAddress,'.', -2),'.', 1);
-- update nashville_housing
-- set Owner_Split_State = SUBSTRING_INDEX(OwnerAddress,'.', -1);

select Owner_Split_Adress, Owner_Split_city, Owner_Split_State
FROM nashville_housing
;

-- change 'Y' and 'N' to YES and NO in 'Sold as Vacant' field

select distinct SoldAsVacant
FROM nashville_housing
;

select SoldAsVacant, count(SoldAsVacant)
FROM nashville_housing
group by SoldAsVacant;

update nashville_housing
set SoldAsVacant = CASE 
	WHEN SoldAsVacant = 'Y' THEN 'Yes'
    WHEN SoldAsVacant = 'N' THEN 'No'
    else SoldAsVacant
END;

-- Removed duplicates

with t1 as(
select *,
row_number() over (partition by 
							ParcelID, 
                            PropertyAddress, 
                            SaleDate, SalePrice, 
                            LegalReference 
                            order by UniqueID) as row_num
FROM nashville_housing)
select * 
from t1
where row_num > 1;


with t1 as(
select *,
row_number() over (partition by 
							ParcelID, 
                            PropertyAddress, 
                            SaleDate, 
                            SalePrice, 
                            LegalReference 
                            order by UniqueID) as row_num
FROM nashville_housing )
DELETE t 
FROM nashville_housing t
join t1 on t1.LegalReference = t.LegalReference
where t1.row_num > 1;


-- delete unused data

SELECT * 
FROM portafolio_project.nashville_housing
;

alter table nashville_housing
drop column PropertyAddress;

alter table nashville_housing
drop column OwnerAddress;


