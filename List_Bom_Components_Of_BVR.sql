-- Query to get the BOM components from a given BVR ( and its revision ).

select distinct wso.pobject_name as RootBVR, child.pitem_id as Occurrence Child Item
from ppsoccurrence occ
join ppsbomviewrevision bvr on bvr.puid = occ.rparent_bvru
join pworkspaceobject wso on wso.puid = bvr.puid
join pstructure_revisions revtobvr on revtobvr.pvalu_0 = bvr.puid
join pitemrevision parentrev on parentrev.puid=revtobvr.puid
join pitem parentitem on parentitem.puid=parentrev.ritems_tagu
left join pitem child on child.puid = occ.rchild_itemu
where parentitem.pitem_id='<item-id>' AND parentrev.pitem_revision_id='AA';
