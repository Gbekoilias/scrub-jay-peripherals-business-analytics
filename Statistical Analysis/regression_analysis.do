* Clear any existing data in memory
clear all

* Set the working directory (update with your actual path)
cd "C:\path\to\your\data"

* Load the dataset (update with your actual dataset name)
use "your_dataset.dta", clear

* Define the dependent variable and independent variables
local dependentVar outcome_variable  // Replace with your actual dependent variable name
local independentVars var1 var2 var3  // Replace with your actual independent variable names

* Perform regression analysis
regress `dependentVar' `independentVars'

* Display regression results
di "Regression results for `dependentVar' on `independentVars':"
di "---------------------------------------------------"
di "Coefficient estimates:"
matrix list e(b)  // Display coefficient estimates
di "---------------------------------------------------"
di "Standard errors:"
matrix list e(V)  // Display variance-covariance matrix of estimates

* Optionally, save the regression output to a file
outreg2 using "regression_results.doc", replace ctitle("Regression Analysis Results") ///
    bdec(3) sdec(3)  // Requires outreg2 package; adjust options as needed

* End of the script
