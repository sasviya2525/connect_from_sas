%let ds=sashelp.cars;
%let classvar=make;
%let varvar=mpg_city;
%let out=cars;

proc means data=&ds.;
class &classvar.;
var &varvar.;
output out=&out._means;
run;

proc summary data=&ds.;
class &classvar.;
var &varvar.;
output out=&out._summary min=min1 max=max1 mean=mean1;
run;
