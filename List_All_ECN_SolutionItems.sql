-- This is a query to find all the Item Revisions that are solution items to an ECN in the current database.
-- Various Teamcenter developers put various ECN final release states. So this query can be updated to restrict only those ECNs
-- which are release to downstream applications.

select ecnItem.pitem_id as ECN_Item, solutionItem.pitem_id as Solution_Item, solutionItemRevision.pItem_Revision_Id as SolutionItem_Revision
from infodba.pItemRevision solutionItemRevision
inner join infodba.pImanRelation solutionItemsRelation ON solutionItemRevision.puid = solutionItemsRelation.RSECONDARY_OBJECTU
inner join infodba.pItemRevision ecnRevision ON  ecnRevision.puid = solutionitemsrelation.Rprimary_Objectu
inner join infodba.pItem solutionItem on solutionItem.puid = solutionItemRevision.rItems_Tagu
inner join infodba.pItem ecnItem on ecnItem.puid = ecnRevision.rItems_Tagu
inner join infodba.pWorkspaceObject wso ON wso.puid = ecnItem.puid
where wso.pobject_type LIKE '%ECN%'
order by ecnItem.pitem_id ASC, solutionItem.pitem_id ASC;
