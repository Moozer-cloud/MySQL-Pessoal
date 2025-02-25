-- case statement

use company;

select * from employee;

update employee set Salary =
		case
			when Dno = 5 then Salary + 2000
            when Dno = 4 then Salary + 1500
            when Dno = 3 then Salary + 3000
            else Salary + 0
        end;

