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
| KNN Model    | 15  | 62865.25 |
| Linear Model | NA  | 59102.58 |

Choose k = 15 as it has the smallest mean RMSE over 5 folds. <br>
Standard error is smaller for the linear model.

Linear regression output is below:

    ## 
    ## Call:
    ## lm(formula = price ~ . - pctCollege - sewer - newConstruction + 
    ##     rooms:bathrooms, data = .)
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -227180  -36547   -5135   28893  459415 
    ## 
    ## Coefficients:
    ##                          Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)             1.743e+05  2.328e+04   7.487 1.26e-13 ***
    ## lotSize                 9.527e+03  2.344e+03   4.064 5.10e-05 ***
    ## age                    -5.958e+01  6.632e+01  -0.898 0.369156    
    ## landValue               8.498e-01  5.286e-02  16.075  < 2e-16 ***
    ## livingArea              6.897e+01  5.370e+00  12.844  < 2e-16 ***
    ## bedrooms               -1.057e+04  2.907e+03  -3.635 0.000288 ***
    ## fireplaces              3.524e+03  3.367e+03   1.047 0.295387    
    ## bathrooms               1.370e+04  8.611e+03   1.591 0.111862    
    ## rooms                   9.622e+02  2.359e+03   0.408 0.683383    
    ## heatinghot water/steam -1.089e+04  4.796e+03  -2.271 0.023293 *  
    ## heatingelectric         7.637e+03  1.388e+04   0.550 0.582165    
    ## fuelelectric           -1.548e+04  1.359e+04  -1.139 0.254972    
    ## fueloil                -1.806e+03  5.453e+03  -0.331 0.740612    
    ## waterfrontNo           -1.226e+05  1.585e+04  -7.740 1.93e-14 ***
    ## centralAirNo           -1.136e+04  3.875e+03  -2.933 0.003415 ** 
    ## bathrooms:rooms         1.136e+03  1.079e+03   1.052 0.292848    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 59360 on 1366 degrees of freedom
    ## Multiple R-squared:  0.634,  Adjusted R-squared:   0.63 
    ## F-statistic: 157.8 on 15 and 1366 DF,  p-value: < 2.2e-16

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
| baseline2 | 0.0514443 | 0.0014747 |    0.7 |
| LPM       | 0.0258597 | 0.0007494 |    0.7 |
| baseline1 | 0.0000000 | 0.0000000 |    0.5 |
| baseline2 | 0.0836314 | 0.0033845 |    0.5 |
| LPM       | 0.0872077 | 0.0036988 |    0.5 |
| baseline1 | 0.0000000 | 0.0000242 |    0.2 |
| baseline2 | 0.1345254 | 0.0125952 |    0.2 |
| LPM       | 0.1334250 | 0.0127886 |    0.2 |

This table has the TPR and FPR of the models when the threshold is set
at 0.7, 0.5, and 0.2. Across various threshold values, baseline 1
displays too little TPRs. We can see that the baseline 2 and LPM has
higher TPRs. We choose baseline2 for further analysis.

### Model validation: step 1

![](exercise_2_files/figure-markdown_github/unnamed-chunk-11-1.png)

### Model validation: step 2

|        | Predicted | Actual | Difference |
|:-------|:----------|:-------|:-----------|
| Fold01 | 19        | 20     | 1          |
| Fold02 | 19        | 22     | 3          |
| Fold03 | 20        | 10     | -10        |
| Fold04 | 22        | 28     | 6          |
| Fold05 | 20        | 18     | -2         |
| Fold06 | 21        | 17     | -4         |
| Fold07 | 19        | 19     | 0          |
| Fold08 | 21        | 22     | 1          |
| Fold09 | 23        | 22     | -1         |
| Fold10 | 17        | 16     | -1         |
| Fold11 | 23        | 21     | -2         |
| Fold12 | 21        | 18     | -3         |
| Fold13 | 22        | 23     | 1          |
| Fold14 | 21        | 19     | -2         |
| Fold15 | 23        | 26     | 3          |
| Fold16 | 22        | 23     | 1          |
| Fold17 | 19        | 22     | 3          |
| Fold18 | 26        | 24     | -2         |
| Fold19 | 19        | 11     | -8         |
| Fold20 | 22        | 21     | -1         |
| total  | 419       | 402    | 17         |

The model does the prediction pretty well. It only had 72 predictions
wrong in total out of 4999 observations.
