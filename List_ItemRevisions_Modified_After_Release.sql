-- List of Item Revisions that are modified post release. Sometimes admins may change the Item Revision metadata after release ( say to SAP )
-- for various reasons ( say to sync Teamcenter and SAP ). A time would certainly come when identifying such list is needed. In those
-- cases, the below SQL could be leveraged.

select item.pItem_id as ItemId, itemRev.PITEM_REVISION_ID as RevisionId
from infodba.pItemRevision itemRev
inner join infodba.pItem item on itemRev.RITEMS_TAGU = item.puid
inner join infodba.pPOM_Application_Object paoItemRevision on itemRev.puid = paoItemRevision.puid
inner join infodba.pWorkspaceObject wsoItemRevision on itemRev.puid = wsoItemRevision.puid
where paoItemRevision.PLAST_MOD_DATE >  wsoItemRevision.PDATE_RELEASED;

