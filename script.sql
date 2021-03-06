USE [master]
GO
/******  Object:  Database [MY_DB]    Script Date: 03/08/2016 10:35:07 ******/
CREATE DATABASE [MY_DB]   
 ON  PRIMARY 
( NAME = N'MY_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\MY_DB.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MY_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\MY_DB_log.ldf' , SIZE = 2560KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MY_DB] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MY_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MY_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MY_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MY_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MY_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MY_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [MY_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MY_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MY_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MY_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MY_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MY_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MY_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MY_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MY_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MY_DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MY_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MY_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MY_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MY_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MY_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MY_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MY_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MY_DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MY_DB] SET  MULTI_USER 
GO
ALTER DATABASE [MY_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MY_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MY_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MY_DB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [MY_DB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [MY_DB]
GO
/****** Object:  Table [dbo].[CATEGORY]    Script Date: 03/08/2016 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CATEGORY](
	[CAT_ID] [int] IDENTITY(1,1) NOT NULL,
	[CAT_NAME] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[CAT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CUSTOMER]    Script Date: 03/08/2016 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CUSTOMER](
	[CUST_ID] [int] IDENTITY(1,1) NOT NULL,
	[FIRST_NAME] [varchar](50) NULL,
	[LAST_NAME] [varchar](50) NULL,
	[TEL] [nchar](20) NULL,
	[EMAIL] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CUST_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ORDER]    Script Date: 03/08/2016 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDER](
	[ORD_ID] [int] IDENTITY(1,1) NOT NULL,
	[ORDER_DATE] [datetime] NULL,
	[CUST_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ORD_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ORDER_DETAIL]    Script Date: 03/08/2016 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ORDER_DETAIL](
	[PRO_ID] [int] NOT NULL,
	[ORDER_ID] [int] NOT NULL,
	[QTE] [int] NULL,
	[PRICE] [varchar](50) NULL,
	[TOTAL] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PRODUCT]    Script Date: 03/08/2016 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PRODUCT](
	[PRO_ID] [int] IDENTITY(1,1) NOT NULL,
	[PRO_NAME] [varchar](50) NULL,
	[STOCK_QTE] [int] NULL,
	[PRICE] [varchar](50) NULL,
	[IMAGE] [image] NULL,
	[CAT_ID] [int] NOT NULL,
	[DESCRIPTION] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[PRO_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[USERS]    Script Date: 03/08/2016 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[USERS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[USERNAME] [varchar](20) NOT NULL,
	[PASS] [varchar](20) NOT NULL,
	[TYPE] [varchar](20) NOT NULL,
	[FULL_NAME] [varchar](100) NULL,
	[TEL] [varchar](20) NULL,
	[EMAIL] [varchar](20) NULL,
 CONSTRAINT [PK_USER] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[ORDER]  WITH CHECK ADD  CONSTRAINT [FK_ORDER_CUSTOMER] FOREIGN KEY([CUST_ID])
REFERENCES [dbo].[CUSTOMER] ([CUST_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ORDER] CHECK CONSTRAINT [FK_ORDER_CUSTOMER]
GO
ALTER TABLE [dbo].[ORDER_DETAIL]  WITH CHECK ADD  CONSTRAINT [FK_ORDER_DETAIL_ORDER] FOREIGN KEY([ORDER_ID])
REFERENCES [dbo].[ORDER] ([ORD_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ORDER_DETAIL] CHECK CONSTRAINT [FK_ORDER_DETAIL_ORDER]
GO
ALTER TABLE [dbo].[ORDER_DETAIL]  WITH CHECK ADD  CONSTRAINT [FK_ORDER_DETAIL_PRODUCT] FOREIGN KEY([PRO_ID])
REFERENCES [dbo].[PRODUCT] ([PRO_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ORDER_DETAIL] CHECK CONSTRAINT [FK_ORDER_DETAIL_PRODUCT]
GO
ALTER TABLE [dbo].[PRODUCT]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCT_CATEGORY] FOREIGN KEY([CAT_ID])
REFERENCES [dbo].[CATEGORY] ([CAT_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PRODUCT] CHECK CONSTRAINT [FK_PRODUCT_CATEGORY]
GO
/****** Object:  StoredProcedure [dbo].[spr_categorie_products]    Script Date: 03/08/2016 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spr_categorie_products]
as
select 
CATEGORY.CAT_ID, CATEGORY.CAT_NAME
from 
CATEGORY

GO
/****** Object:  StoredProcedure [dbo].[spr_delete_category]    Script Date: 03/08/2016 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spr_delete_category]
@cid int
as
DELETE FROM CATEGORY WHERE CAT_ID = @cid
GO
/****** Object:  StoredProcedure [dbo].[spr_delete_customer]    Script Date: 03/08/2016 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spr_delete_customer]
@id int
as
DELETE FROM CUSTOMER WHERE CUST_ID = @id
GO
/****** Object:  StoredProcedure [dbo].[spr_delete_Products]    Script Date: 03/08/2016 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spr_delete_Products]
@pid int
as
DELETE FROM PRODUCT WHERE PRO_ID = @pid
GO
/****** Object:  StoredProcedure [dbo].[spr_delete_user]    Script Date: 03/08/2016 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spr_delete_user]
@uid int
as
DELETE FROM USERS WHERE ID = @uid
GO
/****** Object:  StoredProcedure [dbo].[spr_get_all_customer_orders]    Script Date: 03/08/2016 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spr_get_all_customer_orders]
@id int
as
select * from [ORDER] O
where O.CUST_ID = @id
GO
/****** Object:  StoredProcedure [dbo].[spr_get_all_orders]    Script Date: 03/08/2016 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spr_get_all_orders]
as
SELECT o.ORD_ID, c.FIRST_NAME, c.LAST_NAME, o.ORDER_DATE from [ORDER] o, CUSTOMER c
where o.CUST_ID = c.CUST_ID
order by o.ORD_ID desc;



GO
/****** Object:  StoredProcedure [dbo].[spr_get_Categories]    Script Date: 03/08/2016 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spr_get_Categories]
as 
select * from CATEGORY;
GO
/****** Object:  StoredProcedure [dbo].[spr_get_customer_last_order_date]    Script Date: 03/08/2016 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spr_get_customer_last_order_date]
@id int
as
 select 
 top 1 [ORDER].[ORDER_DATE] 
 from [ORDER] 
 where [ORDER].[CUST_ID] = @id
 order by [ORDER].[ORDER_DATE] desc;



GO
/****** Object:  StoredProcedure [dbo].[spr_get_customer_orders_amount]    Script Date: 03/08/2016 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spr_get_customer_orders_amount]
@id int
as
SELECT O.CUST_ID, 
       Count(DISTINCT O.ORD_ID) AS Total_Orders, 
	  SUM (CONVERT(float, CAST(od.TOTAL AS money), 1)) AS Total_Amount 
FROM [ORDER] O
INNER JOIN [ORDER_DETAIL] OD
  ON O.ORD_ID = OD.ORDER_ID
  where O.CUST_ID = @id
GROUP BY O.CUST_ID 




GO
/****** Object:  StoredProcedure [dbo].[spr_get_customer_orders_count]    Script Date: 03/08/2016 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spr_get_customer_orders_count]
@id int
as
SELECT  [CUSTOMER].[CUST_ID],
COUNT(*) AS NUMBER_OF_ORDERS
     FROM  [CUSTOMER], [ORDER]
     WHERE [CUSTOMER].[CUST_ID] = @id
	   AND [ORDER].[CUST_ID] = [CUSTOMER].[CUST_ID]
  GROUP BY [CUSTOMER].[CUST_ID]
  ORDER BY [CUSTOMER].[CUST_ID]

GO
/****** Object:  StoredProcedure [dbo].[spr_get_customers]    Script Date: 03/08/2016 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spr_get_customers]
as
select * from CUSTOMER

GO
/****** Object:  StoredProcedure [dbo].[spr_get_order_details]    Script Date: 03/08/2016 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spr_get_order_details]
@id int
as
select odt.PRO_ID, prd.PRO_NAME, odt.QTE, odt.PRICE, odt.TOTAL
from [ORDER_DETAIL] odt, [PRODUCT] prd
where odt.PRO_ID = prd.PRO_ID
and odt.ORDER_ID = @id;
GO
/****** Object:  StoredProcedure [dbo].[spr_get_order_max_id]    Script Date: 03/08/2016 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spr_get_order_max_id]
as
SELECT MAX(ORD_ID) from [ORDER]



GO
/****** Object:  StoredProcedure [dbo].[spr_get_Product_by_id]    Script Date: 03/08/2016 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spr_get_Product_by_id]
@id int

as

SELECT [PRO_ID]
      ,[PRO_NAME]
      ,[STOCK_QTE]
      ,[PRICE]
      ,[IMAGE]
      ,[DESCRIPTION]
	  ,[CAT_ID]
  FROM [dbo].[PRODUCT]
  where PRO_ID = @id



GO
/****** Object:  StoredProcedure [dbo].[spr_get_Products]    Script Date: 03/08/2016 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spr_get_Products]

as

SELECT [PRO_ID]
      ,[PRO_NAME]
      ,[STOCK_QTE]
      ,[PRICE]
      ,[IMAGE]
      ,[DESCRIPTION]
	  ,[CAT_NAME]
  FROM [dbo].[PRODUCT]
INNER JOIN CATEGORY ON CATEGORY.CAT_ID = PRODUCT.CAT_ID



GO
/****** Object:  StoredProcedure [dbo].[spr_get_total_order_amount]    Script Date: 03/08/2016 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spr_get_total_order_amount]
@id int
as
select SUM (CONVERT(float, CAST(TOTAL AS money), 1)) 
AS Total_Amount  
from ORDER_DETAIL where ORDER_ID = @id;
GO
/****** Object:  StoredProcedure [dbo].[spr_get_users]    Script Date: 03/08/2016 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spr_get_users]
as 
select ID, USERNAME, PASS, FULL_NAME, TEL, EMAIL from USERS
where [USERS].[TYPE] != 'admin';
GO
/****** Object:  StoredProcedure [dbo].[spr_insert_category]    Script Date: 03/08/2016 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spr_insert_category]
@cat_name varchar(max)
as
INSERT INTO CATEGORY
           ([CAT_NAME])
     VALUES
           (@cat_name)
GO
/****** Object:  StoredProcedure [dbo].[spr_insert_customer]    Script Date: 03/08/2016 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spr_insert_customer]
@fname varchar(50),
@lname varchar(50),
@tel nchar(20),
@mail varchar(50)
as

INSERT INTO [dbo].[CUSTOMER]
           ([FIRST_NAME],[LAST_NAME]
           ,[TEL]
           ,[EMAIL]
		   )
     VALUES
           (@fname
           ,@lname
           ,@tel
           ,@mail)

GO
/****** Object:  StoredProcedure [dbo].[spr_insert_order]    Script Date: 03/08/2016 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create  procedure [dbo].[spr_insert_order]
@o_date datetime,
@cus_id int
as

INSERT INTO [dbo].[ORDER]
           ([ORDER_DATE]
           ,[CUST_ID])
     VALUES
           (@o_date,
           @cus_id)


GO
/****** Object:  StoredProcedure [dbo].[spr_insert_order_detail]    Script Date: 03/08/2016 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  procedure [dbo].[spr_insert_order_detail]
@p_id int,
@o_id int,
@qty int,
@price varchar(50),
@total varchar(50)
as

INSERT INTO [dbo].[ORDER_DETAIL]
           ([PRO_ID]
           ,[ORDER_ID]
           ,[QTE]
           ,[PRICE]
           ,[TOTAL])
     VALUES
           (@p_id,
            @o_id,
            @qty,
            @price,
            @total)

update PRODUCT 
   set STOCK_QTE = STOCK_QTE - @qty
 where PRO_ID = @p_id


GO
/****** Object:  StoredProcedure [dbo].[spr_insert_product]    Script Date: 03/08/2016 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spr_insert_product]
@c_id int,
@p_name varchar(50),
@s_qty int,
@price varchar(50),
@desc text,
@img image
as

INSERT INTO [PRODUCT]
           ([PRO_NAME]
           ,[STOCK_QTE]
           ,[PRICE]
           ,[IMAGE]
           ,[CAT_ID]
           ,[DESCRIPTION])
     VALUES
         
           (@p_name,
		    @s_qty,
			@price,
			@img,
		    @c_id,
			@desc)
GO
/****** Object:  StoredProcedure [dbo].[spr_insert_user]    Script Date: 03/08/2016 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spr_insert_user]
@USERNAME varchar(20),
@PASS varchar(20),
@FULL_NAME varchar(100),
@TEL varchar(20),
@EMAIL varchar(20)
as

INSERT INTO [dbo].[USERS]
           ([USERNAME]
           ,[PASS]
           ,[TYPE]
           ,[FULL_NAME]
           ,[TEL]
           ,[EMAIL])
     VALUES
           (@USERNAME,
		    @PASS,
			'user',
			@FULL_NAME,
			@TEL,
			@EMAIL)


GO
/****** Object:  StoredProcedure [dbo].[spr_login]    Script Date: 03/08/2016 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spr_login]
@username varchar(20), @pass varchar(20)
as 
select * from USERS 
where USERNAME = @username and PASS = @pass

GO
/****** Object:  StoredProcedure [dbo].[spr_products_by_category]    Script Date: 03/08/2016 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spr_products_by_category]
@cid int
as
select * from PRODUCT where CAT_ID = @cid


GO
/****** Object:  StoredProcedure [dbo].[spr_search_Products]    Script Date: 03/08/2016 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spr_search_Products]
@val varchar(100)
as
SELECT [PRO_ID]
      ,[PRO_NAME]
      ,[STOCK_QTE]
      ,[PRICE]
      ,[IMAGE]
      ,[DESCRIPTION]
	  ,[CAT_NAME]
  FROM [dbo].[PRODUCT]
INNER JOIN CATEGORY ON CATEGORY.CAT_ID = PRODUCT.CAT_ID
WHERE
concat(
Convert(varchar,[PRO_ID]),
[PRO_NAME],
Convert(varchar,[STOCK_QTE]),
[PRICE],
[DESCRIPTION],
[CAT_NAME]
)LIKE '%'+@val+'%'



GO
/****** Object:  StoredProcedure [dbo].[spr_update_category]    Script Date: 03/08/2016 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spr_update_category]

@c_id int,
@c_name varchar(max)
as
UPDATE [dbo].[CATEGORY]
   SET [CAT_NAME] = @c_name
 WHERE CAT_ID = @c_id
GO
/****** Object:  StoredProcedure [dbo].[spr_update_customer]    Script Date: 03/08/2016 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spr_update_customer]
@id int,
@fname varchar(50),
@lname varchar(50),
@tel nchar(20),
@mail varchar(50)
as

UPDATE [dbo].[CUSTOMER]
   SET [FIRST_NAME] = @fname
      ,[LAST_NAME] = @lname
      ,[TEL] = @tel
      ,[EMAIL] = @mail
 WHERE CUST_ID = @id





GO
/****** Object:  StoredProcedure [dbo].[spr_update_Product]    Script Date: 03/08/2016 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spr_update_Product]
@pid int,
@c_id int,
@p_name varchar(50),
@s_qty int,
@price varchar(50),
@desc varchar(MAX),
@img image
as

UPDATE [dbo].[PRODUCT]
   SET [PRO_NAME] = @p_name
      ,[STOCK_QTE] = @s_qty
      ,[PRICE] = @price
      ,[IMAGE] = @img
      ,[CAT_ID] = @c_id
      ,[DESCRIPTION] = @desc
 WHERE PRO_ID = @pid





GO
/****** Object:  StoredProcedure [dbo].[spr_update_user]    Script Date: 03/08/2016 10:35:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spr_update_user]
@id int,
@USERNAME varchar(20),
@PASS varchar(20),
@FULL_NAME varchar(100),
@TEL varchar(20),
@EMAIL varchar(20)
as

UPDATE [dbo].[USERS]
   SET [USERNAME] = @USERNAME
      ,[PASS] = @PASS
      ,[TYPE] = 'user'
      ,[FULL_NAME] = @FULL_NAME
      ,[TEL] = @TEL
      ,[EMAIL] = @EMAIL
 WHERE ID = @id







GO
USE [master]
GO
ALTER DATABASE [MY_DB] SET  READ_WRITE 
GO
