-- Get Completed dispatcher requests
select dsprReq.pServiceName as ServiceName, Dsprreq.Ptaskid as TaskID
from infodba.pDispatcherRequest dsprReq
where dsprReq.pCurrentState LIKE 'COMPLETE';

-- Get Failed dispatcher requests
select dsprReq.pServiceName as ServiceName, Dsprreq.Ptaskid as TaskID
from infodba.pDispatcherRequest dsprReq
where dsprReq.pCurrentState LIKE 'TERMINAL';

-- Get new dispatcher requests that are not picked up yet
select dsprReq.pServiceName as ServiceName, Dsprreq.Ptaskid as TaskID
from infodba.pDispatcherRequest dsprReq
where dsprReq.pCurrentState LIKE 'INITIAL';

-- Get all the unique dispatcher translator services that have executed till now.
select distinct dsprReq.pServiceName as ServiceName
from infodba.pDispatcherRequest dsprReq;
