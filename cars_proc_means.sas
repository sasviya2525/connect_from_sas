proc means data=sashelp.cars;
class make;
var mpg_city;
output out=cars;
run;