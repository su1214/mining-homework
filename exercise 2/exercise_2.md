## 1) Data visualization

![](exercise_2_files/figure-markdown_github/unnamed-chunk-1-1.png)

![](exercise_2_files/figure-markdown_github/unnamed-chunk-2-1.png)

## 2) Saratoga house prices

The linear model seems to do better at achieving lower out-of sample
mean-squared error. It is also beneficial to use this model as we can
distinguish which variables have significant effects on the house
prices. The Lot Size, Land Value, Living Area, Waterfront and Central
Air Conditioning have significant effects on the house prices. All of
them are positively correlated with the house prices.

### Appendix of Q2

![](exercise_2_files/figure-markdown_github/unnamed-chunk-4-1.png)

|              | k   |     rMSE |
|:-------------|:----|---------:|
| KNN Model    | 9   | 62816.06 |
| Linear Model | NA  | 59031.56 |

Choose k = 9 as it has the smallest mean RMSE over 5 folds. <br>
Standard error is smaller for the linear model.

Linear regression output is below:

    ## 
    ## Call:
    ## lm(formula = price ~ . - pctCollege - sewer - newConstruction + 
    ##     rooms:bathrooms, data = .)
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -229464  -35122   -4341   26953  461452 
    ## 
    ## Coefficients:
    ##                          Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)             2.079e+05  2.425e+04   8.572  < 2e-16 ***
    ## lotSize                 9.435e+03  2.509e+03   3.761 0.000177 ***
    ## age                    -8.685e+01  6.646e+01  -1.307 0.191552    
    ## landValue               8.411e-01  5.229e-02  16.085  < 2e-16 ***
    ## livingArea              6.336e+01  5.454e+00  11.615  < 2e-16 ***
    ## bedrooms               -5.966e+03  2.900e+03  -2.057 0.039874 *  
    ## fireplaces              1.127e+03  3.380e+03   0.334 0.738793    
    ## bathrooms               6.218e+02  8.596e+03   0.072 0.942340    
    ## rooms                  -3.293e+03  2.349e+03  -1.402 0.161248    
    ## heatinghot water/steam -8.378e+03  4.819e+03  -1.739 0.082348 .  
    ## heatingelectric        -2.264e+03  1.424e+04  -0.159 0.873701    
    ## fuelelectric           -5.567e+03  1.399e+04  -0.398 0.690832    
    ## fueloil                -2.433e+03  5.456e+03  -0.446 0.655774    
    ## waterfrontNo           -1.315e+05  1.706e+04  -7.709 2.42e-14 ***
    ## centralAirNo           -1.320e+04  3.965e+03  -3.330 0.000892 ***
    ## bathrooms:rooms         3.119e+03  1.087e+03   2.869 0.004184 ** 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 59730 on 1366 degrees of freedom
    ## Multiple R-squared:  0.6384, Adjusted R-squared:  0.6344 
    ## F-statistic: 160.8 on 15 and 1366 DF,  p-value: < 2.2e-16

## 3) Classification and retrospective sampling

![](exercise_2_files/figure-markdown_github/unnamed-chunk-6-1.png)

| history  | count |
|:---------|------:|
| good     |    89 |
| poor     |   618 |
| terrible |   293 |
| total    |  1000 |

In this logistic regression model, having the `historypoor` variable 1
multiplies odds of default by 0.39 and having the `historyterrible`
variable 1 multiplies odds of default by 0.19. This means that having
poor or terrible credit actually decreases the probability of default.
This does not reconcile with the common sense; we think the dataset is
not appropriate for building a predictive model of defaults especially
if the purpose of the model is to screen prospective borrowers to
classify them into “high” versus “low” probability of default. It is
because of the data sampling process. In the data sampling process,
instead of random sampling, the bank picked the defaulted loans and
looked for similar kinds of loans. This likely created a big bias in the
data collecting process: as mentioned above, in common sense, it is
likely that the credit history for defaulted loans are poor or terrible
and it would not include enough dataset with good credit history. In
fact, out of 1000 observations, only 89 observaations have good credit
history. I would suggest the bank to use random sampling method even
though it would not include a lot of defaulted loans. If possible,
increasing the size of the observations will help tremendously.

## 4) Children and hotel reservations

### Model Building

![](exercise_2_files/figure-markdown_github/unnamed-chunk-9-1.png)

The ROC curves are also better for baseline 2 and the linear model than
that of baseline 1. The two look similar to each other.

| model     |       TPR |       FPR | thresh |
|:----------|----------:|----------:|-------:|
| baseline1 | 0.0000000 | 0.0000000 |    0.7 |
| baseline2 | 0.0517194 | 0.0015230 |    0.7 |
| LPM       | 0.0286107 | 0.0008945 |    0.7 |
| baseline1 | 0.0000000 | 0.0000000 |    0.5 |
| baseline2 | 0.0891334 | 0.0030944 |    0.5 |
| LPM       | 0.0852820 | 0.0035054 |    0.5 |
| baseline1 | 0.0002751 | 0.0000242 |    0.2 |
| baseline2 | 0.1372765 | 0.0114590 |    0.2 |
| LPM       | 0.1342503 | 0.0128369 |    0.2 |

This table has the TPR and FPR of the models when the threshold is set
at 0.7, 0.5, and 0.2. Across various threshold values, baseline 1
displays too little TPRs. We can see that the baseline 2 and LPM has
higher TPRs. We choose baseline2 for further analysis.

### Model validation: step 1

![](exercise_2_files/figure-markdown_github/unnamed-chunk-11-1.png)

### Model validation: step 2

|        | Predicted | Actual | Difference |
|:-------|:----------|:-------|:-----------|
| Fold01 | 23        | 29     | 6          |
| Fold02 | 18        | 18     | 0          |
| Fold03 | 22        | 20     | -2         |
| Fold04 | 21        | 23     | 2          |
| Fold05 | 23        | 24     | 1          |
| Fold06 | 20        | 20     | 0          |
| Fold07 | 20        | 22     | 2          |
| Fold08 | 18        | 17     | -1         |
| Fold09 | 23        | 20     | -3         |
| Fold10 | 21        | 19     | -2         |
| Fold11 | 19        | 19     | 0          |
| Fold12 | 21        | 17     | -4         |
| Fold13 | 18        | 15     | -3         |
| Fold14 | 21        | 19     | -2         |
| Fold15 | 20        | 16     | -4         |
| Fold16 | 20        | 16     | -4         |
| Fold17 | 24        | 23     | -1         |
| Fold18 | 21        | 22     | 1          |
| Fold19 | 17        | 17     | 0          |
| Fold20 | 26        | 26     | 0          |
| total  | 416       | 402    | 76         |

The model does the prediction pretty well. It only had 76 predictions
wrong in total out of 4999 observations.
