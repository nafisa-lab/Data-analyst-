/****** Script for SelectTopNRows command from SSMS  ******/
SELECT  c.[CustomerKey] as [Customer Key],
	  --,[GeographyKey]
      --,[CustomerAlternateKey]
      --,[Title]
      c.[FirstName] as [First Name],
      --[MiddleName]
      c.[LastName] as [Last Name],
	  [FirstName] + ' '+ [LastName] as [Full Name], --concatinated the first and the last name 
      --,[NameStyle]
      --,[BirthDate]
      --,[MaritalStatus]
      --,[Suffix]
      case c.[Gender] when 'M' then 'Male' when 'F' then 'Female' end as Gender, --- changed the M and F to male and female
	  --,[EmailAddress]
      --,[YearlyIncome]
      --,[TotalChildren]
      --,[NumberChildrenAtHome]
      --,[EnglishEducation]
      --,[SpanishEducation]
      --,[FrenchEducation]
      --,[EnglishOccupation]
      --,[SpanishOccupation]
      --,[FrenchOccupation]
      --,[HouseOwnerFlag]
      --,[NumberCarsOwned]
      --,[AddressLine1]
      --,[AddressLine2]
      --,[Phone]
      [DateFirstPurchase] as [First Purchase],
      --,[CommuteDistance]
	  g.[City] as [Customer City]  --- Joined city from geography table
  FROM [AdventureWorksDW2019].[dbo].[DimCustomer] as c
  left join [dbo].[DimGeography] as g on g.[GeographyKey] = c.[GeographyKey]
  order by [CustomerKey] ASC ;