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
| KNN Model    | 10  | 62991.03 |
| Linear Model | NA  | 59279.69 |

Choose k = 10 as it has the smallest mean RMSE over 5 folds. <br>
Standard error is smaller for the linear model.

Linear regression output is below:

    ## 
    ## Call:
    ## lm(formula = price ~ . - pctCollege - sewer - newConstruction + 
    ##     rooms:bathrooms, data = .)
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -226164  -35228   -5769   28448  466831 
    ## 
    ## Coefficients:
    ##                          Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)             1.829e+05  2.533e+04   7.221 8.56e-13 ***
    ## lotSize                 7.568e+03  2.272e+03   3.331 0.000889 ***
    ## age                    -1.619e+02  6.292e+01  -2.573 0.010183 *  
    ## landValue               8.295e-01  5.094e-02  16.285  < 2e-16 ***
    ## livingArea              6.706e+01  5.246e+00  12.784  < 2e-16 ***
    ## bedrooms               -6.603e+03  2.951e+03  -2.238 0.025412 *  
    ## fireplaces              3.349e+03  3.274e+03   1.023 0.306523    
    ## bathrooms               7.169e+03  8.422e+03   0.851 0.394800    
    ## rooms                  -1.951e+03  2.307e+03  -0.846 0.397924    
    ## heatinghot water/steam -5.754e+03  4.609e+03  -1.249 0.212058    
    ## heatingelectric         7.268e+03  1.311e+04   0.555 0.579291    
    ## fuelelectric           -1.443e+04  1.282e+04  -1.125 0.260653    
    ## fueloil                -2.232e+03  5.352e+03  -0.417 0.676739    
    ## waterfrontNo           -1.194e+05  1.904e+04  -6.270 4.82e-10 ***
    ## centralAirNo           -1.106e+04  3.840e+03  -2.880 0.004037 ** 
    ## bathrooms:rooms         2.176e+03  1.065e+03   2.043 0.041292 *  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 58600 on 1366 degrees of freedom
    ## Multiple R-squared:  0.6512, Adjusted R-squared:  0.6473 
    ## F-statistic:   170 on 15 and 1366 DF,  p-value: < 2.2e-16

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
| baseline2 | 0.0541953 | 0.0012571 |    0.7 |
| LPM       | 0.0288858 | 0.0005319 |    0.7 |
| baseline1 | 0.0000000 | 0.0000000 |    0.5 |
| baseline2 | 0.0938102 | 0.0026351 |    0.5 |
| LPM       | 0.0852820 | 0.0027801 |    0.5 |
| baseline1 | 0.0002751 | 0.0000725 |    0.2 |
| baseline2 | 0.1372765 | 0.0112897 |    0.2 |
| LPM       | 0.1309491 | 0.0112656 |    0.2 |

This table has the TPR and FPR of the models when the threshold is set
at 0.7, 0.5, and 0.2. Across various threshold values, baseline 1
displays too little TPRs. We can see that the baseline 2 and LPM has
higher TPRs. We choose baseline2 for further analysis.

### Model validation: step 1

![](exercise_2_files/figure-markdown_github/unnamed-chunk-11-1.png)

### Model validation: step 2

|        | Predicted | Actual | Difference |
|:-------|:----------|:-------|:-----------|
| Fold01 | 18        | 16     | -2         |
| Fold02 | 18        | 14     | -4         |
| Fold03 | 21        | 18     | -3         |
| Fold04 | 20        | 20     | 0          |
| Fold05 | 19        | 26     | 7          |
| Fold06 | 22        | 22     | 0          |
| Fold07 | 22        | 21     | -1         |
| Fold08 | 24        | 23     | -1         |
| Fold09 | 22        | 23     | 1          |
| Fold10 | 20        | 15     | -5         |
| Fold11 | 17        | 12     | -5         |
| Fold12 | 22        | 15     | -7         |
| Fold13 | 19        | 21     | 2          |
| Fold14 | 21        | 21     | 0          |
| Fold15 | 19        | 20     | 1          |
| Fold16 | 19        | 24     | 5          |
| Fold17 | 21        | 21     | 0          |
| Fold18 | 20        | 20     | 0          |
| Fold19 | 26        | 30     | 4          |
| Fold20 | 23        | 20     | -3         |
| total  | 413       | 402    | 11         |

The model does the prediction pretty well. It only got 11 predictions
wrong in total out of 4999 observations though if you look at each folds
individually there is a difference as in sometimes we have negative and
sometimes positive values, but in total it all averages out to 11.
