-- This SQL gives the Item ID, the Revision ID and the specification dataset puid on them.

select owningItem.pItem_Id as OwningItem, owningItemRevision.pItem_Revision_Id as OwningItemRevision, dataset.puid as SpecificationDatasetPuid
from infodba.pItem owningItem
inner join infodba.pItemRevision owningItemRevision on owningItemRevision.rItems_Tagu = owningItem.puid
inner join infodba.pImanRelation relation on relation.RPRIMARY_OBJECTU = owningItemRevision.puid
inner join infodba.pDataset dataset on relation.RSECONDARY_OBJECTU = dataset.puid
inner join infodba.pImanType specificationType on specificationType.puid = relation.RRELATION_TYPEU
where specificationType.PTYPE_NAME LIKE 'IMAN_specification';
