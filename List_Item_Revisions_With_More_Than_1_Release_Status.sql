-- Query to find out the Item Revisions in the database which have more than one release status.

WITH ReleaseInfo_CTE ( ItemRevisionPuid, ReleaseStatusName )
AS (
select itemRevision.puid as Item_Revision_ID, releaseStatus.pName as ReleaseStatus
from infodba.pItemRevision itemRevision
inner join infodba.pItem item on itemRevision.RITEMS_TAGU = item.puid
inner join infodba.pRelease_Status_List releaseStatusList on releaseStatusList.puid = itemRevision.puid
inner join infodba.pReleaseStatus releaseStatus on releaseStatus.puid = releaseStatusList.pValu_0 ),

RevHavingMoreThan_1 ( ItemRevisionPuid )
AS (
select ItemRevisionPuid
from ReleaseInfo_CTE
group by ItemRevisionPuid
having count( ItemRevisionPuid ) > 1 )

select item.pItem_Id as Item, itemRevision.pItem_Revision_Id as ItemRevisionId
from RevHavingMoreThan_1 itemRevisionWithMoreRS
inner join infodba.pItemRevision itemRevision on itemRevision.puid = itemRevisionWithMoreRS.ItemRevisionPuid
inner join infodba.pItem item on itemRevision.RITEMS_TAGU = item.puid;

-- Note that WITH clause begins the Common Table Expressions ( CTE ). 
-- CTE is a way of storing results temporarily so that they can be consumed in another part of the same query.
