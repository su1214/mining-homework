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
| KNN Model    | 16  | 62569.89 |
| Linear Model | NA  | 58610.17 |

Choose k = 16 as it has the smallest mean RMSE over 5 folds. <br>
Standard error is smaller for the linear model.

Linear regression output is below:

    ## 
    ## Call:
    ## lm(formula = price ~ . - pctCollege - sewer - newConstruction + 
    ##     rooms:bathrooms, data = .)
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -192597  -34121   -4418   27581  384900 
    ## 
    ## Coefficients:
    ##                          Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)             1.906e+05  2.297e+04   8.296 2.56e-16 ***
    ## lotSize                 8.630e+03  2.140e+03   4.032 5.83e-05 ***
    ## age                    -8.606e+01  5.963e+01  -1.443 0.149159    
    ## landValue               8.924e-01  4.888e-02  18.257  < 2e-16 ***
    ## livingArea              6.236e+01  4.978e+00  12.526  < 2e-16 ***
    ## bedrooms               -4.186e+03  2.723e+03  -1.537 0.124436    
    ## fireplaces              4.122e+03  3.088e+03   1.335 0.182123    
    ## bathrooms               2.185e+03  7.923e+03   0.276 0.782708    
    ## rooms                  -2.816e+03  2.177e+03  -1.293 0.196156    
    ## heatinghot water/steam -6.800e+03  4.435e+03  -1.533 0.125499    
    ## heatingelectric        -8.522e+02  1.339e+04  -0.064 0.949258    
    ## fuelelectric           -9.149e+03  1.322e+04  -0.692 0.488872    
    ## fueloil                -5.636e+03  5.034e+03  -1.120 0.263071    
    ## waterfrontNo           -1.231e+05  1.629e+04  -7.553 7.76e-14 ***
    ## centralAirNo           -1.221e+04  3.592e+03  -3.398 0.000698 ***
    ## bathrooms:rooms         2.699e+03  9.937e+02   2.716 0.006683 ** 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 54810 on 1366 degrees of freedom
    ## Multiple R-squared:  0.6862, Adjusted R-squared:  0.6828 
    ## F-statistic: 199.2 on 15 and 1366 DF,  p-value: < 2.2e-16

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

|              | Out-of-Sample RMSE |
|:-------------|-------------------:|
| Baseline 1   |          3.1207958 |
| Baseline 2   |          0.2332284 |
| Linear Model |          0.2330068 |

Baseline 2 and Linear Model have similar RMSEs. They both perform much
better than the baseline 1 model. RMSEs were calculated with 5-fold
cross validations.

![](exercise_2_files/figure-markdown_github/unnamed-chunk-9-1.png)

The ROC curves are also better for baseline 2 and the linear model than
that of baseline 1. The two look similar to each other.

| model     |       TPR |       FPR |
|:----------|----------:|----------:|
| baseline1 | 0.0000000 | 0.0000000 |
| baseline2 | 0.0442916 | 0.0406624 |
| LPM       | 0.0429161 | 0.0401064 |

This table has the TPR and FPR of the models when the threshold is set
at 0.5. We can see that the baseline 2 and LPM has higher TPRs.

### Model validation: step 1

![](exercise_2_files/figure-markdown_github/unnamed-chunk-11-1.png)

### Model validation: step 2

|        | hotels_predicted | hotels_actual | hotels_difference |
|:-------|:-----------------|:--------------|:------------------|
| Fold01 | 19               | 22            | 3                 |
| Fold02 | 20               | 25            | 5                 |
| Fold03 | 20               | 17            | -3                |
| Fold04 | 20               | 23            | 3                 |
| Fold05 | 20               | 16            | -4                |
| Fold06 | 26               | 30            | 4                 |
| Fold07 | 18               | 15            | -3                |
| Fold08 | 25               | 23            | -2                |
| Fold09 | 20               | 28            | 8                 |
| Fold10 | 23               | 26            | 3                 |
| Fold11 | 24               | 25            | 1                 |
| Fold12 | 17               | 15            | -2                |
| Fold13 | 20               | 18            | -2                |
| Fold14 | 25               | 21            | -4                |
| Fold15 | 18               | 17            | -1                |
| Fold16 | 21               | 12            | -9                |
| Fold17 | 19               | 21            | 2                 |
| Fold18 | 20               | 13            | -7                |
| Fold19 | 19               | 18            | -1                |
| Fold20 | 19               | 17            | -2                |
| total  | 413              | 402           | 11                |

The model does the prediction pretty well. It only had 11 predictions
wrong in total out of 4999 observations.
