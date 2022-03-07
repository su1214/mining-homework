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
| KNN Model    | 11  | 62605.03 |
| Linear Model | NA  | 59241.46 |

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
    ## -216700  -34839   -5991   28404  452490 
    ## 
    ## Coefficients:
    ##                          Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)             1.780e+05  2.328e+04   7.646 3.88e-14 ***
    ## lotSize                 8.930e+03  2.296e+03   3.890 0.000105 ***
    ## age                    -9.726e+01  6.522e+01  -1.491 0.136139    
    ## landValue               8.699e-01  5.151e-02  16.888  < 2e-16 ***
    ## livingArea              6.362e+01  5.357e+00  11.876  < 2e-16 ***
    ## bedrooms               -9.921e+03  2.871e+03  -3.456 0.000565 ***
    ## fireplaces              1.157e+03  3.385e+03   0.342 0.732564    
    ## bathrooms               1.188e+04  8.786e+03   1.352 0.176643    
    ## rooms                   2.121e+03  2.361e+03   0.898 0.369317    
    ## heatinghot water/steam -8.534e+03  4.716e+03  -1.810 0.070558 .  
    ## heatingelectric        -4.790e+03  1.345e+04  -0.356 0.721742    
    ## fuelelectric           -8.388e+03  1.315e+04  -0.638 0.523629    
    ## fueloil                -3.233e+03  5.366e+03  -0.603 0.546934    
    ## waterfrontNo           -1.241e+05  1.567e+04  -7.918 4.96e-15 ***
    ## centralAirNo           -8.460e+03  3.826e+03  -2.211 0.027201 *  
    ## bathrooms:rooms         1.199e+03  1.096e+03   1.095 0.273773    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 58780 on 1366 degrees of freedom
    ## Multiple R-squared:  0.6476, Adjusted R-squared:  0.6437 
    ## F-statistic: 167.3 on 15 and 1366 DF,  p-value: < 2.2e-16

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
| baseline2 | 0.0459422 | 0.0013780 |    0.7 |
| LPM       | 0.0228336 | 0.0008220 |    0.7 |
| baseline1 | 0.0000000 | 0.0000000 |    0.5 |
| baseline2 | 0.0814305 | 0.0030219 |    0.5 |
| LPM       | 0.0775791 | 0.0034329 |    0.5 |
| baseline1 | 0.0002751 | 0.0000000 |    0.2 |
| baseline2 | 0.1345254 | 0.0111447 |    0.2 |
| LPM       | 0.1298487 | 0.0111447 |    0.2 |

This table has the TPR and FPR of the models when the threshold is set
at 0.7, 0.5, and 0.2. Across various threshold values, baseline 1
displays too little TPRs. We can see that the baseline 2 and LPM has
higher TPRs. We choose baseline2 for further analysis.

### Model validation: step 1

![](exercise_2_files/figure-markdown_github/unnamed-chunk-11-1.png)

### Model validation: step 2

|        | Predicted | Actual | Difference |
|:-------|:----------|:-------|:-----------|
| Fold01 | 21        | 25     | 4          |
| Fold02 | 23        | 19     | -4         |
| Fold03 | 17        | 17     | 0          |
| Fold04 | 18        | 14     | -4         |
| Fold05 | 24        | 21     | -3         |
| Fold06 | 19        | 20     | 1          |
| Fold07 | 22        | 19     | -3         |
| Fold08 | 22        | 18     | -4         |
| Fold09 | 23        | 24     | 1          |
| Fold10 | 18        | 14     | -4         |
| Fold11 | 22        | 16     | -6         |
| Fold12 | 19        | 23     | 4          |
| Fold13 | 24        | 26     | 2          |
| Fold14 | 20        | 24     | 4          |
| Fold15 | 21        | 24     | 3          |
| Fold16 | 20        | 20     | 0          |
| Fold17 | 23        | 25     | 2          |
| Fold18 | 19        | 17     | -2         |
| Fold19 | 17        | 18     | 1          |
| Fold20 | 18        | 18     | 0          |
| total  | 410       | 402    | 8          |

The model does the prediction pretty well. It only had 8 predictions
wrong in total out of 4999 observations.
