-- Query to get the BOM components from a given BVR ( and its revision ).

select distinct wso.pobject_name as RootBVR, child.pitem_id as Occurrence Child Item
from ppsoccurrence occ
join ppsbomviewrevision bvr on bvr.puid = occ.rparent_bvru
join pworkspaceobject wso on wso.puid = bvr.puid
left join pitem child on child.puid = occ.rchild_itemu
where wso.pobject_name like '<item-id>/AA-View'
