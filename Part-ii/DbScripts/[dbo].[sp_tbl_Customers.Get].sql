USE [StoredProceduresDb]
GO
/****** Object:  StoredProcedure [dbo].[sp_tbl_Customers.Get]    Script Date: 7/13/2017 8:29:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
STORED PROCEDURE 
SIMPLE SELECT STATEMENT WITH SEARCH BY CUSTOMERNAME

RUN THIS QUERY AFTER CREATING STORED PROCEDURE: EXEC dbo.[sp_tbl_Customers.Get] @PageNumber=1,@PageSize=20

*/


ALTER PROCEDURE /*PROCEDURE NAME*/ [dbo].[sp_tbl_Customers.Get]
(
@Name	NVARCHAR(100)=NULL /*PARAMETER NAME USED WHILE SELECTION*/,
@PageNumber INT=1,
@PageSize INT=20
)
AS
	/*SQL QUERIES LIE WITHIN BEGIN END SECTION*/
	BEGIN /*QUERY BEGINS*/
			;WITH TMP_TBL AS(
				SELECT 
					ROW_NUMBER() OVER(ORDER BY C.CustomerId) as RowNumber, /*get number of each row*/
					C.[CustomerName],
					C.[CustomerAddress],
					C.[CustomerAge],
					COUNT(c.CustomerId) OVER() AS TotalCount /*get total no of rows*/
				FROM dbo.[tbl_Customers] C
				WHERE (ISNULL(@Name,'')='' OR C.[CustomerName] LIKE '%'+@Name+'%') /*filter is done here*/
				)

	SELECT 
		RowNumber,
		CustomerName,
		CustomerAddress,
		CustomerAge,
		TotalCount
	FROM TMP_TBL
	WHERE (RowNumber>((@PageNumber-1)*@PageSize)) /*SQL QUERY FOR PAGINATION*/
	AND   (RowNumber<=(((@PageNumber-1)*@PageSize)+@PageSize))
			
	END	/*QUERY ENDS*/