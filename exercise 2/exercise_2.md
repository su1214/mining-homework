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
| KNN Model    | 13  | 62700.05 |
| Linear Model | NA  | 59251.06 |

    ## 
    ## Call:
    ## lm(formula = price ~ . - pctCollege - sewer - newConstruction + 
    ##     rooms:bathrooms, data = .)
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -231664  -34400   -5223   26792  410984 
    ## 
    ## Coefficients:
    ##                          Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)             2.229e+05  2.552e+04   8.732  < 2e-16 ***
    ## lotSize                 1.166e+04  2.651e+03   4.398 1.18e-05 ***
    ## age                    -1.274e+02  6.478e+01  -1.967  0.04936 *  
    ## landValue               8.290e-01  5.105e-02  16.239  < 2e-16 ***
    ## livingArea              6.429e+01  5.221e+00  12.315  < 2e-16 ***
    ## bedrooms               -5.417e+03  2.857e+03  -1.896  0.05814 .  
    ## fireplaces              2.061e+03  3.248e+03   0.634  0.52595    
    ## bathrooms              -2.192e+03  8.478e+03  -0.259  0.79605    
    ## rooms                  -3.906e+03  2.300e+03  -1.698  0.08969 .  
    ## heatinghot water/steam -4.635e+03  4.635e+03  -1.000  0.31743    
    ## heatingelectric         4.050e+03  1.387e+04   0.292  0.77032    
    ## fuelelectric           -1.243e+04  1.364e+04  -0.912  0.36209    
    ## fueloil                -1.886e+03  5.530e+03  -0.341  0.73308    
    ## waterfrontNo           -1.468e+05  1.991e+04  -7.376 2.81e-13 ***
    ## centralAirNo           -1.143e+04  3.775e+03  -3.028  0.00251 ** 
    ## bathrooms:rooms         3.369e+03  1.064e+03   3.168  0.00157 ** 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 58040 on 1366 degrees of freedom
    ## Multiple R-squared:  0.6451, Adjusted R-squared:  0.6413 
    ## F-statistic: 165.6 on 15 and 1366 DF,  p-value: < 2.2e-16

Choose k = 13 as it has the smallest mean RMSE over 5 folds. <br>
Standard error is smaller for the linear model.

## 3) Classification and retrospective sampling

![](exercise_2_files/figure-markdown_github/unnamed-chunk-5-1.png)

    ##         (Intercept)            duration              amount         installment 
    ##                0.53                1.03                1.00                1.22 
    ##                 age         historypoor     historyterrible          purposeedu 
    ##                0.98                0.34                0.14                1.88 
    ## purposegoods/repair       purposenewcar      purposeusedcar       foreigngerman 
    ##                0.96                2.24                0.41                0.25

    ##    yhat
    ## y     0   1
    ##   0 160  17
    ##   1  54  19

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

|                      | Out-of-Sample RMSE |
|:---------------------|-------------------:|
| Baseline 1           |          3.1198654 |
| Baseline 2           |          0.2333196 |
| Linear (Logit) Model |          0.2330634 |

![](exercise_2_files/figure-markdown_github/unnamed-chunk-7-1.png)

    ##    predicted actual difference
    ## 1       2856    402      -2454
    ## 2       2856    402      -2454
    ## 3       2856    402      -2454
    ## 4       2856    402      -2454
    ## 5       2856    402      -2454
    ## 6       2856    402      -2454
    ## 7       2856    402      -2454
    ## 8       2856    402      -2454
    ## 9       2856    402      -2454
    ## 10      2856    402      -2454
    ## 11      2856    402      -2454
    ## 12      2856    402      -2454
    ## 13      2856    402      -2454
    ## 14      2856    402      -2454
    ## 15      2856    402      -2454
    ## 16      2856    402      -2454
    ## 17      2856    402      -2454
    ## 18      2856    402      -2454
    ## 19      2856    402      -2454
    ## 20      2856    402      -2454
