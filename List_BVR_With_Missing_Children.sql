-- Query to get all the BVRs that have occurrences which refer to Items or Item Revisions that are not present in the current database.

select distinct wso.pobject_name as RootBVR, child.puid as OccurrencePUID
from ppsoccurrence occ
join ppsbomviewrevision bvr on bvr.puid = occ.rparent_bvru
join pworkspaceobject wso on wso.puid = bvr.puid
left join pitem child on child.puid = occ.rchild_itemu
where wso.pobject_name like '%-View'
and child.pitem_id is null;
