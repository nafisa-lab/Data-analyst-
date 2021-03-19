/****** Script for SelectTopNRows command from SSMS  ******/
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