# False Position Function

Finds the root of a function using the False Position method
   
## Inputs:
* func: function
* xl: lower bound
* xu: upper bound
* es: desired relative error (defult to 0.0001%)
* maxit: maximum number of iterations (defult to 200)

## Outputs:
* root: estimated root
* fx: function evaluated at the root 
* ea: approximate relative error (%)
* iter: how many iterations were performed
