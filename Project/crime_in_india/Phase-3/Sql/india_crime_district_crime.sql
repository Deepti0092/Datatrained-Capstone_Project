show databases;
use district_wise_crimes;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

Create table district_wise_committed_crime(State char(50),
									        DISTRICT char(60),
                                            Year int ,
                                            Rape int,
                                            Kidnapping int,
                                            Dowry_Deaths int,
                                            Assault_on_women int,
                                            Insult_to_modesty_of_Women int,
                                            Cruelty_by_Husband_or_his_Relatives int,
                                            Importation_of_Girls int);

select * from district_wise_committed_crime;
select State,DISTRICT,Year,Rape,Kidnapping from  district_wise_committed_crime;

create table Rapekidnapping_analysis as 
select State ,DISTRICT,Year,Rape,Kidnapping 
from  district_wise_committed_crime;

SET SQL_SAFE_UPDATES = 0;
delete from Rapekidnapping_analysis where DISTRICT like 'TOTAL';
delete from Rapekidnapping_analysis where DISTRICT like 'DELHI UT TOTAL';
SET SQL_SAFE_UPDATES = 1;


SELECT State ,DISTRICT,sum(rape)
FROM Rapekidnapping_analysis 
GROUP BY State ,DISTRICT
ORDER BY state,max(sum(rape)) ;


SELECT State ,DISTRICT,Year,
max(Rape),max(Kidnapping) 
FROM Rapekidnapping_analysis 
GROUP BY State ,DISTRICT ,year 
ORDER BY max(Kidnapping) desc;








