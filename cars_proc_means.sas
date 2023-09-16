/* added a comment from github.com to indicate the beginning of the file */

%let ds=sashelp.cars;
%let classvar=make;
%let varvar=mpg_city;
%let out=cars;

proc means data=&ds.;
class &classvar.;
var &varvar.;
output out=&out._means;
run;

/* adding another variable for median */
proc summary data=&ds.;
class &classvar.;
var &varvar.;
output out=&out._summary min=min1 max=max1 mean=mean1 median=median1;
run;

/* added a comment from github.com to indicate the end of the file */

/* lets add a few more lines of code and add a little more complexity to the program */
/*create a dataset for monthly budget, monthly distance to work and gas prices to see which car fit in the budget
  based on mpg_city */

data travel_info;
input monthly_gas_budget :4. monthly_commute :4. avg_gas_price :4.;
datalines;
75 440 4.2
80 510 4.1
50 200 4.3
100 1000 3.95
60 510 4.0
;
run;

proc sql;
create table cars_mpg  as
select a.make, a.model, a.mpg_city, b.*, b.monthly_commute/a.mpg_city as required_gallons_per_mth,
b.monthly_commute*avg_gas_price/a.mpg_city as estimated_monthly_cost
from &ds. a, travel_info b
where calculated estimated_monthly_cost < b.monthly_gas_budget;
quit;


