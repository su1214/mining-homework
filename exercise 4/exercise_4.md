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

    ##     lhs                     rhs                support    confidence coverage  
    ## [1] {onions}             => {other vegetables} 0.01423488 0.4590164  0.03101169
    ## [2] {hamburger meat}     => {other vegetables} 0.01382816 0.4159021  0.03324860
    ## [3] {chicken}            => {other vegetables} 0.01789527 0.4170616  0.04290798
    ## [4] {whipped/sour cream} => {other vegetables} 0.02887646 0.4028369  0.07168277
    ## [5] {root vegetables}    => {other vegetables} 0.04738180 0.4347015  0.10899847
    ##     lift     count
    ## [1] 2.372268 140  
    ## [2] 2.149447 136  
    ## [3] 2.155439 176  
    ## [4] 2.081924 284  
    ## [5] 2.246605 466

![](exercise_4_files/figure-markdown_github/groceries-1.png)![](exercise_4_files/figure-markdown_github/groceries-2.png)![](exercise_4_files/figure-markdown_github/groceries-3.png)

    ##      lhs                   rhs                support    confidence coverage 
    ## [1]  {}                 => {bottled water}    0.11052364 0.1105236  1.0000000
    ## [2]  {}                 => {tropical fruit}   0.10493137 0.1049314  1.0000000
    ## [3]  {}                 => {root vegetables}  0.10899847 0.1089985  1.0000000
    ## [4]  {}                 => {soda}             0.17437722 0.1743772  1.0000000
    ## [5]  {}                 => {yogurt}           0.13950178 0.1395018  1.0000000
    ## [6]  {}                 => {rolls/buns}       0.18393493 0.1839349  1.0000000
    ## [7]  {}                 => {other vegetables} 0.19349263 0.1934926  1.0000000
    ## [8]  {}                 => {whole milk}       0.25551601 0.2555160  1.0000000
    ## [9]  {tropical fruit}   => {whole milk}       0.04229792 0.4031008  0.1049314
    ## [10] {whole milk}       => {tropical fruit}   0.04229792 0.1655392  0.2555160
    ## [11] {root vegetables}  => {other vegetables} 0.04738180 0.4347015  0.1089985
    ## [12] {other vegetables} => {root vegetables}  0.04738180 0.2448765  0.1934926
    ## [13] {root vegetables}  => {whole milk}       0.04890696 0.4486940  0.1089985
    ## [14] {whole milk}       => {root vegetables}  0.04890696 0.1914047  0.2555160
    ## [15] {soda}             => {whole milk}       0.04006101 0.2297376  0.1743772
    ## [16] {whole milk}       => {soda}             0.04006101 0.1567847  0.2555160
    ## [17] {yogurt}           => {other vegetables} 0.04341637 0.3112245  0.1395018
    ## [18] {other vegetables} => {yogurt}           0.04341637 0.2243826  0.1934926
    ## [19] {yogurt}           => {whole milk}       0.05602440 0.4016035  0.1395018
    ## [20] {whole milk}       => {yogurt}           0.05602440 0.2192598  0.2555160
    ## [21] {rolls/buns}       => {other vegetables} 0.04260295 0.2316197  0.1839349
    ## [22] {other vegetables} => {rolls/buns}       0.04260295 0.2201787  0.1934926
    ## [23] {rolls/buns}       => {whole milk}       0.05663447 0.3079049  0.1839349
    ## [24] {whole milk}       => {rolls/buns}       0.05663447 0.2216474  0.2555160
    ## [25] {other vegetables} => {whole milk}       0.07483477 0.3867578  0.1934926
    ## [26] {whole milk}       => {other vegetables} 0.07483477 0.2928770  0.2555160
    ##      lift      count
    ## [1]  1.0000000 1087 
    ## [2]  1.0000000 1032 
    ## [3]  1.0000000 1072 
    ## [4]  1.0000000 1715 
    ## [5]  1.0000000 1372 
    ## [6]  1.0000000 1809 
    ## [7]  1.0000000 1903 
    ## [8]  1.0000000 2513 
    ## [9]  1.5775950  416 
    ## [10] 1.5775950  416 
    ## [11] 2.2466049  466 
    ## [12] 2.2466049  466 
    ## [13] 1.7560310  481 
    ## [14] 1.7560310  481 
    ## [15] 0.8991124  394 
    ## [16] 0.8991124  394 
    ## [17] 1.6084566  427 
    ## [18] 1.6084566  427 
    ## [19] 1.5717351  551 
    ## [20] 1.5717351  551 
    ## [21] 1.1970465  419 
    ## [22] 1.1970465  419 
    ## [23] 1.2050318  557 
    ## [24] 1.2050318  557 
    ## [25] 1.5136341  736 
    ## [26] 1.5136341  736

    ##      lhs                     rhs                support    confidence
    ## [1]  {hard cheese}        => {whole milk}       0.01006609 0.4107884 
    ## [2]  {butter milk}        => {whole milk}       0.01159126 0.4145455 
    ## [3]  {ham}                => {whole milk}       0.01148958 0.4414062 
    ## [4]  {sliced cheese}      => {whole milk}       0.01077783 0.4398340 
    ## [5]  {oil}                => {whole milk}       0.01128622 0.4021739 
    ## [6]  {onions}             => {other vegetables} 0.01423488 0.4590164 
    ## [7]  {hamburger meat}     => {other vegetables} 0.01382816 0.4159021 
    ## [8]  {hamburger meat}     => {whole milk}       0.01474326 0.4434251 
    ## [9]  {sugar}              => {whole milk}       0.01504830 0.4444444 
    ## [10] {cream cheese }      => {whole milk}       0.01647178 0.4153846 
    ## [11] {chicken}            => {other vegetables} 0.01789527 0.4170616 
    ## [12] {chicken}            => {whole milk}       0.01759024 0.4099526 
    ## [13] {white bread}        => {whole milk}       0.01708185 0.4057971 
    ## [14] {frozen vegetables}  => {whole milk}       0.02043721 0.4249471 
    ## [15] {beef}               => {whole milk}       0.02125064 0.4050388 
    ## [16] {curd}               => {whole milk}       0.02613116 0.4904580 
    ## [17] {margarine}          => {whole milk}       0.02419929 0.4131944 
    ## [18] {butter}             => {whole milk}       0.02755465 0.4972477 
    ## [19] {domestic eggs}      => {whole milk}       0.02999492 0.4727564 
    ## [20] {whipped/sour cream} => {other vegetables} 0.02887646 0.4028369 
    ## [21] {whipped/sour cream} => {whole milk}       0.03223183 0.4496454 
    ## [22] {tropical fruit}     => {whole milk}       0.04229792 0.4031008 
    ## [23] {root vegetables}    => {other vegetables} 0.04738180 0.4347015 
    ## [24] {root vegetables}    => {whole milk}       0.04890696 0.4486940 
    ## [25] {yogurt}             => {whole milk}       0.05602440 0.4016035 
    ##      coverage   lift     count
    ## [1]  0.02450432 1.607682  99  
    ## [2]  0.02796136 1.622385 114  
    ## [3]  0.02602949 1.727509 113  
    ## [4]  0.02450432 1.721356 106  
    ## [5]  0.02806304 1.573968 111  
    ## [6]  0.03101169 2.372268 140  
    ## [7]  0.03324860 2.149447 136  
    ## [8]  0.03324860 1.735410 145  
    ## [9]  0.03385867 1.739400 148  
    ## [10] 0.03965430 1.625670 162  
    ## [11] 0.04290798 2.155439 176  
    ## [12] 0.04290798 1.604411 173  
    ## [13] 0.04209456 1.588147 168  
    ## [14] 0.04809354 1.663094 201  
    ## [15] 0.05246568 1.585180 209  
    ## [16] 0.05327911 1.919481 257  
    ## [17] 0.05856634 1.617098 238  
    ## [18] 0.05541434 1.946053 271  
    ## [19] 0.06344687 1.850203 295  
    ## [20] 0.07168277 2.081924 284  
    ## [21] 0.07168277 1.759754 317  
    ## [22] 0.10493137 1.577595 416  
    ## [23] 0.10899847 2.246605 466  
    ## [24] 0.10899847 1.756031 481  
    ## [25] 0.13950178 1.571735 551

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
