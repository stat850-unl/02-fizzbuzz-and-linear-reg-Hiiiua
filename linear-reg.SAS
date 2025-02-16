/********************************************************************************/
/* Read in the data                                                             */
/********************************************************************************/
PROC IMPORT datafile = "02-fizzbuzz-and-linear-reg-Muxin_Hua/amazon_books.csv" out=books
  DBMS = csv; /* comma delimited file */
  GETNAMES = YES;
  
/********************************************************************************/
/* Compute the regression using the canned procedure                            */
/********************************************************************************/
/*PROC REG data=books;
    MODEL Amazon_Price = List_Price Hardcover NumPages;
RUN;*/

/********************************************************************************/
/* IML Code                                                                     */
/********************************************************************************/
/* I got the read all var _NUM_... lines from                                   */
/* https://dasl.datadescription.com/datafile/amazon-books/?_sfm_methods=Multiple+Regression&_sfm_cases=4+59943 */
/********************************************************************************/
PROC IML;
USE books;
   read all var _NUM_ INTO X1[colname=varname]; /* Read numeric vars */
CLOSE books;
  
Y = X1[,1]; /* Y pulled out */
X1[,1] = 1; /* Intercept column */
varname[1] = "Intercept";
varname_t = varname`; /* Make a column vector to match the fitted coefs */
    
* PRINT Y X1 varname_t; /* Just checking */
    
/* Find the estimated coefficients for each of the explanatory variables using */
/* simple matrix operations. Store your answer in res */
/* res = ... */
xx = X1`*X1;
inva = inv(xx);
xya = X1`*Y;
res = inva*xya;
run; 
/* Dont edit this */     
PRINT varname_t res; /* Print coefs with labels */
QUIT;
