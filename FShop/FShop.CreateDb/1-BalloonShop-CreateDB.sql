--USE [master]
--GO
--/****** Object:  Database [BalloonShop]    Script Date: 09/22/2014 00:22:38 ******/
--CREATE DATABASE [BalloonShop] ON  PRIMARY 
--( NAME = N'BalloonShop', FILENAME = N'F:\MSDATA\SQL8R2\Data\BalloonShop.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
-- LOG ON 
--( NAME = N'BalloonShop_log', FILENAME = N'F:\MSDATA\SQL8R2\Data\BalloonShop.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
--GO
--ALTER DATABASE [BalloonShop] SET COMPATIBILITY_LEVEL = 90
--GO
--IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
--begin
--EXEC [BalloonShop].[dbo].[sp_fulltext_database] @action = 'enable'
--end
--GO
--ALTER DATABASE [BalloonShop] SET ANSI_NULL_DEFAULT OFF
--GO
--ALTER DATABASE [BalloonShop] SET ANSI_NULLS OFF
--GO
--ALTER DATABASE [BalloonShop] SET ANSI_PADDING OFF
--GO
--ALTER DATABASE [BalloonShop] SET ANSI_WARNINGS OFF
--GO
--ALTER DATABASE [BalloonShop] SET ARITHABORT OFF
--GO
--ALTER DATABASE [BalloonShop] SET AUTO_CLOSE OFF
--GO
--ALTER DATABASE [BalloonShop] SET AUTO_CREATE_STATISTICS ON
--GO
--ALTER DATABASE [BalloonShop] SET AUTO_SHRINK OFF
--GO
--ALTER DATABASE [BalloonShop] SET AUTO_UPDATE_STATISTICS ON
--GO
--ALTER DATABASE [BalloonShop] SET CURSOR_CLOSE_ON_COMMIT OFF
--GO
--ALTER DATABASE [BalloonShop] SET CURSOR_DEFAULT  GLOBAL
--GO
--ALTER DATABASE [BalloonShop] SET CONCAT_NULL_YIELDS_NULL OFF
--GO
--ALTER DATABASE [BalloonShop] SET NUMERIC_ROUNDABORT OFF
--GO
--ALTER DATABASE [BalloonShop] SET QUOTED_IDENTIFIER OFF
--GO
--ALTER DATABASE [BalloonShop] SET RECURSIVE_TRIGGERS OFF
--GO
--ALTER DATABASE [BalloonShop] SET  DISABLE_BROKER
--GO
--ALTER DATABASE [BalloonShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
--GO
--ALTER DATABASE [BalloonShop] SET DATE_CORRELATION_OPTIMIZATION OFF
--GO
--ALTER DATABASE [BalloonShop] SET TRUSTWORTHY OFF
--GO
--ALTER DATABASE [BalloonShop] SET ALLOW_SNAPSHOT_ISOLATION OFF
--GO
--ALTER DATABASE [BalloonShop] SET PARAMETERIZATION SIMPLE
--GO
--ALTER DATABASE [BalloonShop] SET READ_COMMITTED_SNAPSHOT OFF
--GO
--ALTER DATABASE [BalloonShop] SET HONOR_BROKER_PRIORITY OFF
--GO
--ALTER DATABASE [BalloonShop] SET  READ_WRITE
--GO
--ALTER DATABASE [BalloonShop] SET RECOVERY SIMPLE
--GO
--ALTER DATABASE [BalloonShop] SET  MULTI_USER
--GO
--ALTER DATABASE [BalloonShop] SET PAGE_VERIFY CHECKSUM
--GO
--ALTER DATABASE [BalloonShop] SET DB_CHAINING OFF
--GO
--EXEC sys.sp_db_vardecimal_storage_format N'BalloonShop', N'ON'
--GO
--USE [BalloonShop]
GO
/****** Object:  Table [dbo].[lc_SellerTable]    Script Date: 09/22/2014 00:22:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lc_SellerTable](
	[SellerID] [int] IDENTITY(1,1) NOT NULL,
	[SellerName] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Address2] [nvarchar](50) NULL,
	[City] [nvarchar](50) NOT NULL,
	[State] [nvarchar](50) NOT NULL,
	[Zip] [nchar](10) NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_SellerTable] PRIMARY KEY CLUSTERED 
(
	[SellerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lc_RegionShippingTable]    Script Date: 09/22/2014 00:22:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lc_RegionShippingTable](
	[RegionID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ShippingCost] [float] NOT NULL,
 CONSTRAINT [PK_RegionShippingTable] PRIMARY KEY CLUSTERED 
(
	[RegionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lc_Recommendation]    Script Date: 09/22/2014 00:22:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lc_Recommendation](
	[RecommendationID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Approved] [bit] NOT NULL,
	[DateInserted] [smalldatetime] NULL,
	[UserName] [nvarchar](50) NULL,
	[Points] [int] NOT NULL,
 CONSTRAINT [PK_Recommendation] PRIMARY KEY CLUSTERED 
(
	[RecommendationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lc_StateTaxTable]    Script Date: 09/22/2014 00:22:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lc_StateTaxTable](
	[StateTaxTableID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[TaxPercent] [float] NOT NULL,
 CONSTRAINT [PK_TaxTable] PRIMARY KEY CLUSTERED 
(
	[StateTaxTableID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lc_State]    Script Date: 09/22/2014 00:22:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lc_State](
	[StateID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CountryID] [int] NULL,
	[Abbreviation] [nvarchar](5) NOT NULL,
	[Published] [tinyint] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_lc_State] PRIMARY KEY CLUSTERED 
(
	[StateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lc_SizeTable]    Script Date: 09/22/2014 00:22:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lc_SizeTable](
	[SizeID] [int] IDENTITY(1,1) NOT NULL,
	[Size] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_SizeTable] PRIMARY KEY CLUSTERED 
(
	[SizeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[WordCount]    Script Date: 09/22/2014 00:22:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[WordCount]
(@Word VARCHAR(15), 
@Phrase VARCHAR(1000))
RETURNS SMALLINT
AS
BEGIN

/* If @Word or @Phrase is NULL the function returns 0 */
IF @Word IS NULL OR @Phrase IS NULL RETURN 0

/* @BiggerWord is a string one character longer than @Word */
DECLARE @BiggerWord VARCHAR(21)
SELECT @BiggerWord = @Word + 'x'

/* Replace @Word with @BiggerWord in @Phrase */
DECLARE @BiggerPhrase VARCHAR(2000)
SELECT @BiggerPhrase = REPLACE (@Phrase, @Word, @BiggerWord)

/* The length difference between @BiggerPhrase and @phrase
   is the number we''re looking for */
RETURN LEN(@BiggerPhrase) - LEN(@Phrase)
END
GO
/****** Object:  Table [dbo].[lc_ShippingRegion]    Script Date: 09/22/2014 00:22:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lc_ShippingRegion](
	[ShippingRegionID] [int] IDENTITY(1,1) NOT NULL,
	[ShippingRegion] [varchar](1000) NULL,
 CONSTRAINT [PK_ShippingRegion] PRIMARY KEY CLUSTERED 
(
	[ShippingRegionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[GetDepartments]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[GetDepartments] As
SELECT     Department.*
FROM         Department
GO
/****** Object:  StoredProcedure [dbo].[GetCategoryDetails]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCategoryDetails] 
(@CategoryID INT)
AS
SELECT DepartmentID, Name, Description
FROM Category
WHERE CategoryID = @CategoryID
GO
/****** Object:  StoredProcedure [dbo].[GetCategoriesInDepartment]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GetCategoriesInDepartment]
(@DepartmentID int)
as
select CategoryID, DepartmentID, Name, Description
From Category
Where DepartmentID = @DepartmentID
GO
/****** Object:  StoredProcedure [dbo].[HierarchialDeptCat]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[HierarchialDeptCat]
as
Select D.DepartmentID as ID, NULL as CategoryID, Null as ParentID, D.Name as Text from Department as D
union
Select Null as ID, C.CategoryID as CategoryID, C.DepartmentID as ParentID, C.Name as Text from Category as C
GO
/****** Object:  Table [dbo].[lc_Department]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lc_Department](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Description] [varchar](1000) NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[lc_CouponTable]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lc_CouponTable](
	[CouponID] [int] IDENTITY(1,1) NOT NULL,
	[CouponName] [nvarchar](50) NOT NULL,
	[CouponCode] [nvarchar](50) NOT NULL,
	[Amount] [money] NOT NULL,
	[DiscountPercent] [decimal](18, 3) NOT NULL,
	[ExpireDate] [smalldatetime] NOT NULL,
	[DateMade] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_CouponTable] PRIMARY KEY CLUSTERED 
(
	[CouponID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lc_Country]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lc_Country](
	[CountryID] [int] IDENTITY(1,1) NOT NULL,
	[CountryGUID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[TwoCharCode] [nvarchar](2) NULL,
	[ThreeCharCode] [nvarchar](3) NULL,
	[NumCode] [nvarchar](3) NULL,
	[ShipTo] [bit] NOT NULL,
	[Published] [tinyint] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_lc_Country] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lc_ColorTable]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lc_ColorTable](
	[ColorID] [int] IDENTITY(1,1) NOT NULL,
	[Color] [nvarchar](50) NULL,
 CONSTRAINT [PK_ColorTable] PRIMARY KEY CLUSTERED 
(
	[ColorID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lc_Product]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lc_Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Description] [varchar](5000) NOT NULL,
	[Price] [money] NOT NULL,
	[Image1FileName] [nvarchar](100) NULL,
	[Image2FileName] [nvarchar](100) NULL,
	[OnCatalogPromotion] [bit] NOT NULL,
	[OnDepartmentPromotion] [bit] NOT NULL,
	[Sizeable] [bit] NOT NULL,
	[Colorable] [bit] NOT NULL,
	[DateAdded] [smalldatetime] NOT NULL,
	[TotalRemaining] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[lc_Orders]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lc_Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateShipped] [smalldatetime] NULL,
	[Verified] [bit] NOT NULL,
	[Completed] [bit] NOT NULL,
	[Canceled] [bit] NOT NULL,
	[Comments] [varchar](1000) NULL,
	[CustomerName] [varchar](50) NULL,
	[CustomerEmail] [varchar](50) NULL,
	[ShippingAddress] [varchar](500) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[ShoppingCartRemoveItem]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ShoppingCartRemoveItem]
(@CartID char(36),
 @ProductID INT)
AS
DELETE FROM ShoppingCart
WHERE CartID = @CartID and ProductID = @ProductID
GO
/****** Object:  StoredProcedure [dbo].[ShoppingCartDeleteOldCarts]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ShoppingCartDeleteOldCarts]
(@Days smallINT)
AS
DELETE FROM ShoppingCart
WHERE CartID IN
  (SELECT CartID
   FROM ShoppingCart
   GROUP BY CartID
   HAVING MIN(DATEDIFF(dd,DateAdded,GETDATE())) >= @Days)
GO
/****** Object:  StoredProcedure [dbo].[ShoppingCartCountOldCarts]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ShoppingCartCountOldCarts]
(@Days smallINT)
AS
SELECT COUNT(CartID) as Number
FROM ShoppingCart
WHERE CartID IN
  (SELECT CartID
   FROM ShoppingCart
   GROUP BY CartID
   HAVING MIN(DATEDIFF(dd,DateAdded,GETDATE())) >= @Days)
GO
/****** Object:  StoredProcedure [dbo].[GetRowsinShoppingCart]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetRowsinShoppingCart]

	(@CartID char(36))
	
AS
	Select * 
	From ShoppingCart
	where CartID = @CartID
GO
/****** Object:  StoredProcedure [dbo].[AverageProductPoints]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[AverageProductPoints] 
(@ProductID int, @AveragePoints decimal(18,5) OUTPUT, @TotalProductRecords int OUTPUT)

as
Select ProductID, AVG(Points) as AveragePoints
From Recommendation
where ProductID = @ProductID AND Approved = 'True'
Group By ProductID

Select @AveragePoints = AVG(Points) 
from Recommendation Where ProductID = @ProductID AND Approved = 'True'
Group By ProductID

Select @TotalProductRecords = Count(*) from Recommendation
where ProductID = @ProductID AND Approved = 'True'
GO
/****** Object:  StoredProcedure [dbo].[RemoveProductFromCategory]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RemoveProductFromCategory]
(@ProductID INT, @CategoryID INT)
AS
DELETE FROM ProductCategory
WHERE CategoryID = @CategoryID AND ProductID = @ProductID
GO
/****** Object:  StoredProcedure [dbo].[GetCategoriesWithProduct]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[GetCategoriesWithProduct]
(@ProductID int)
as SELECT     Category.CategoryID, Category.Name
FROM         ProductCategory INNER JOIN
                      Category ON ProductCategory.CategoryID = Category.CategoryID
WHERE     (ProductCategory.ProductID = @ProductID)
GO
/****** Object:  StoredProcedure [dbo].[GetCategoriesWithoutProduct]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[GetCategoriesWithoutProduct]
(@ProductID int)
as
select CategoryID, Name
From Category
Where CategoryID Not In
(Select Category.CategoryID
From Category Inner Join ProductCategory
On Category.CategoryID = ProductCategory.CategoryID
Where ProductCategory.CategoryID = @ProductID)
GO
/****** Object:  StoredProcedure [dbo].[AssignProductToCategory]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AssignProductToCategory]
(@ProductID INT, @CategoryID INT)
AS
INSERT INTO ProductCategory (ProductID, CategoryID)
VALUES (@ProductID, @CategoryID)
GO
/****** Object:  StoredProcedure [dbo].[UpdateProduct]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateProduct]
(@ProductID INT,
 @ProductName VARCHAR(50),
 @ProductDescription VARCHAR(5000),
 @ProductPrice MONEY,
 @Image1FileName VARCHAR(50),
 @Image2FileName VARCHAR(50),
 @OnDepartmentPromotion BIT,
 @OnCatalogPromotion BIT)
AS
UPDATE Product
SET Name = @ProductName,
    Description = @ProductDescription,
    Price = @ProductPrice,
    Image1FileName = @Image1FileName,
    Image2FileName = @Image2FileName,
    OnDepartmentPromotion = @OnDepartmentPromotion,
    OnCatalogPromotion = @OnCatalogPromotion
WHERE ProductID = @ProductID
GO
/****** Object:  StoredProcedure [dbo].[ShoppingCartGetTotalAmount]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ShoppingCartGetTotalAmount]
(@CartID char(36))
AS
SELECT ISNULL(SUM(Product.Price * ShoppingCart.Quantity), 0) as Price
FROM ShoppingCart INNER JOIN Product
ON ShoppingCart.ProductID = Product.ProductID
WHERE ShoppingCart.CartID = @CartID
GO
/****** Object:  StoredProcedure [dbo].[ShoppingCartGetItems]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ShoppingCartGetItems]
(@CartID char(36))
AS
SELECT Product.ProductID, Product.Name, Product.Price, Product.Image1FileName, Product.Image2FileName, Product.OnCatalogPromotion, Product.OnDepartmentPromotion, 
ShoppingCart.Quantity, 
       Product.Price * ShoppingCart.Quantity AS Subtotal, ShoppingCart.CartID, ShoppingCart.ProductID, ShoppingCart.Quantity, ShoppingCart.DateAdded
FROM ShoppingCart INNER JOIN Product
ON ShoppingCart.ProductID = Product.ProductID
WHERE ShoppingCart.CartID = @CartID
GO
/****** Object:  StoredProcedure [dbo].[ShoppingCartAddItem]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ShoppingCartAddItem]
(@CartID char(36),
 @ProductID INT)
AS
IF EXISTS 
        (SELECT CartID 
         FROM ShoppingCart 
         WHERE ProductID = @ProductID AND CartID = @CartID)
    UPDATE ShoppingCart
    SET Quantity = Quantity + 1
    WHERE ProductID = @ProductID AND CartID = @CartID
ELSE
    IF EXISTS (SELECT Name FROM Product WHERE ProductID=@ProductID)
        INSERT INTO ShoppingCart (CartID, ProductID, Quantity, DateAdded)
        VALUES (@CartID, @ProductID, 1, GETDATE())
GO
/****** Object:  StoredProcedure [dbo].[SearchAllProducts]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SearchAllProducts]	
	(
	@ProductName varchar
	)
	
AS
	SELECT        ProductID, Name
	FROM            Product
	WHERE        Name Like '@ProductName'
GO
/****** Object:  StoredProcedure [dbo].[GetProductsOnDepartmentPromotion]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetProductsOnDepartmentPromotion]
(@DepartmentID INT,
@DescriptionLength INT,
@PageNumber INT,
@ProductsPerPage INT,
@HowManyProducts INT OUTPUT)
AS

-- declare a new TABLE variable
DECLARE @Products TABLE
(RowNumber INT,
 ProductID INT,
 Name VARCHAR(50),
 Description VARCHAR(5000),
 Price MONEY,
 Image1FileName VARCHAR(50),
 Image2FileName VARCHAR(50),
 OnDepartmentPromotion BIT,
 OnCatalogPromotion BIT)

-- populate the table variable with the complete list of products
INSERT INTO @Products    
SELECT ROW_NUMBER() OVER (ORDER BY ProductID) AS Row, 
       ProductID, Name, SUBSTRING(Description, 1, @DescriptionLength) + '...' AS Description,
       Price, Image1FileName, Image2FileName, OnDepartmentPromotion, OnCatalogPromotion
FROM 
(SELECT DISTINCT Product.ProductID, Product.Name, 
  SUBSTRING(Product.Description, 1, @DescriptionLength) + '...' AS Description,
  Price, Image1FileName, Image2FileName, OnDepartmentPromotion, OnCatalogPromotion
  FROM Product INNER JOIN ProductCategory
                      ON Product.ProductID = ProductCategory.ProductID
              INNER JOIN Category
                      ON ProductCategory.CategoryID = Category.CategoryID
  WHERE Product.OnDepartmentPromotion = 1 
   AND Category.DepartmentID = @DepartmentID
) AS ProductOnDepPr

-- return the total number of products using an OUTPUT variable
SELECT @HowManyProducts = COUNT(ProductID) FROM @Products

-- extract the requested page of products
SELECT ProductID, Name, Description, Price, Image1FileName,
       Image2FileName, OnDepartmentPromotion, OnCatalogPromotion
FROM @Products
WHERE RowNumber > (@PageNumber - 1) * @ProductsPerPage
  AND RowNumber <= @PageNumber * @ProductsPerPage
GO
/****** Object:  StoredProcedure [dbo].[GetProductsOnCatalogPromotion]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetProductsOnCatalogPromotion]
(@DescriptionLength INT,
@PageNumber INT,
@ProductsPerPage INT,
@HowManyProducts INT OUTPUT)
AS

-- declare a new TABLE variable
DECLARE @Products TABLE
(RowNumber INT,
 ProductID INT,
 Name VARCHAR(50),
 Description VARCHAR(5000),
 Price MONEY,
 Image1FileName VARCHAR(50),
 Image2FileName VARCHAR(50),
 OnDepartmentPromotion BIT,
 OnCatalogPromotion BIT)

-- populate the table variable with the complete list of products
INSERT INTO @Products
SELECT ROW_NUMBER() OVER (ORDER BY Product.ProductID),
       ProductID, Name, 
       SUBSTRING(Description, 1, @DescriptionLength) + '...' AS Description,
       Price, Image1FileName, Image2FileName, OnDepartmentPromotion, OnCatalogPromotion
FROM Product
WHERE OnCatalogPromotion = 1

-- return the total number of products using an OUTPUT variable
SELECT @HowManyProducts = COUNT(ProductID) FROM @Products

-- extract the requested page of products
SELECT ProductID, Name, Description, Price, Image1FileName,
       Image2FileName, OnDepartmentPromotion, OnCatalogPromotion
FROM @Products
WHERE RowNumber > (@PageNumber - 1) * @ProductsPerPage
  AND RowNumber <= @PageNumber * @ProductsPerPage
GO
/****** Object:  StoredProcedure [dbo].[GetProductsInCategory]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetProductsInCategory]
(@CategoryID INT,
@DescriptionLength INT,
@PageNumber INT,
@ProductsPerPage INT,
@HowManyProducts INT OUTPUT)
AS

-- declare a new TABLE variable
DECLARE @Products TABLE
(RowNumber INT,
 ProductID INT,
 Name VARCHAR(50),
 Description VARCHAR(5000),
 Price MONEY,
 Image1FileName VARCHAR(50),
 Image2FileName VARCHAR(50),
 OnDepartmentPromotion BIT,
 OnCatalogPromotion BIT)

-- populate the table variable with the complete list of products
INSERT INTO @Products
SELECT ROW_NUMBER() OVER (ORDER BY Product.ProductID),
       Product.ProductID, Name, 
       SUBSTRING(Description, 1, @DescriptionLength) + '...' AS Description,
       Price, Image1FileName, Image2FileName, OnDepartmentPromotion, OnCatalogPromotion
FROM Product INNER JOIN ProductCategory
  ON Product.ProductID = ProductCategory.ProductID
WHERE ProductCategory.CategoryID = @CategoryID

-- return the total number of products using an OUTPUT variable
SELECT @HowManyProducts = COUNT(ProductID) FROM @Products

-- extract the requested page of products
SELECT ProductID, Name, Description, Price, Image1FileName,
       Image2FileName, OnDepartmentPromotion, OnCatalogPromotion
FROM @Products
WHERE RowNumber > (@PageNumber - 1) * @ProductsPerPage
  AND RowNumber <= @PageNumber * @ProductsPerPage
GO
/****** Object:  StoredProcedure [dbo].[GetProducts]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetProducts]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
AS
	Select * From Product
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[GetProductDetails]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetProductDetails]
(@ProductID int)

AS
	
	Select ProductID, Name, Description, Price, Image1FileName, Image2FileName, OnCatalogPromotion, OnDepartmentPromotion
	From Product
	Where ProductID = @ProductID
	
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[DeleteProduct]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteProduct]
(@ProductID INT)
AS
DELETE FROM ShoppingCart WHERE ProductID=@ProductID
DELETE FROM ProductCategory WHERE ProductID=@ProductID
DELETE FROM Product where ProductID=@ProductID
GO
/****** Object:  StoredProcedure [dbo].[CreateProduct]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateProduct]
(@CategoryID INT,
 @ProductName VARCHAR(50),
 @ProductDescription VARCHAR(1000),
 @ProductPrice MONEY,
 @Image1FileName VARCHAR(50),
 @Image2FileName VARCHAR(50),
 @OnDepartmentPromotion BIT,
 @OnCatalogPromotion BIT)
AS
-- Declare a variable to hold the generated product ID
DECLARE @ProductID INT
-- Create the new product entry
INSERT INTO Product 
    (Name, 
     Description, 
     Price, 
     Image1FileName, 
     Image2FileName,
     OnDepartmentPromotion, 
     OnCatalogPromotion )
VALUES 
    (@ProductName, 
     @ProductDescription, 
     @ProductPrice, 
     @Image1FileName, 
     @Image2FileName,
     @OnDepartmentPromotion, 
     @OnCatalogPromotion)
-- Save the generated product ID to a variable
SELECT @ProductID = @@Identity
-- Associate the product with a category
INSERT INTO ProductCategory (ProductID, CategoryID)
VALUES (@ProductID, @CategoryID)
GO
/****** Object:  StoredProcedure [dbo].[PopulateSearchBox]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PopulateSearchBox]
	@SearchWords nvarchar(50)
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
AS
	SELECT        Name
	FROM            Product
	WHERE        (Name = '@SearchWords')
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[OrderUpdate]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OrderUpdate]
(@OrderID INT,
 @DateCreated SMALLDATETIME,
 @DateShipped SMALLDATETIME = NULL,
 @Verified BIT,
 @Completed BIT,
 @Canceled BIT,
 @Comments VARCHAR(200),
 @CustomerName VARCHAR(50),
 @ShippingAddress VARCHAR(200),
 @CustomerEmail VARCHAR(50))
AS
UPDATE Orders
SET DateCreated=@DateCreated,
    DateShipped=@DateShipped,
    Verified=@Verified,
    Completed=@Completed,
    Canceled=@Canceled,
    Comments=@Comments,
    CustomerName=@CustomerName,
    ShippingAddress=@ShippingAddress,
    CustomerEmail=@CustomerEmail
WHERE OrderID = @OrderID
GO
/****** Object:  StoredProcedure [dbo].[OrdersGetVerifiedUncompleted]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OrdersGetVerifiedUncompleted]
AS
SELECT OrderID, DateCreated, DateShipped, 
       Verified, Completed, Canceled, CustomerName
FROM Orders
WHERE Verified=1 AND Completed=0
ORDER BY DateCreated DESC
GO
/****** Object:  StoredProcedure [dbo].[OrdersGetUnverifiedUncanceled]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OrdersGetUnverifiedUncanceled]
AS
SELECT OrderID, DateCreated, DateShipped, 
       Verified, Completed, Canceled, CustomerName
FROM Orders
WHERE Verified=0 AND Canceled=0
ORDER BY DateCreated DESC
GO
/****** Object:  StoredProcedure [dbo].[OrdersGetByRecent]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OrdersGetByRecent] 
(@Count smallINT)
AS
-- Set the number of rows to be returned
SET ROWCOUNT @Count
-- Get list of orders
SELECT OrderID, DateCreated, DateShipped, 
       Verified, Completed, Canceled, CustomerName
FROM Orders
ORDER BY DateCreated DESC
-- Reset rowcount value
SET ROWCOUNT 0
GO
/****** Object:  StoredProcedure [dbo].[OrdersGetByDate]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OrdersGetByDate] 
(@StartDate SMALLDATETIME,
 @EndDate SMALLDATETIME)
AS
SELECT OrderID, DateCreated, DateShipped, 
       Verified, Completed, Canceled, CustomerName
FROM Orders
WHERE DateCreated BETWEEN @StartDate AND @EndDate
ORDER BY DateCreated DESC
GO
/****** Object:  StoredProcedure [dbo].[OrderMarkVerified]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OrderMarkVerified]
(@OrderID INT)
AS
UPDATE Orders
SET Verified = 1
WHERE OrderID = @OrderID
GO
/****** Object:  StoredProcedure [dbo].[OrderMarkCompleted]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OrderMarkCompleted]
(@OrderID INT)
AS
UPDATE Orders
SET Completed = 1,
    DateShipped = GETDATE()
WHERE OrderID = @OrderID
GO
/****** Object:  StoredProcedure [dbo].[OrderMarkCanceled]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OrderMarkCanceled]
(@OrderID INT)
AS
UPDATE Orders
SET Canceled = 1
WHERE OrderID = @OrderID
GO
/****** Object:  StoredProcedure [dbo].[OrderGetInfo]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OrderGetInfo]
(@OrderID INT)
AS
SELECT OrderID, 
      (SELECT ISNULL(SUM(Subtotal), 0) FROM OrderDetail WHERE OrderID = @OrderID)        
       AS TotalAmount, 
       DateCreated, 
       DateShipped, 
       Verified, 
       Completed, 
       Canceled, 
       Comments, 
       CustomerName, 
       ShippingAddress, 
       CustomerEmail
FROM Orders
WHERE OrderID = @OrderID
GO
/****** Object:  StoredProcedure [dbo].[OrderGetDetails]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OrderGetDetails]
(@OrderID INT)
AS
SELECT Orders.OrderID, 
       ProductID, 
       ProductName, 
       Quantity, 
       UnitCost, 
       Subtotal
FROM OrderDetail JOIN Orders
ON Orders.OrderID = OrderDetail.OrderID
WHERE Orders.OrderID = @OrderID
GO
/****** Object:  StoredProcedure [dbo].[GetShoppingCartRecommendations2]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetShoppingCartRecommendations2]
(@CartID CHAR(36),
 @DescriptionLength INT)
AS
--- Returns the product recommendations
SELECT ProductID,
       Name,
       SUBSTRING(Description, 1, @DescriptionLength) + '...' AS Description
FROM Product
WHERE ProductID IN
   (
   -- Returns the products that exist in a list of orders
   SELECT TOP 5 ProductID
   FROM OrderDetail
   WHERE OrderID IN
      (
      -- Returns the orders that contain certain products
      SELECT DISTINCT OrderID 
      FROM OrderDetail 
      WHERE ProductID IN
         (
         -- Returns the products in the specified shopping cart
         SELECT ProductID 
         FROM ShoppingCart
         WHERE CartID = @CartID
         )
      )
   -- Must not include products that already exist in the visitor''s cart
   AND ProductID NOT IN
      (
      -- Returns the products in the specified shopping cart
      SELECT ProductID 
      FROM ShoppingCart
      WHERE CartID = @CartID
      )
   -- Group the ProductID so we can calculate the rank
   GROUP BY ProductID
   -- Order descending by rank
   ORDER BY COUNT(ProductID) DESC
   )
GO
/****** Object:  StoredProcedure [dbo].[GetShoppingCartRecommendations]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetShoppingCartRecommendations]
(@CartID CHAR(36),
 @DescriptionLength INT)
AS
--- Returns the product recommendations
SELECT ProductID,
       Name,
       SUBSTRING(Description, 1, @DescriptionLength) + '...' AS Description
FROM Product
WHERE ProductID IN
   (
   -- Returns the products that exist in a list of orders
   SELECT TOP 5 od1.ProductID AS Rank
   FROM OrderDetail od1 
     JOIN OrderDetail od2
       ON od1.OrderID=od2.OrderID
     JOIN ShoppingCart sp
       ON od2.ProductID = sp.ProductID
   WHERE sp.CartID = @CartID
        -- Must not include products that already exist in the visitor''s cart
      AND od1.ProductID NOT IN
      (
      -- Returns the products in the specified shopping cart
      SELECT ProductID 
      FROM ShoppingCart
      WHERE CartID = @CartID
      )
   -- Group the ProductID so we can calculate the rank
   GROUP BY od1.ProductID
   -- Order descending by rank
   ORDER BY COUNT(od1.ProductID) DESC
   )
GO
/****** Object:  StoredProcedure [dbo].[GetProductInventory]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetProductInventory]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
AS
	SELECT     ProductID, ProductName, Sum(Quantity) as Total_Remaining, Color, Size
FROM
                      OrderDetail
GROUP BY ProductID, ProductName, Color, Size
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[GetProductAvailable]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetProductAvailable]
	
	(
	@ProductID int,
	@Size nvarchar(50),
	@Color nvarchar(50)
	)
	
AS
		SELECT        ProductID, ProductName, 
		SUM(Quantity) AS Total_Remaining, Size, Color 
FROM            OrderDetail 
where ProductID = @ProductID and Size = @Size and Color = @Color
GROUP BY ProductID, ProductName, Size, Color
HAVING        (SUM(Quantity) > -1)
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[GetAllProductsAvailable]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllProductsAvailable]
	(
	@ProductID int
	)
	
AS
		SELECT        ProductID, ProductName, 
		SUM(Quantity) AS Total_Remaining, Size, Color 
FROM            OrderDetail 
where ProductID = @ProductID
GROUP BY ProductID, ProductName, Quantity, Size, Color

	RETURN
GO
/****** Object:  StoredProcedure [dbo].[CreateOrder]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateOrder] 
(@CartID char(36))
AS
/* Insert a new record INTo Orders */
DECLARE @OrderID INT
INSERT INTO Orders DEFAULT VALUES
/* Save the new Order ID */
SET @OrderID = @@IDENTITY
/* Add the order details to OrderDetail */
INSERT INTO OrderDetail 
     (OrderID, ProductID, ProductName, Quantity, UnitCost, Size, Color)
SELECT 
     @OrderID, Product.ProductID, Product.Name, 
     ShoppingCart.Quantity, Product.Price, ShoppingCart.Size, ShoppingCart.Color
FROM Product JOIN ShoppingCart
ON Product.ProductID = ShoppingCart.ProductID
WHERE ShoppingCart.CartID = @CartID
/* Clear the shopping cart */
DELETE FROM ShoppingCart
WHERE CartID = @CartID
/* Return the Order ID */
SELECT @OrderID
GO
/****** Object:  StoredProcedure [dbo].[NewGetProductDetails]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[NewGetProductDetails]
(@ProductID int)
As

SELECT     Name, Description, Price, Image1FileName, Image2FileName, OnCatalogPromotion, OnDepartmentPromotion
FROM         Product
WHERE     (ProductID = @ProductID)
GO
/****** Object:  StoredProcedure [dbo].[MoveProductToCategory]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[MoveProductToCategory]
(@ProductID int, @OldCategoryID int, @NewCategoryID int)
As 
Update ProductCategory
Set CategoryID = @NewCategoryID
Where CategoryID = @OldCategoryID
And ProductID = @ProductID
GO
/****** Object:  Table [dbo].[lc_WishList]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lc_WishList](
	[WishListID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[ProductID] [int] NOT NULL,
	[DateAdded] [smalldatetime] NOT NULL,
	[SizeID] [int] NOT NULL,
	[ColorID] [int] NOT NULL,
 CONSTRAINT [PK_WishList] PRIMARY KEY CLUSTERED 
(
	[WishListID] ASC,
	[SizeID] ASC,
	[ColorID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[SearchCatalog]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SearchCatalog] 
(@DescriptionLength INT,
 @PageNumber TINYINT,
 @ProductsPerPage TINYINT,
 @HowManyResults SMALLINT OUTPUT,
 @AllWords BIT,
 @Word1 VARCHAR(15) = NULL,
 @Word2 VARCHAR(15) = NULL,
 @Word3 VARCHAR(15) = NULL,
 @Word4 VARCHAR(15) = NULL,
 @Word5 VARCHAR(15) = NULL)
AS

/* Create the table variable that will contain the search results */
DECLARE @Products TABLE
(RowNumber SMALLINT IDENTITY (1,1) NOT NULL,
 ProductID INT,
 Name VARCHAR(50),
 Description VARCHAR(1000),
 Price MONEY,
 Image1FileName VARCHAR(50),
 Image2FileName VARCHAR(50),
 Rank INT)

/* Populate @Products for an any-words search */
IF @AllWords = 0 
   INSERT INTO @Products           
   SELECT ProductID, Name, 
          SUBSTRING(Description, 1, @DescriptionLength) + '...' AS Description, 
          Price, Image1FileName, Image2FileName,
          3 * dbo.WordCount(@Word1, Name) + dbo.WordCount(@Word1, Description) +
          3 * dbo.WordCount(@Word2, Name) + dbo.WordCount(@Word2, Description) +
          3 * dbo.WordCount(@Word3, Name) + dbo.WordCount(@Word3, Description) +
          3 * dbo.WordCount(@Word4, Name) + dbo.WordCount(@Word4, Description) +
          3 * dbo.WordCount(@Word5, Name) + dbo.WordCount(@Word5, Description) 
          AS Rank
   FROM Product
   ORDER BY Rank DESC
   
/* Populate @Products for an all-words search */
IF @AllWords = 1 
   INSERT INTO @Products           
   SELECT ProductID, Name, 
          SUBSTRING(Description, 1, @DescriptionLength) + '...' AS Description, 
          Price, Image1FileName, Image2FileName,
          (3 * dbo.WordCount(@Word1, Name) + dbo.WordCount(@Word1, Description)) *
          CASE 
            WHEN @Word2 IS NULL THEN 1 
            ELSE 3 * dbo.WordCount(@Word2, Name) + dbo.WordCount(@Word2, Description)
          END *
          CASE 
            WHEN @Word3 IS NULL THEN 1 
            ELSE 3 * dbo.WordCount(@Word3, Name) + dbo.WordCount(@Word3, Description)
          END *
          CASE 
            WHEN @Word4 IS NULL THEN 1 
            ELSE 3 * dbo.WordCount(@Word4, Name) + dbo.WordCount(@Word4, Description)
          END *
          CASE 
            WHEN @Word5 IS NULL THEN 1 
            ELSE 3 * dbo.WordCount(@Word5, Name) + dbo.WordCount(@Word5, Description)
          END
          AS Rank
   FROM Product
   ORDER BY Rank DESC

/* Save the number of searched products in an output variable */
SELECT @HowManyResults = COUNT(*) 
FROM @Products 
WHERE Rank > 0

/* Send back the requested products */
SELECT ProductID, Name, Description, Price, Image1FileName, Image2FileName, Rank
FROM @Products
WHERE Rank > 0
  AND RowNumber BETWEEN (@PageNumber-1) * @ProductsPerPage + 1 
                    AND @PageNumber * @ProductsPerPage
ORDER BY Rank DESC
GO
/****** Object:  Table [dbo].[lc_OrderDetail]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lc_OrderDetail](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[ProductName] [varchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitCost] [money] NOT NULL,
	[Subtotal]  AS ([Quantity]*[UnitCost]),
	[Size] [nvarchar](50) NULL,
	[Color] [nvarchar](50) NULL,
	[CouponCode] [nvarchar](50) NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[SellerID] [int] NULL,
	[Tax] [float] NULL,
	[Region] [nvarchar](50) NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[lc_DigitalProduct]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lc_DigitalProduct](
	[DigitalProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[URL] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_lc_DigitalProduct] PRIMARY KEY CLUSTERED 
(
	[DigitalProductID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lc_Category]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lc_Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentID] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[Description] [varchar](1000) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[lc_BillingInfoTable]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lc_BillingInfoTable](
	[OrderID] [int] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](50) NULL,
	[NickName] [nvarchar](50) NULL,
	[Prefix] [char](6) NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Address2] [nvarchar](50) NULL,
	[City] [nvarchar](50) NOT NULL,
	[State] [char](2) NULL,
	[Zip] [nchar](15) NULL,
	[Phone] [nvarchar](30) NULL,
	[Fax] [nvarchar](30) NULL,
	[Country] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_BillingInfoTable] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[lc_ShippingInfoTable]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lc_ShippingInfoTable](
	[OrderID] [int] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](50) NULL,
	[NickName] [nvarchar](50) NULL,
	[Prefix] [char](6) NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Address2] [nvarchar](50) NULL,
	[City] [nvarchar](50) NOT NULL,
	[State] [char](2) NULL,
	[Zip] [nchar](15) NULL,
	[Phone] [nvarchar](30) NULL,
	[Fax] [nvarchar](30) NULL,
	[Country] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ShippingInfoTable] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[ShoppingCartUpdateItem]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[ShoppingCartUpdateItem]
(@CartID char(36),
 @ProductID INT,
 @Quantity INT)
As
IF @Quantity <= 0 
  EXEC ShoppingCartRemoveItem @CartID, @ProductID
ELSE
  UPDATE ShoppingCart
  SET Quantity = @Quantity, DateAdded = GETDATE()
  WHERE ProductID = @ProductID AND CartID = @CartID
  
  select * from product
  select * from ShoppingCart
GO
/****** Object:  Table [dbo].[lc_ShoppingCart]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lc_ShoppingCart](
	[CartID] [char](36) NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[DateAdded] [smalldatetime] NOT NULL,
	[Size] [nvarchar](50) NOT NULL,
	[Color] [nvarchar](50) NOT NULL,
	[Price] [money] NOT NULL,
 CONSTRAINT [PK_lc_ShoppingCart] PRIMARY KEY CLUSTERED 
(
	[CartID] ASC,
	[ProductID] ASC,
	[Size] ASC,
	[Color] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[lc_ProductInventory]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lc_ProductInventory](
	[ProductInventoryID] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Size] [nvarchar](50) NOT NULL,
	[Color] [nvarchar](50) NOT NULL,
	[SellerID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
 CONSTRAINT [PK_ProductInventory1] PRIMARY KEY CLUSTERED 
(
	[ProductInventoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lc_ProductImage]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lc_ProductImage](
	[ProductImageID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[ImageName] [nvarchar](50) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Description] [nvarchar](100) NULL,
 CONSTRAINT [PK_ProductImage] PRIMARY KEY CLUSTERED 
(
	[ProductImageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lc_ProductCategory]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lc_ProductCategory](
	[ProductID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[CategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[GetProductRecommendations]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GetProductRecommendations

CREATE PROCEDURE [dbo].[GetProductRecommendations]
(@ProductID INT,
 @DescriptionLength INT)
AS
SELECT ProductID, 
       Name, 
       Image1FileName,
       Price,
       SUBSTRING(Description, 1, @DescriptionLength) + '...' AS Description
FROM lc_Product
WHERE ProductID IN
    (
    SELECT TOP 5 od2.ProductID
    FROM lc_OrderDetail od1
    JOIN lc_OrderDetail od2 ON od1.OrderID = od2.OrderID
    WHERE od1.ProductID = @ProductID AND od2.ProductID != @ProductID
    GROUP BY od2.ProductID
    ORDER BY COUNT(od2.ProductID) DESC
    )
GO
/****** Object:  StoredProcedure [dbo].[GetAllProductsInCategory]    Script Date: 09/22/2014 00:22:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GetAllProductsInCategory
Create Procedure [dbo].[GetAllProductsInCategory]
(@CategoryID int)
as
SELECT     Product.ProductID, Product.Name, Product.Description, Product.Price, Product.Image1FileName, Product.Image2FileName, Product.OnCatalogPromotion, 
                      Product.OnDepartmentPromotion
FROM         lc_Product as Product INNER JOIN
                      lc_ProductCategory as ProductCategory ON Product.ProductID = ProductCategory.ProductID
WHERE     (ProductCategory.CategoryID = @CategoryID)
GO
/****** Object:  Default [DF_Recommendation_DateInserted]    Script Date: 09/22/2014 00:22:39 ******/
ALTER TABLE [dbo].[lc_Recommendation] ADD  CONSTRAINT [DF_Recommendation_DateInserted]  DEFAULT (getdate()) FOR [DateInserted]
GO
/****** Object:  Default [DF_lc_State_Published]    Script Date: 09/22/2014 00:22:39 ******/
ALTER TABLE [dbo].[lc_State] ADD  CONSTRAINT [DF_lc_State_Published]  DEFAULT ((1)) FOR [Published]
GO
/****** Object:  Default [DF_lc_State_DisplayOrder]    Script Date: 09/22/2014 00:22:39 ******/
ALTER TABLE [dbo].[lc_State] ADD  CONSTRAINT [DF_lc_State_DisplayOrder]  DEFAULT ((1)) FOR [DisplayOrder]
GO
/****** Object:  Default [DF_lc_State_CreatedOn]    Script Date: 09/22/2014 00:22:39 ******/
ALTER TABLE [dbo].[lc_State] ADD  CONSTRAINT [DF_lc_State_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  Default [DF_CouponTable_Amount]    Script Date: 09/22/2014 00:22:42 ******/
ALTER TABLE [dbo].[lc_CouponTable] ADD  CONSTRAINT [DF_CouponTable_Amount]  DEFAULT ((0)) FOR [Amount]
GO
/****** Object:  Default [DF_CouponTable_DiscountPercent]    Script Date: 09/22/2014 00:22:42 ******/
ALTER TABLE [dbo].[lc_CouponTable] ADD  CONSTRAINT [DF_CouponTable_DiscountPercent]  DEFAULT ((0)) FOR [DiscountPercent]
GO
/****** Object:  Default [DF_CouponTable_DateMade]    Script Date: 09/22/2014 00:22:42 ******/
ALTER TABLE [dbo].[lc_CouponTable] ADD  CONSTRAINT [DF_CouponTable_DateMade]  DEFAULT (getdate()) FOR [DateMade]
GO
/****** Object:  Default [DF_lc_Country_CountryGUID]    Script Date: 09/22/2014 00:22:42 ******/
ALTER TABLE [dbo].[lc_Country] ADD  CONSTRAINT [DF_lc_Country_CountryGUID]  DEFAULT (newid()) FOR [CountryGUID]
GO
/****** Object:  Default [DF__lc_Countr__ShipT__3EDC53F0]    Script Date: 09/22/2014 00:22:42 ******/
ALTER TABLE [dbo].[lc_Country] ADD  DEFAULT ((1)) FOR [ShipTo]
GO
/****** Object:  Default [DF_lc_Country_Published]    Script Date: 09/22/2014 00:22:42 ******/
ALTER TABLE [dbo].[lc_Country] ADD  CONSTRAINT [DF_lc_Country_Published]  DEFAULT ((1)) FOR [Published]
GO
/****** Object:  Default [DF_lc_Country_DisplayOrder]    Script Date: 09/22/2014 00:22:42 ******/
ALTER TABLE [dbo].[lc_Country] ADD  CONSTRAINT [DF_lc_Country_DisplayOrder]  DEFAULT ((1)) FOR [DisplayOrder]
GO
/****** Object:  Default [DF_lc_Country_CreatedOn]    Script Date: 09/22/2014 00:22:42 ******/
ALTER TABLE [dbo].[lc_Country] ADD  CONSTRAINT [DF_lc_Country_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  Default [DF_Product_DateAdded]    Script Date: 09/22/2014 00:22:42 ******/
ALTER TABLE [dbo].[lc_Product] ADD  CONSTRAINT [DF_Product_DateAdded]  DEFAULT (getdate()) FOR [DateAdded]
GO
/****** Object:  Default [DF_Product_TotalRemaining]    Script Date: 09/22/2014 00:22:42 ******/
ALTER TABLE [dbo].[lc_Product] ADD  CONSTRAINT [DF_Product_TotalRemaining]  DEFAULT ((0)) FOR [TotalRemaining]
GO
/****** Object:  Default [DF_Orders_DateCreated]    Script Date: 09/22/2014 00:22:42 ******/
ALTER TABLE [dbo].[lc_Orders] ADD  CONSTRAINT [DF_Orders_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Orders_Verified]    Script Date: 09/22/2014 00:22:42 ******/
ALTER TABLE [dbo].[lc_Orders] ADD  CONSTRAINT [DF_Orders_Verified]  DEFAULT ((0)) FOR [Verified]
GO
/****** Object:  Default [DF_Orders_Completed]    Script Date: 09/22/2014 00:22:42 ******/
ALTER TABLE [dbo].[lc_Orders] ADD  CONSTRAINT [DF_Orders_Completed]  DEFAULT ((0)) FOR [Completed]
GO
/****** Object:  Default [DF_Orders_Canceled]    Script Date: 09/22/2014 00:22:42 ******/
ALTER TABLE [dbo].[lc_Orders] ADD  CONSTRAINT [DF_Orders_Canceled]  DEFAULT ((0)) FOR [Canceled]
GO
/****** Object:  ForeignKey [FK_CouponTable_CouponTable]    Script Date: 09/22/2014 00:22:42 ******/
ALTER TABLE [dbo].[lc_CouponTable]  WITH CHECK ADD  CONSTRAINT [FK_CouponTable_CouponTable] FOREIGN KEY([CouponID])
REFERENCES [dbo].[lc_CouponTable] ([CouponID])
GO
ALTER TABLE [dbo].[lc_CouponTable] CHECK CONSTRAINT [FK_CouponTable_CouponTable]
GO
/****** Object:  ForeignKey [FK_WishList_Color]    Script Date: 09/22/2014 00:22:42 ******/
ALTER TABLE [dbo].[lc_WishList]  WITH CHECK ADD  CONSTRAINT [FK_WishList_Color] FOREIGN KEY([ColorID])
REFERENCES [dbo].[lc_ColorTable] ([ColorID])
GO
ALTER TABLE [dbo].[lc_WishList] CHECK CONSTRAINT [FK_WishList_Color]
GO
/****** Object:  ForeignKey [FK_WishList_Product]    Script Date: 09/22/2014 00:22:42 ******/
ALTER TABLE [dbo].[lc_WishList]  WITH CHECK ADD  CONSTRAINT [FK_WishList_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[lc_Product] ([ProductID])
GO
ALTER TABLE [dbo].[lc_WishList] CHECK CONSTRAINT [FK_WishList_Product]
GO
/****** Object:  ForeignKey [FK_WishList_Size]    Script Date: 09/22/2014 00:22:42 ******/
ALTER TABLE [dbo].[lc_WishList]  WITH CHECK ADD  CONSTRAINT [FK_WishList_Size] FOREIGN KEY([SizeID])
REFERENCES [dbo].[lc_SizeTable] ([SizeID])
GO
ALTER TABLE [dbo].[lc_WishList] CHECK CONSTRAINT [FK_WishList_Size]
GO
/****** Object:  ForeignKey [FK_OrderDetail_Orders]    Script Date: 09/22/2014 00:22:42 ******/
ALTER TABLE [dbo].[lc_OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[lc_Orders] ([OrderID])
GO
ALTER TABLE [dbo].[lc_OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Orders]
GO
/****** Object:  ForeignKey [FK_lc_DigitalProduct_lc_DigitalProduct]    Script Date: 09/22/2014 00:22:42 ******/
ALTER TABLE [dbo].[lc_DigitalProduct]  WITH CHECK ADD  CONSTRAINT [FK_lc_DigitalProduct_lc_DigitalProduct] FOREIGN KEY([ProductID])
REFERENCES [dbo].[lc_Product] ([ProductID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[lc_DigitalProduct] CHECK CONSTRAINT [FK_lc_DigitalProduct_lc_DigitalProduct]
GO
/****** Object:  ForeignKey [FK_Category_Department]    Script Date: 09/22/2014 00:22:42 ******/
ALTER TABLE [dbo].[lc_Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_Department] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[lc_Department] ([DepartmentID])
GO
ALTER TABLE [dbo].[lc_Category] CHECK CONSTRAINT [FK_Category_Department]
GO
/****** Object:  ForeignKey [FK_BillingInfoTable_Orders]    Script Date: 09/22/2014 00:22:42 ******/
ALTER TABLE [dbo].[lc_BillingInfoTable]  WITH CHECK ADD  CONSTRAINT [FK_BillingInfoTable_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[lc_Orders] ([OrderID])
GO
ALTER TABLE [dbo].[lc_BillingInfoTable] CHECK CONSTRAINT [FK_BillingInfoTable_Orders]
GO
/****** Object:  ForeignKey [FK_ShippingInfoTable_Orders]    Script Date: 09/22/2014 00:22:42 ******/
ALTER TABLE [dbo].[lc_ShippingInfoTable]  WITH CHECK ADD  CONSTRAINT [FK_ShippingInfoTable_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[lc_Orders] ([OrderID])
GO
ALTER TABLE [dbo].[lc_ShippingInfoTable] CHECK CONSTRAINT [FK_ShippingInfoTable_Orders]
GO
/****** Object:  ForeignKey [FK_ShoppingCart_Product]    Script Date: 09/22/2014 00:22:42 ******/
ALTER TABLE [dbo].[lc_ShoppingCart]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCart_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[lc_Product] ([ProductID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[lc_ShoppingCart] CHECK CONSTRAINT [FK_ShoppingCart_Product]
GO
/****** Object:  ForeignKey [FK_ProductInventory_Product]    Script Date: 09/22/2014 00:22:42 ******/
ALTER TABLE [dbo].[lc_ProductInventory]  WITH CHECK ADD  CONSTRAINT [FK_ProductInventory_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[lc_Product] ([ProductID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[lc_ProductInventory] CHECK CONSTRAINT [FK_ProductInventory_Product]
GO
/****** Object:  ForeignKey [FK_ProductImage_Product]    Script Date: 09/22/2014 00:22:42 ******/
ALTER TABLE [dbo].[lc_ProductImage]  WITH CHECK ADD  CONSTRAINT [FK_ProductImage_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[lc_Product] ([ProductID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[lc_ProductImage] CHECK CONSTRAINT [FK_ProductImage_Product]
GO
/****** Object:  ForeignKey [FK_ProductCategory_Category]    Script Date: 09/22/2014 00:22:42 ******/
ALTER TABLE [dbo].[lc_ProductCategory]  WITH CHECK ADD  CONSTRAINT [FK_ProductCategory_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[lc_Category] ([CategoryID])
GO
ALTER TABLE [dbo].[lc_ProductCategory] CHECK CONSTRAINT [FK_ProductCategory_Category]
GO
/****** Object:  ForeignKey [FK_ProductCategory_Product]    Script Date: 09/22/2014 00:22:42 ******/
ALTER TABLE [dbo].[lc_ProductCategory]  WITH CHECK ADD  CONSTRAINT [FK_ProductCategory_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[lc_Product] ([ProductID])
GO
ALTER TABLE [dbo].[lc_ProductCategory] CHECK CONSTRAINT [FK_ProductCategory_Product]
GO
