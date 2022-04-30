## Clustering and PCA

We first ran PCA on those 11 chemical properties.

![](exercise_4_files/figure-markdown_github/winepca-1.png)![](exercise_4_files/figure-markdown_github/winepca-2.png)

From the first graph, we can see that red and white wines have pretty
different principal components. That is, we can easily distinguish

![](exercise_4_files/figure-markdown_github/wineclustering-1.png)![](exercise_4_files/figure-markdown_github/wineclustering-2.png)

![](exercise_4_files/figure-markdown_github/wineclustering-graph1-1.png)

![](exercise_4_files/figure-markdown_github/wineclustering-graph2-1.png)

## Market Segmentation

    ##                  Total
    ## chatter          34671
    ## photo_sharing    21256
    ## health_nutrition 20235
    ## cooking          15750
    ## politics         14098
    ## sports_fandom    12564

![](exercise_4_files/figure-markdown_github/market_segmentation-1.png)

    ## Importance of first k=3 (out of 36) components:
    ##                           PC1     PC2     PC3
    ## Standard deviation     2.1186 1.69824 1.59388
    ## Proportion of Variance 0.1247 0.08011 0.07057
    ## Cumulative Proportion  0.1247 0.20479 0.27536

![](exercise_4_files/figure-markdown_github/market_segmentation-2.png)

    ##    1    2 
    ## 7880    2

![](exercise_4_files/figure-markdown_github/market_segmentation-3.png)![](exercise_4_files/figure-markdown_github/market_segmentation-4.png)![](exercise_4_files/figure-markdown_github/market_segmentation-5.png)![](exercise_4_files/figure-markdown_github/market_segmentation-6.png)![](exercise_4_files/figure-markdown_github/market_segmentation-7.png)

## Association rules for grocery purchase

    ## Apriori
    ## 
    ## Parameter specification:
    ##  confidence minval smax arem  aval originalSupport maxtime support minlen
    ##         0.1    0.1    1 none FALSE            TRUE       5    0.01      1
    ##  maxlen target  ext
    ##       2  rules TRUE
    ## 
    ## Algorithmic control:
    ##  filter tree heap memopt load sort verbose
    ##     0.1 TRUE TRUE  FALSE TRUE    2    TRUE
    ## 
    ## Absolute minimum support count: 98 
    ## 
    ## set item appearances ...[0 item(s)] done [0.00s].
    ## set transactions ...[169 item(s), 9835 transaction(s)] done [0.00s].
    ## sorting and recoding items ... [88 item(s)] done [0.00s].
    ## creating transaction tree ... done [0.00s].
    ## checking subsets of size 1 2 done [0.00s].
    ## writing ... [339 rule(s)] done [0.00s].
    ## creating S4 object  ... done [0.00s].

![](exercise_4_files/figure-markdown_github/groceries-1.png)![](exercise_4_files/figure-markdown_github/groceries-2.png)![](exercise_4_files/figure-markdown_github/groceries-3.png)

    ## set of 339 rules
    ## 
    ## rule length distribution (lhs + rhs):sizes
    ##   1   2 
    ##   8 331 
    ## 
    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##   1.000   2.000   2.000   1.976   2.000   2.000 
    ## 
    ## summary of quality measures:
    ##     support          confidence        coverage            lift       
    ##  Min.   :0.01007   Min.   :0.1007   Min.   :0.02450   Min.   :0.7899  
    ##  1st Qu.:0.01200   1st Qu.:0.1367   1st Qu.:0.05897   1st Qu.:1.2933  
    ##  Median :0.01647   Median :0.1922   Median :0.08897   Median :1.5047  
    ##  Mean   :0.02264   Mean   :0.2156   Mean   :0.12303   Mean   :1.5598  
    ##  3rd Qu.:0.02430   3rd Qu.:0.2618   3rd Qu.:0.13950   3rd Qu.:1.7834  
    ##  Max.   :0.25552   Max.   :0.4972   Max.   :1.00000   Max.   :3.0404  
    ##      count       
    ##  Min.   :  99.0  
    ##  1st Qu.: 118.0  
    ##  Median : 162.0  
    ##  Mean   : 222.7  
    ##  3rd Qu.: 239.0  
    ##  Max.   :2513.0  
    ## 
    ## mining info:
    ##          data ntransactions support confidence
    ##  grocerytrans          9835    0.01        0.1
    ##                                                                                          call
    ##  apriori(data = grocerytrans, parameter = list(support = 0.01, confidence = 0.1, maxlen = 2))

![](exercise_4_files/figure-markdown_github/groceries-4.png)

Chose the confidence and the support cutoff levels so that the subset
have around 25 rows.
