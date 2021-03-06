USE [master]
GO
/****** Object:  Database [YuNengDW]    Script Date: 2017/9/19 11:04:45 ******/
CREATE DATABASE [YuNengDW]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'YuNengCoalDW', FILENAME = N'D:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\YuNengCoalDW.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'YuNengCoalDW_log', FILENAME = N'D:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\YuNengCoalDW_log.ldf' , SIZE = 5184KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [YuNengDW] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [YuNengDW].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [YuNengDW] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [YuNengDW] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [YuNengDW] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [YuNengDW] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [YuNengDW] SET ARITHABORT OFF 
GO
ALTER DATABASE [YuNengDW] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [YuNengDW] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [YuNengDW] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [YuNengDW] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [YuNengDW] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [YuNengDW] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [YuNengDW] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [YuNengDW] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [YuNengDW] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [YuNengDW] SET  DISABLE_BROKER 
GO
ALTER DATABASE [YuNengDW] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [YuNengDW] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [YuNengDW] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [YuNengDW] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [YuNengDW] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [YuNengDW] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [YuNengDW] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [YuNengDW] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [YuNengDW] SET  MULTI_USER 
GO
ALTER DATABASE [YuNengDW] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [YuNengDW] SET DB_CHAINING OFF 
GO
ALTER DATABASE [YuNengDW] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [YuNengDW] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [YuNengDW] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'YuNengDW', N'ON'
GO
USE [YuNengDW]
GO
/****** Object:  Table [dbo].[DimCoal]    Script Date: 2017/9/19 11:04:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DimCoal](
	[CoalKey] [int] NOT NULL,
	[CoalName] [varchar](50) NOT NULL,
	[ChineseCoalName] [varchar](50) NULL,
	[Vdaf] [nchar](10) NULL,
	[GRL] [nchar](10) NULL,
	[Ymm] [nchar](10) NULL,
	[b] [nchar](10) NULL,
	[PM] [nchar](10) NULL,
	[Qgr] [nchar](10) NULL,
 CONSTRAINT [PK_DimCoal] PRIMARY KEY CLUSTERED 
(
	[CoalKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DimCoalVendor]    Script Date: 2017/9/19 11:04:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimCoalVendor](
	[CoalVendorKey] [int] NOT NULL,
	[GeoGraphyKey] [int] NOT NULL,
	[ParentCoalVendorKey] [int] NULL,
	[CoalVendorName] [nchar](10) NOT NULL,
 CONSTRAINT [PK_DimCoalVendor] PRIMARY KEY CLUSTERED 
(
	[CoalVendorKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DimDate]    Script Date: 2017/9/19 11:04:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimDate](
	[DateKey] [int] NOT NULL,
	[FullDateAlternateKey] [date] NOT NULL,
	[DayNumberOfWeek] [tinyint] NOT NULL,
	[EnglishDayNameOfWeek] [nvarchar](10) NOT NULL,
	[DayNumberOfMonth] [tinyint] NOT NULL,
	[DayNumberOfYear] [smallint] NOT NULL,
	[WeekNumberOfYear] [tinyint] NOT NULL,
	[EnglishMonthName] [nvarchar](10) NOT NULL,
	[MonthNumberOfYear] [tinyint] NOT NULL,
	[CalendarQuarter] [tinyint] NOT NULL,
	[CalendarYear] [smallint] NOT NULL,
	[CalendarSemester] [tinyint] NOT NULL,
	[FiscalQuarter] [tinyint] NOT NULL,
	[FiscalYear] [smallint] NOT NULL,
	[FiscalSemester] [tinyint] NOT NULL,
 CONSTRAINT [PK_DimDate] PRIMARY KEY CLUSTERED 
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DimGeography]    Script Date: 2017/9/19 11:04:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimGeography](
	[GeographyKey] [int] NOT NULL,
	[City] [nvarchar](30) NULL,
	[StateProvinceCode] [nvarchar](3) NULL,
	[StateProvinceName] [nvarchar](50) NULL,
	[CountryRegionCode] [nvarchar](3) NULL,
	[EnglishCountryRegionName] [nvarchar](50) NULL,
	[PostalCode] [nvarchar](15) NULL,
 CONSTRAINT [PK_DimGeography] PRIMARY KEY CLUSTERED 
(
	[GeographyKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DimIndicator]    Script Date: 2017/9/19 11:04:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DimIndicator](
	[IndicatorKey] [int] NOT NULL,
	[IndicatorName] [varchar](100) NULL,
 CONSTRAINT [PK_DimIndicator] PRIMARY KEY CLUSTERED 
(
	[IndicatorKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DimIndicatorReport]    Script Date: 2017/9/19 11:04:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DimIndicatorReport](
	[IndicatorReportKey] [int] NOT NULL,
	[IndicatorKey] [int] NULL,
	[ReportKey] [int] NOT NULL,
	[IndicatorSortInReport] [int] NULL,
	[DisplayName] [varchar](50) NULL,
 CONSTRAINT [PK_IndicatorReport] PRIMARY KEY CLUSTERED 
(
	[IndicatorReportKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DimMine]    Script Date: 2017/9/19 11:04:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DimMine](
	[MineKey] [int] NOT NULL,
	[GeoGraphyKey] [int] NOT NULL,
	[MineName] [varchar](50) NULL,
 CONSTRAINT [PK_DimMine] PRIMARY KEY CLUSTERED 
(
	[MineKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DimOrganization]    Script Date: 2017/9/19 11:04:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DimOrganization](
	[OrganizationKey] [int] NOT NULL,
	[GeoGraphyKey] [int] NULL,
	[ParentOrganizationKey] [int] NULL,
	[PercentageOfOwnership] [varchar](16) NULL,
	[OrganizationName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DimOrganization] PRIMARY KEY CLUSTERED 
(
	[OrganizationKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DimReport]    Script Date: 2017/9/19 11:04:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DimReport](
	[ReportKey] [int] NOT NULL,
	[ReportName] [varchar](100) NULL,
 CONSTRAINT [PK_DimReport] PRIMARY KEY CLUSTERED 
(
	[ReportKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DimTradeType]    Script Date: 2017/9/19 11:04:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DimTradeType](
	[TradeTypeKey] [int] NOT NULL,
	[StartDate] [int] NULL,
	[EndDate] [int] NULL,
	[Description] [varchar](50) NULL,
 CONSTRAINT [PK_DimTradeType] PRIMARY KEY CLUSTERED 
(
	[TradeTypeKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FactCoalPurchase]    Script Date: 2017/9/19 11:04:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactCoalPurchase](
	[BatchNumber] [int] NOT NULL,
	[MineKey] [int] NOT NULL,
	[TradeTypeKey] [int] NOT NULL,
	[CoalVendorKey] [int] NOT NULL,
	[CoalKey] [int] NOT NULL,
	[OrganizationKey] [int] NOT NULL,
	[ShipDate] [int] NOT NULL,
	[DueDate] [int] NOT NULL,
	[OrderDate] [int] NOT NULL,
	[CoalWeightFactory] [float] NOT NULL,
	[CoalWeightMine] [float] NOT NULL,
	[CoalWeightFinal] [float] NOT NULL,
	[CoalHeatMJ] [float] NOT NULL,
	[CoalHeatCAL] [float] NOT NULL,
	[UnitPrice] [float] NOT NULL,
	[UnitStandardCoalPrice] [float] NOT NULL,
	[UnitFreightPrice] [float] NOT NULL,
	[UnitStandardCoalFreightPrice] [float] NOT NULL,
	[CoalCost] [float] NOT NULL,
	[FreightCost] [float] NOT NULL,
	[TotalCost] [float] NOT NULL,
	[CoalMarPct] [float] NULL,
	[CoalAarPct] [float] NULL,
	[CoalVdafPct] [float] NULL,
	[CoalStPct] [float] NULL,
 CONSTRAINT [PK_FactCoalPurchase] PRIMARY KEY CLUSTERED 
(
	[BatchNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FactMonthlyProduce]    Script Date: 2017/9/19 11:04:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactMonthlyProduce](
	[ProduceKey] [int] NOT NULL,
	[IndicatorKey] [int] NOT NULL,
	[OrganizationKey] [int] NOT NULL,
	[DateKey] [int] NOT NULL,
	[CalendarYear] [smallint] NOT NULL,
	[MonthNumberOfYear] [tinyint] NOT NULL,
	[Amount] [float] NOT NULL,
 CONSTRAINT [PK_FactMonthlyProduce] PRIMARY KEY CLUSTERED 
(
	[ProduceKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[DimCoalVendor]  WITH CHECK ADD  CONSTRAINT [FK_DimCoalVendor_DimCoalVendor] FOREIGN KEY([ParentCoalVendorKey])
REFERENCES [dbo].[DimCoalVendor] ([CoalVendorKey])
GO
ALTER TABLE [dbo].[DimCoalVendor] CHECK CONSTRAINT [FK_DimCoalVendor_DimCoalVendor]
GO
ALTER TABLE [dbo].[DimCoalVendor]  WITH CHECK ADD  CONSTRAINT [FK_DimCoalVendor_DimGeography] FOREIGN KEY([GeoGraphyKey])
REFERENCES [dbo].[DimGeography] ([GeographyKey])
GO
ALTER TABLE [dbo].[DimCoalVendor] CHECK CONSTRAINT [FK_DimCoalVendor_DimGeography]
GO
ALTER TABLE [dbo].[DimIndicatorReport]  WITH CHECK ADD  CONSTRAINT [FK_DimIndicatorReport_DimIndicator] FOREIGN KEY([IndicatorKey])
REFERENCES [dbo].[DimIndicator] ([IndicatorKey])
GO
ALTER TABLE [dbo].[DimIndicatorReport] CHECK CONSTRAINT [FK_DimIndicatorReport_DimIndicator]
GO
ALTER TABLE [dbo].[DimIndicatorReport]  WITH CHECK ADD  CONSTRAINT [FK_DimIndicatorReport_DimReport] FOREIGN KEY([ReportKey])
REFERENCES [dbo].[DimReport] ([ReportKey])
GO
ALTER TABLE [dbo].[DimIndicatorReport] CHECK CONSTRAINT [FK_DimIndicatorReport_DimReport]
GO
ALTER TABLE [dbo].[DimMine]  WITH CHECK ADD  CONSTRAINT [FK_DimMine_DimGeography] FOREIGN KEY([GeoGraphyKey])
REFERENCES [dbo].[DimGeography] ([GeographyKey])
GO
ALTER TABLE [dbo].[DimMine] CHECK CONSTRAINT [FK_DimMine_DimGeography]
GO
ALTER TABLE [dbo].[DimOrganization]  WITH CHECK ADD  CONSTRAINT [FK_DimOrganization_DimGeography] FOREIGN KEY([GeoGraphyKey])
REFERENCES [dbo].[DimGeography] ([GeographyKey])
GO
ALTER TABLE [dbo].[DimOrganization] CHECK CONSTRAINT [FK_DimOrganization_DimGeography]
GO
ALTER TABLE [dbo].[DimOrganization]  WITH CHECK ADD  CONSTRAINT [FK_DimOrganization_DimOrganization] FOREIGN KEY([ParentOrganizationKey])
REFERENCES [dbo].[DimOrganization] ([OrganizationKey])
GO
ALTER TABLE [dbo].[DimOrganization] CHECK CONSTRAINT [FK_DimOrganization_DimOrganization]
GO
ALTER TABLE [dbo].[DimTradeType]  WITH CHECK ADD  CONSTRAINT [FK_DimTradeType_DimDate] FOREIGN KEY([StartDate])
REFERENCES [dbo].[DimDate] ([DateKey])
GO
ALTER TABLE [dbo].[DimTradeType] CHECK CONSTRAINT [FK_DimTradeType_DimDate]
GO
ALTER TABLE [dbo].[DimTradeType]  WITH CHECK ADD  CONSTRAINT [FK_DimTradeType_DimDate1] FOREIGN KEY([EndDate])
REFERENCES [dbo].[DimDate] ([DateKey])
GO
ALTER TABLE [dbo].[DimTradeType] CHECK CONSTRAINT [FK_DimTradeType_DimDate1]
GO
ALTER TABLE [dbo].[FactCoalPurchase]  WITH CHECK ADD  CONSTRAINT [FK_FactCoalPurchase_DimCoal] FOREIGN KEY([CoalKey])
REFERENCES [dbo].[DimCoal] ([CoalKey])
GO
ALTER TABLE [dbo].[FactCoalPurchase] CHECK CONSTRAINT [FK_FactCoalPurchase_DimCoal]
GO
ALTER TABLE [dbo].[FactCoalPurchase]  WITH CHECK ADD  CONSTRAINT [FK_FactCoalPurchase_DimCoalVendor] FOREIGN KEY([CoalVendorKey])
REFERENCES [dbo].[DimCoalVendor] ([CoalVendorKey])
GO
ALTER TABLE [dbo].[FactCoalPurchase] CHECK CONSTRAINT [FK_FactCoalPurchase_DimCoalVendor]
GO
ALTER TABLE [dbo].[FactCoalPurchase]  WITH CHECK ADD  CONSTRAINT [FK_FactCoalPurchase_DimDate] FOREIGN KEY([OrderDate])
REFERENCES [dbo].[DimDate] ([DateKey])
GO
ALTER TABLE [dbo].[FactCoalPurchase] CHECK CONSTRAINT [FK_FactCoalPurchase_DimDate]
GO
ALTER TABLE [dbo].[FactCoalPurchase]  WITH CHECK ADD  CONSTRAINT [FK_FactCoalPurchase_DimDate1] FOREIGN KEY([ShipDate])
REFERENCES [dbo].[DimDate] ([DateKey])
GO
ALTER TABLE [dbo].[FactCoalPurchase] CHECK CONSTRAINT [FK_FactCoalPurchase_DimDate1]
GO
ALTER TABLE [dbo].[FactCoalPurchase]  WITH CHECK ADD  CONSTRAINT [FK_FactCoalPurchase_DimDate2] FOREIGN KEY([DueDate])
REFERENCES [dbo].[DimDate] ([DateKey])
GO
ALTER TABLE [dbo].[FactCoalPurchase] CHECK CONSTRAINT [FK_FactCoalPurchase_DimDate2]
GO
ALTER TABLE [dbo].[FactCoalPurchase]  WITH CHECK ADD  CONSTRAINT [FK_FactCoalPurchase_DimMine] FOREIGN KEY([MineKey])
REFERENCES [dbo].[DimMine] ([MineKey])
GO
ALTER TABLE [dbo].[FactCoalPurchase] CHECK CONSTRAINT [FK_FactCoalPurchase_DimMine]
GO
ALTER TABLE [dbo].[FactCoalPurchase]  WITH CHECK ADD  CONSTRAINT [FK_FactCoalPurchase_DimOrganization] FOREIGN KEY([OrganizationKey])
REFERENCES [dbo].[DimOrganization] ([OrganizationKey])
GO
ALTER TABLE [dbo].[FactCoalPurchase] CHECK CONSTRAINT [FK_FactCoalPurchase_DimOrganization]
GO
ALTER TABLE [dbo].[FactCoalPurchase]  WITH CHECK ADD  CONSTRAINT [FK_FactCoalPurchase_DimTradeType] FOREIGN KEY([TradeTypeKey])
REFERENCES [dbo].[DimTradeType] ([TradeTypeKey])
GO
ALTER TABLE [dbo].[FactCoalPurchase] CHECK CONSTRAINT [FK_FactCoalPurchase_DimTradeType]
GO
ALTER TABLE [dbo].[FactMonthlyProduce]  WITH CHECK ADD  CONSTRAINT [FK_FactMonthlyProduce_DimDate] FOREIGN KEY([DateKey])
REFERENCES [dbo].[DimDate] ([DateKey])
GO
ALTER TABLE [dbo].[FactMonthlyProduce] CHECK CONSTRAINT [FK_FactMonthlyProduce_DimDate]
GO
ALTER TABLE [dbo].[FactMonthlyProduce]  WITH CHECK ADD  CONSTRAINT [FK_FactMonthlyProduce_DimIndicator] FOREIGN KEY([IndicatorKey])
REFERENCES [dbo].[DimIndicator] ([IndicatorKey])
GO
ALTER TABLE [dbo].[FactMonthlyProduce] CHECK CONSTRAINT [FK_FactMonthlyProduce_DimIndicator]
GO
ALTER TABLE [dbo].[FactMonthlyProduce]  WITH CHECK ADD  CONSTRAINT [FK_FactMonthlyProduce_FactMonthlyProduce] FOREIGN KEY([OrganizationKey])
REFERENCES [dbo].[DimOrganization] ([OrganizationKey])
GO
ALTER TABLE [dbo].[FactMonthlyProduce] CHECK CONSTRAINT [FK_FactMonthlyProduce_FactMonthlyProduce]
GO
USE [master]
GO
ALTER DATABASE [YuNengDW] SET  READ_WRITE 
GO
