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