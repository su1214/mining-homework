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
| KNN Model    | 11  | 61869.04 |
| Linear Model | NA  | 58945.43 |

Choose k = 11 as it has the smallest mean RMSE over 5 folds. <br>
Standard error is smaller for the linear model.

Linear regression output is below:

    ## 
    ## Call:
    ## lm(formula = price ~ . - pctCollege - sewer - newConstruction + 
    ##     rooms:bathrooms, data = .)
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -224916  -34129   -4502   27629  384325 
    ## 
    ## Coefficients:
    ##                          Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)             2.038e+05  2.361e+04   8.632  < 2e-16 ***
    ## lotSize                 7.543e+03  2.259e+03   3.339 0.000863 ***
    ## age                    -6.998e+01  6.068e+01  -1.153 0.249042    
    ## landValue               8.193e-01  4.993e-02  16.408  < 2e-16 ***
    ## livingArea              6.611e+01  5.194e+00  12.728  < 2e-16 ***
    ## bedrooms               -6.603e+03  2.806e+03  -2.353 0.018768 *  
    ## fireplaces              2.543e+03  3.228e+03   0.788 0.430951    
    ## bathrooms               4.815e+03  8.042e+03   0.599 0.549451    
    ## rooms                  -2.018e+03  2.207e+03  -0.914 0.360729    
    ## heatinghot water/steam -6.484e+03  4.614e+03  -1.405 0.160171    
    ## heatingelectric         5.923e+03  1.405e+04   0.422 0.673331    
    ## fuelelectric           -1.493e+04  1.378e+04  -1.084 0.278538    
    ## fueloil                -5.034e+03  5.128e+03  -0.982 0.326386    
    ## waterfrontNo           -1.373e+05  1.694e+04  -8.104 1.17e-15 ***
    ## centralAirNo           -1.509e+04  3.762e+03  -4.010 6.39e-05 ***
    ## bathrooms:rooms         2.453e+03  1.005e+03   2.440 0.014807 *  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 57020 on 1366 degrees of freedom
    ## Multiple R-squared:  0.6729, Adjusted R-squared:  0.6693 
    ## F-statistic: 187.4 on 15 and 1366 DF,  p-value: < 2.2e-16

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
| baseline2 | 0.0200825 | 0.0220718 |    0.7 |
| LPM       | 0.0085282 | 0.0111689 |    0.7 |
| baseline1 | 0.0000000 | 0.0000000 |    0.5 |
| baseline2 | 0.0371389 | 0.0386317 |    0.5 |
| LPM       | 0.0393398 | 0.0402514 |    0.5 |
| baseline1 | 0.0005502 | 0.0001451 |    0.2 |
| baseline2 | 0.0869326 | 0.0840324 |    0.2 |
| LPM       | 0.0880330 | 0.0850719 |    0.2 |

This table has the TPR and FPR of the models when the threshold is set
at 0.7, 0.5, and 0.2. Across various threshold values, baseline 1
displays too little TPRs. We can see that the baseline 2 and LPM has
higher TPRs. Specifically, LPM has slightly higher TPR when the
threshold is lower(0.2) compared to baseline 2 with little difference in
FPR between these two models. When threshold is 0.7, the trade-off of
TPR and FPR makes it difficult to tell which one is better. We choose
LPM for further analysis.

### Model validation: step 1

![](exercise_2_files/figure-markdown_github/unnamed-chunk-11-1.png)

### Model validation: step 2

|        | Predicted | Actual | Difference |
|:-------|:----------|:-------|:-----------|
| Fold01 | 19        | 18     | -1         |
| Fold02 | 24        | 21     | -3         |
| Fold03 | 21        | 20     | -1         |
| Fold04 | 23        | 16     | -7         |
| Fold05 | 20        | 22     | 2          |
| Fold06 | 21        | 27     | 6          |
| Fold07 | 24        | 27     | 3          |
| Fold08 | 21        | 22     | 1          |
| Fold09 | 21        | 24     | 3          |
| Fold10 | 22        | 22     | 0          |
| Fold11 | 18        | 18     | 0          |
| Fold12 | 22        | 18     | -4         |
| Fold13 | 17        | 22     | 5          |
| Fold14 | 19        | 10     | -9         |
| Fold15 | 16        | 20     | 4          |
| Fold16 | 20        | 21     | 1          |
| Fold17 | 18        | 16     | -2         |
| Fold18 | 21        | 21     | 0          |
| Fold19 | 22        | 21     | -1         |
| Fold20 | 21        | 16     | -5         |
| total  | 410       | 402    | 8          |

The model does the prediction pretty well. It only had 8 predictions
wrong in total out of 4999 observations.
