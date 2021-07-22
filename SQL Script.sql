/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [ProductKey],

      CONVERT(date, CAST([OrderDateKey] AS CHAR(8)), 101)  as [Order Date Key] , -- changed the column to date format YYYY-MM-DD
	 
	  CONVERT(date, CAST([DueDateKey] AS CHAR(8)), 101)  as [Due Date Key] ,-- changed the column to date format YYYY-MM-DD
	 
	  CONVERT(date, CAST([ShipDateKey] AS CHAR(8)), 101)  as [Ship Date Key] ,-- changed the column to date format YYYY-MM-DD
	 
      [CustomerKey],
      --,[PromotionKey]
      --,[CurrencyKey]
      --,[SalesTerritoryKey]
         [SalesOrderNumber],
      --,[SalesOrderLineNumber]
      --,[RevisionNumber]
      --,[OrderQuantity]
      --,[UnitPrice]
      --,[ExtendedAmount]
      --[UnitPriceDiscountPct]
      --,[DiscountAmount]
      --,[ProductStandardCost]
      --,[TotalProductCost]
         [SalesAmount]
      --,[TaxAmt]
      --,[Freight]
      --,[CarrierTrackingNumber]
      --,[CustomerPONumber]
      --,[OrderDate]
      --,[DueDate]
      --,[ShipDate]
  FROM [AdventureWorksDW2019].[dbo].[FactInternetSales]
  where left (OrderDateKey, 4) >= year(getdate()) - 2  --- to find the sales for last 2 year
  order by OrderDateKey ASC ;
  
  -- SQL script -Customer table and customer city
  
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
  
  -- SQL script Calender table.
  
  SELECT [DateKey]
      ,[FullDateAlternateKey] as Date,
      --,[DayNumberOfWeek]
      [EnglishDayNameOfWeek] as Day,
      --,[SpanishDayNameOfWeek]
      --,[FrenchDayNameOfWeek]
      --,[DayNumberOfMonth]
      --,[DayNumberOfYear]
      --,[WeekNumberOfYear]
      [EnglishMonthName] as Months ,
	  left (EnglishMonthName , 3 ) as Monthshort , --- useful in case of visualizaton 
      --,[SpanishMonthName]
      --,[FrenchMonthName]
      [MonthNumberOfYear] as Monthnr ,
      [CalendarQuarter] as Quarters,
      [CalendarYear] as Years 
      --,[CalendarSemester]
      --,[FiscalQuarter]
      --,[FiscalYear]
      --,[FiscalSemester]
  FROM [AdventureWorksDW2019].[dbo].[DimDate]
  where [CalendarYear] >= 2019
  
  SELECT  p.[ProductKey] as [Product Key],
       p.[ProductAlternateKey] as [prduc alternate Key],
      p.[ProductSubcategoryKey],
      --,[WeightUnitMeasureCode]
      --,[SizeUnitMeasureCode]
      p.[EnglishProductName] as [Product Name],
      pc.[EnglishProductCategoryName] as [Product Category], --- Joinned the Product category 
      ps.[EnglishProductSubcategoryName] as [Product Subcategory], --- Joinned the Product subcategory table
      --,[SpanishProductName]
      --,[FrenchProductName]
      --,[StandardCost]
      --,[FinishedGoodsFlag]
      p.[Color] as [Product Color],
      --,[SafetyStockLevel]
      --,[ReorderPoint]
      --,[ListPrice]
      p.[Size] as [Product Size],
      --,[SizeRange]
      --,[Weight]
      --,[DaysToManufacture]
      p.[ProductLine] as [Product Line],
      --,[DealerPrice]
      --,[Class]
      --,[Style]
      p.[ModelName] as [Product Model Name],
      --,[LargePhoto]
      p.[EnglishDescription] as [Product Description],
      --,[FrenchDescription]
      --,[ChineseDescription]
      --,[ArabicDescription]
      --,[HebrewDescription]
      --,[ThaiDescription]
      --,[GermanDescription]
      --,[JapaneseDescription]
      --,[TurkishDescription]
      --,[StartDate]
      --,[EndDate]
      isnull (p.[Status] ,'Outdated')  as [Product Status]
  FROM [AdventureWorksDW2019].[dbo].[DimProduct] as p
  Left Join [dbo].[DimProductSubcategory] as ps on ps.[ProductSubcategoryKey] = p.[ProductSubcategoryKey]
  Left Join [dbo].[DimProductCategory] as pc on pc.[ProductCategoryKey] = ps.[ProductCategoryKey]
  order by  [ProductKey] ASC ;
