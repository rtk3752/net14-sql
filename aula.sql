-- 1 - Scan > Seek
-- 2 - Lookup

--sp_helpindex customer

--select
--	*
--from
--	Customer
--where
--	FirstName = N'Mary'

--create index idx1 on customer(firstname)


--select
--	*
--from
--	Customer
--where
--	LastName = N'Browning'

--create index idx2 on customer(lastname)


--select
--	count(*)
--from
--	Customer
--where
--	MiddleName is NULL

--create index idx3 on customer(middlename)


--select
--	*
--from
--	Customer
--where
--	FirstName = N'Mary' AND LastName = N'Browning'

--create index idx4a on customer(firstname,lastname)
--create index idx4b on customer(lastname,firstname)


--select
--	ModifiedDate
--from
--	Customer
--where
--	modifieddate > '2005-01-01'

--create index idx5 on customer(ModifiedDate)
















--COVERED INDEX 1

SELECT LastName, Phone FROM Customer
WHERE FirstName = N'Mary';
--create index idx10 on customer(firstname, lastname, phone)

SELECT Phone FROM Customer
WHERE LastName = N'Browning';
--create index idx11a on customer(lastname,phone)
--drop index customer.idx11b
--create index idx11b on customer(phone,lastname)

SELECT SalesPerson, EmailAddress FROM Customer
WHERE LastName = N'Browning';
--create index idx12 on customer(lastname, salesperson, emailaddress)


SELECT LastName, FirstName FROM Customer-- with (index(idx1))
WHERE LastName LIKE N'G%';
--create index idx13 on customer(lastname,firstname)



--select
--	*
--from
--	sys.dm_db_index_usage_stats


--COVERED INDEX 2

SELECT COUNT(*) FROM Customer
WHERE MiddleName IS NULL
AND FirstName <> N'Mary'
drop index customer.idx15
create index idx15 on customer(middlename, firstname)

SELECT DISTINCT CompanyName FROM Customer
WHERE Title <> 'Ms.'
AND Phone LIKE '692-%';
create index idx16 on customer(phone,title,companyname)

SELECT CompanyName, SalesPerson, EmailAddress, Phone
FROM Customer
WHERE CustomerID IN
	(SELECT CustomerID
	FROM Customer
	WHERE LastName = N'Browning'); --antes temos problema de query.