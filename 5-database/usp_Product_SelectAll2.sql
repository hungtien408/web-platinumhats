CREATE procedure [dbo].[usp_Product_SelectAll2]
@StartRowIndex int = NULL,
@EndRowIndex int = NULL,
@Keyword nvarchar(1000) = NULL,
@ProductName nvarchar(200) = NULL,
@Description nvarchar(1000) = NULL,
@PriceFrom money = NULL,
@PriceTo money = NULL,
@CategoryID int = NULL,
@ManufacturerID int = NULL,
@OriginID int = NULL,
@Tag nvarchar(200) = NULL,
@InStock bit = NULL,
@IsHot bit = NULL,
@IsNew bit = NULL,
@IsBestSeller bit = NULL,
@IsSaleOff bit = NULL,
@IsShowOnHomePage bit = NULL,
@FromDate datetime = NULL,
@ToDate datetime = NULL,
@Priority bit = NULL,
@IsAvailable bit = NULL,
@SortByPriority bit = NULL,
@ErrorCode int = NULL OUTPUT
as

declare @SelectQuery nvarchar(max)
select @SelectQuery = 'SELECT *
FROM (
	SELECT 
			p.[ProductID],
	p.[ImageName],
	[MetaTittle],
	p.[MetaDescription],
	[ProductName],
	p.[Description],
	p.[Content],
	[Tag],
	p.[MetaTittleEn],
	p.[MetaDescriptionEn],
	[ProductNameEn],
	p.[DescriptionEn],
	p.[ContentEn],
	[TagEn],
	[Price],
	[OtherPrice],
	[SavePrice],
	[Discount],
	[CategoryID],
	p.[ManufacturerID],
	p.[OriginID],
	[InStock],
	[Views],
	[CreateDate],
	[IsHot],
	[IsNew],
	[IsBestSeller],
	[IsSaleOff],
	p.[IsShowOnHomePage],
	p.[IsAvailable],
	[ProductCategoryName],
	[ProductCategoryNameEn],
	[ManufacturerName],
	[ManufacturerNameEn],
	[OriginName],
	[OriginNameEn],
	p.[Priority],
	(select count(1) from ProductOfSame where ProductOfSame.ProductParentID = p.ProductID) NumProductOfSame,
	(select top 1 ProductCategoryName from ProductCategory bc where bc.ProductCategoryID = pc.ParentID) ParentCategoryName,
	cast(Rating1 + 2*Rating2 + 3*Rating3 + 4*Rating4 + 5*Rating5 as float)/(Rating1 + Rating2 + Rating3 + Rating4 + Rating5) Rating
	FROM Product p
	left join ProductCategory pc on pc.ProductCategoryID = p.CategoryID
	left join Manufacturer m on m.ManufacturerID = p.ManufacturerID
	left join Origin o on o.OriginID = p.OriginID
	left join Rating r on r.ProductID = p.ProductID ' +
	--case when @Keyword IS NOT NULL then ' inner join FREETEXTTABLE(Product, *, ''' + @Keyword + ''') st on st.[Key] = p.ProductID ' else '' end +
' where 1=1 '

if @Keyword IS NOT NULL
	--set @SelectQuery = @SelectQuery + ' and (FREETEXT(p.*, ''' + @Keyword + ''') or FREETEXT(pc.*, ''' + @Keyword + ''') or FREETEXT(m.*, ''' + @Keyword + ''') or FREETEXT(o.*, ''' + @Keyword + ''')) '
	set @SelectQuery = @SelectQuery + ' and ProductName like  ''N' + @Keyword + ''''

if @ProductName IS NOT NULL
	set @SelectQuery = @SelectQuery + ' and FREETEXT((ProductName, ProductNameEn), ''' + @ProductName + ''') '

if @Description IS NOT NULL
	set @SelectQuery = @SelectQuery + ' and FREETEXT((Description, DescriptionEn), ''' + @Description + ''') '

if @PriceFrom IS NOT NULL
	set @SelectQuery = @SelectQuery + ' and (Price >= ' + str(@PriceFrom) + ' or SavePrice >= ' + str(@PriceFrom) +') '

if @PriceTo IS NOT NULL
	set @SelectQuery = @SelectQuery + ' and (Price <= ' + str(@PriceTo) + ' or SavePrice <= ' + str(@PriceTo) + ') '

if @CategoryID IS NOT NULL
	set @SelectQuery = @SelectQuery + ' and CategoryID in (select ProductCategoryID from dbo.[ufn_ChildProductCategory_SelectAll](' + str(@CategoryID) + ')) '

if @ManufacturerID IS NOT NULL
	set @SelectQuery = @SelectQuery + ' and p.ManufacturerID = ' + str(@ManufacturerID)

if @OriginID IS NOT NULL
	set @SelectQuery = @SelectQuery + ' and p.OriginID = ' + str(@OriginID)

if @Tag IS NOT NULL
	set @SelectQuery = @SelectQuery + ' and FREETEXT((Tag, TagEn), ''' + @Tag + ''') '

if @InStock IS NOT NULL
	set @SelectQuery = @SelectQuery + ' and InStock = ' + str(@InStock)

if @IsHot IS NOT NULL
	set @SelectQuery = @SelectQuery + ' and IsHot = ' + str(@IsHot)

if @IsNew IS NOT NULL
	set @SelectQuery = @SelectQuery + ' and IsNew = ' + str(@IsNew)

if @IsBestSeller IS NOT NULL
	set @SelectQuery = @SelectQuery + ' and IsBestSeller = ' + str(@IsBestSeller)

if @IsSaleOff IS NOT NULL
	set @SelectQuery = @SelectQuery + ' and IsSaleOff = ' + str(@IsSaleOff)

if @IsShowOnHomePage IS NOT NULL
	set @SelectQuery = @SelectQuery + ' and p.IsShowOnHomePage = ' + str(@IsShowOnHomePage)

if @FromDate IS NOT NULL
	set @SelectQuery = @SelectQuery + ' and convert(varchar(8), CreateDate,112) >= ' + convert(varchar(8), @FromDate, 112)

if @ToDate IS NOT NULL
	set @SelectQuery = @SelectQuery + ' and convert(varchar(8), CreateDate,112) <= ' + convert(varchar(8), @ToDate, 112)

if @Priority IS NOT NULL
	set @SelectQuery = @SelectQuery + ' and ' + case when @Priority = 1 then ' p.Priority is not NULL ' else ' p.Priority is NULL ' end

if @IsAvailable IS NOT NULL
	set @SelectQuery = @SelectQuery + ' and p.IsAvailable = ' + str(@IsAvailable)

set @SelectQuery = @SelectQuery + ' ) foo WHERE 1=1 '

if @StartRowIndex IS NOT NULL
	set @SelectQuery = @SelectQuery + ' and row_number >= ' + str(@StartRowIndex)

if @EndRowIndex IS NOT NULL
	set @SelectQuery = @SelectQuery + ' and row_number <= ' + str(@EndRowIndex)

exec (@SelectQuery)

-- Get the Error Code for the statement just executed.
SELECT @ErrorCode=@@ERROR