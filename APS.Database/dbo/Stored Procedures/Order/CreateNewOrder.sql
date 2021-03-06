﻿CREATE PROCEDURE [dbo].[CreateNewOrder]
	@GroupUID INT,
	@ProductNumber INT,
	@LotSize INT,
	@StartDate NVarChar(25),
	@EndDate NVarChar(25),
	@CriticalRatio INT,
	@UserName NVarChar(25),
	@AllowWorkStationGroup INT,
	@RoutingName NVarChar(25)
AS
	Declare @Description NVarChar(25)
	Declare @RID INT

	Select @Description = Description
	From Product
	Where ProductNumber = @ProductNumber And GroupUID = @GroupUID

	Select @RID = RID
	From RoutingList
	Where RoutingName = @RoutingName

	Insert Into [Order] (GroupUID, ProductNumber, Description, RID, RoutingName, LotSize, StartDate, EndDate, CriticalRatio, UserName, AllowWorkStationGroup)
	Values(@GroupUID, @ProductNumber, @Description, @RID, @RoutingName, @LotSize, @StartDate, @EndDate, @CriticalRatio, @UserName, @AllowWorkStationGroup)

	Select * 
	From [Order]
	Where OId = SCOPE_IDENTITY()
Go
