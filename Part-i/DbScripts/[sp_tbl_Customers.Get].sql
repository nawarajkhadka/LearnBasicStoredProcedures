USE [StoredProceduresDb]
GO

/****** Object:  StoredProcedure [dbo].[sp_tbl_Customers.Get]    Script Date: 7/10/2017 8:08:22 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/*
STORED PROCEDURE 
SIMPLE SELECT STATEMENT WITH SEARCH BY CUSTOMERNAME

RUN THIS QUERY AFTER CREATING STORED PROCEDURE: EXEC dbo.[sp_tbl_Customers.Get] @Name='Joe'

*/


CREATE PROCEDURE /*PROCEDURE NAME*/ [dbo].[sp_tbl_Customers.Get]
(
@Name	NVARCHAR(100)=NULL /*PARAMETER NAME USED WHILE SELECTION*/
)
AS
	/*SQL QUERIES LIE WITHIN BEGIN END SECTION*/
	BEGIN /*QUERY BEGINS*/
			SELECT 
			C.[CustomerName],
			C.[CustomerAddress],
			C.[CustomerAge]
			FROM dbo.[tbl_Customers] C
			WHERE (ISNULL(@Name,'')='' OR C.[CustomerName] LIKE '%'+@Name+'%')
	END	/*QUERY ENDS*/
GO


