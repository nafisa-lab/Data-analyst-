/****** Script for SelectTopNRows command from SSMS  ******/
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