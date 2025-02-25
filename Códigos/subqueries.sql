-- subqueries

use company;

select distinct Pnumber from project
	where Pnumber in
		(select Pnumber
			from project, departament, employee
			where (Mgr_ssn = Ssn and Lname = 'Moozer' and Dnum = Dnumber)
		)
		or
        (select distinct Pno
			from work_on, employee
            where (Essn = Ssn and Lname = 'Moozer')
		);

select distinct * from work_on
	where (Pno, Hours) IN (select Pno, Hours
						   from work_on
                           where Essn=123456789);
                           


