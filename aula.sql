select
	*
from
	Customer
where
	FirstName = N'Mary'

select
	*
from
	Customer
where
	LastName = N'Browning'


select
	count(*)
from
	Customer
where
	MiddleName is NULL



select
	*
from
	Customer
where
	FirstName = N'Mary' AND LastName = N'Browning'


select
	ModifiedDate
from
	Customer
where
	modifieddate > '2005-01-01'


--sp_helpindex customer

--create index idx1 on customer(firstname)
--create index idx2 on customer(lastname)
--create index idx3 on customer(middlename)
--create index idx4a on customer(firstname,lastname)
--create index idx4b on customer(lastname,firstname)
--create index idx5 on customer(ModifiedDate)