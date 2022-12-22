USE DataCleaning

--- Data Cleaning of Nashville Housing Dataset
	
SELECT *
FROM [DataCleaning].[dbo].[NashvilleHousing];

--- Standardize Date Fromat

SELECT SaleDate, CONVERT(Date, SaleDate)
FROM [DataCleaning].[dbo].[NashvilleHousing];

UPDATE [DataCleaning].[dbo].[NashvilleHousing]
SET SaleDate = CONVERT(Date, SaleDate);

ALTER TABLE [DataCleaning].[dbo].[NashvilleHousing]
ADD SaleDateCOnverted Date;

UPDATE [DataCleaning].[dbo].[NashvilleHousing]
SET SaleDateConverted = CONVERT(Date, SaleDate);

----------------------------------------------------------------------------

--- Populate Property Address Data 

SELECT *
FROM [DataCleaning].[dbo].[NashvilleHousing]
--WHERE PropertyAddress IS NULL
ORDER BY ParcelID;

SELECT *
FROM [DataCleaning].[dbo].[NashvilleHousing]

SELECT a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, ISNULL(a.PropertyAddress, b.PropertyAddress)
FROM [DataCleaning].[dbo].[NashvilleHousing] a
JOIN [DataCleaning].[dbo].[NashvilleHousing] b
	ON a.ParcelID = b.ParcelID
	AND a.[UniqueID ] = b.[UniqueID ]
WHERE a.PropertyAddress IS NULL;

UPDATE a
SET PropertyAddress = ISNULL(a.PropertyAddress, b.PropertyAddress)
FROM [DataCleaning].[dbo].[NashvilleHousing] a
JOIN [DataCleaning].[dbo].[NashvilleHousing] b
	ON a.ParcelID = b.ParcelID
	AND a.[UniqueID ] = b.[UniqueID ]

----------------------------------------------------------------------------


--- Breaking out Address into Individual Columns (Address, City, State)

SELECT *
FROM [DataCleaning].[dbo].[NashvilleHousing]
--WHERE PropertyAddress IS NULL
--ORDER BY ParcelID;

SELECT 
SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress)) AS Address,
CHARINDEX(',', PropertyAddress)
FROM [DataCleaning].[dbo].[NashvilleHousing]

--- Removing the comma

SELECT 
SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1) AS Address,
SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) + 1 , LEN(PropertyAddress)) AS Address
FROM [DataCleaning].[dbo].[NashvilleHousing]


ALTER TABLE [DataCleaning].[dbo].[NashvilleHousing]
ADD PropertySplitAddress Nvarchar(255);

UPDATE [DataCleaning].[dbo].[NashvilleHousing]
SET PropertySplitAddress = SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1) 


ALTER TABLE [DataCleaning].[dbo].[NashvilleHousing]
ADD PropertySplitCity Nvarchar(255);

UPDATE [DataCleaning].[dbo].[NashvilleHousing]
SET PropertySplitCity = SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) + 1 , LEN(PropertyAddress))


SELECT * FROM [DataCleaning].[dbo].[NashvilleHousing]


--- Easier way using PARSENAME

SELECT 
PARSENAME(REPLACE(OwnerAddress, ',','.') ,3),
PARSENAME(REPLACE(OwnerAddress, ',','.') ,2),
PARSENAME(REPLACE(OwnerAddress, ',','.') ,1)
FROM [DataCleaning].[dbo].[NashvilleHousing]


--- 1st column 

ALTER TABLE [DataCleaning].[dbo].[NashvilleHousing]
ADD OwnerSplitAddress Nvarchar(255);

UPDATE [DataCleaning].[dbo].[NashvilleHousing]
SET OwnerSplitAddress = PARSENAME(REPLACE(OwnerAddress, ',','.') ,3)

--- 2nd column

ALTER TABLE [DataCleaning].[dbo].[NashvilleHousing]
ADD OwnerSplitCity Nvarchar(255);

UPDATE [DataCleaning].[dbo].[NashvilleHousing]
SET OwnerSplitCity = PARSENAME(REPLACE(OwnerAddress, ',','.') ,2)

--- 3rd column

ALTER TABLE [DataCleaning].[dbo].[NashvilleHousing]
ADD OwnerSplitState Nvarchar(255);

UPDATE [DataCleaning].[dbo].[NashvilleHousing]
SET OwnerSplitState = PARSENAME(REPLACE(OwnerAddress, ',','.') ,1)

SELECT * FROM [DataCleaning].[dbo].[NashvilleHousing]

----------------------------------------------------------------------------

--- Change Y and N to Yes and No in "Sold as Vacant" field

SELECT DISTINCT(SoldAsVacant), COUNT(SoldAsVacant)
FROM [DataCleaning].[dbo].[NashvilleHousing]
GROUP BY SoldAsVacant
ORDER BY 2


SELECT SoldAsVacant,
	CASE WHEN SoldAsVacant = 'Y' THEN 'Yes'
		 WHEN SoldAsVacant = 'N' THEN 'No'
		 ELSE SoldAsVacant
		 END
FROM [DataCleaning].[dbo].[NashvilleHousing]

UPDATE [DataCleaning].[dbo].[NashvilleHousing]
SET SoldAsVacant = CASE WHEN SoldAsVacant = 'Y' THEN 'Yes'
		 WHEN SoldAsVacant = 'N' THEN 'No'
		 ELSE SoldAsVacant
		 END


----------------------------------------------------------------------------

--- Remove duplicates

WITH RowNumCTE AS (
SELECT *,
	ROW_NUMBER() OVER (
	PARTITION BY ParcelID,
				 PropertyAddress,
				 SalePrice,
				 SaleDate,
				 LegalReference
	ORDER BY UniqueID 
	) row_num
FROM [DataCleaning].[dbo].[NashvilleHousing]
)

DELETE
FROM RowNumCTE
WHERE row_num > 1 


------ Check if there is still duplicates

WITH RowNumCTE AS (
SELECT *,
	ROW_NUMBER() OVER (
	PARTITION BY ParcelID,
				 PropertyAddress,
				 SalePrice,
				 SaleDate,
				 LegalReference
	ORDER BY UniqueID 
	) row_num
FROM [DataCleaning].[dbo].[NashvilleHousing]
)

SELECT *
FROM RowNumCTE
WHERE row_num > 1 
ORDER BY PropertyAddress


----------------------------------------------------------------------------

--- Delete Unused Columns
--- PS: Do not delete any data from your raw data

SELECT *
FROM [DataCleaning].[dbo].[NashvilleHousing]

ALTER TABLE [DataCleaning].[dbo].[NashvilleHousing]
DROP COLUMN OwnerAddress, TaxDistrict, PropertyAddress

ALTER TABLE [DataCleaning].[dbo].[NashvilleHousing]
DROP COLUMN SaleDate