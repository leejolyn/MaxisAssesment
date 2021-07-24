COMMIT;

--total records of data
select count(*)
from airport_data;

--task 1
select airport_data.name,city,country from airport_data
where country='Malaysia';

select count(country)
from airport_data
where country='Malaysia';

--task 2
CREATE OR REPLACE FUNCTION airports_distance(
        p_latitude1 NUMBER,
        p_longitude1 NUMBER,
        p_latitude2 NUMBER,
        p_longitude2 NUMBER) 
    RETURN NUMBER DETERMINISTIC IS

    earth_radius NUMBER := 6371;
    pi NUMBER := ACOS(-1)/180; 

    lat_delta NUMBER;
    lon_delta NUMBER;
    arc NUMBER;

BEGIN

    lat_delta := (p_latitude2-p_latitude1)*pi;
    lon_delta := (p_longitude2-p_longitude1)*pi;
    arc := SIN(lat_delta/2) * SIN(lat_delta/2) + SIN(lon_delta/2) * SIN(lon_delta/2) * COS(p_latitude1*pi) * COS(p_latitude2*pi);
    return earth_radius * 2 * atan2(sqrt(arc), sqrt(1-arc));
END;
/

SELECT airports_distance(3.12385010719,113.019996643,1.484699964523315,110.34700012207031) from dual;

--task 3(i)
select count(airport_name)
from flight_status
where airport_name='KUL'or airport_name='BKI' or airport_name='SZB' or airport_name='PEN' or airport_name='KCH';

select * from flight_status
where airport_name='KUL'or airport_name='BKI' or airport_name='SZB' or airport_name='PEN' or airport_name='KCH';

--task 3(ii)
select airport_name, COUNT(*)from flight_status
where airport_name='KUL'
or airport_name='BKI' or airport_name='SZB' 
or airport_name='PEN' or airport_name='KCH'
group by airport_name
order by count (*) desc;

select airport_name, COUNT(*)from flight_status
group by airport_name
order by count (*) desc;


