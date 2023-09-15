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
