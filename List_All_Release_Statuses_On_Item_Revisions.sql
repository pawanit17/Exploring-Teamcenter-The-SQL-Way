-- The below SQL gives you the Item, the Item Revision ID and the Release status that is associated with that specific Item Revision ID

select item.pItem_Id as Item_ID, itemRevision.pItem_Revision_Id as Item_Revision_ID, releaseStatus.pName as ReleaseStatus
from infodba.pItemRevision itemRevision
inner join infodba.pItem item on itemRevision.RITEMS_TAGU = item.puid
inner join infodba.pRelease_Status_List releaseStatusList on releaseStatusList.puid = itemRevision.puid
inner join infodba.pReleaseStatus releaseStatus on releaseStatus.puid = releaseStatusList.pValu_0;

-- Note that in older databases, name of the release status list database table would have a suffix '_0' for historic reasons.
-- So, if the query does not work out well in your case, please do update the query at your end to have the name changed to pRelease_Status_List_0;
