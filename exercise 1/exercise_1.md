#1) Data visualization: flights at ABIA

    ## Rows: 99260 Columns: 29

    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## chr  (5): UniqueCarrier, TailNum, Origin, Dest, CancellationCode
    ## dbl (24): Year, Month, DayofMonth, DayOfWeek, DepTime, CRSDepTime, ArrTime, ...

    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

    ## Source : https://maps.googleapis.com/maps/api/staticmap?center=usa&zoom=4&size=640x640&scale=2&maptype=terrain&language=en-EN&key=xxx

    ## Source : https://maps.googleapis.com/maps/api/geocode/json?address=usa&key=xxx

![](exercise_1_files/figure-markdown_github/unnamed-chunk-1-1.png)

#2) Wrangling the Billboard Top 100

    ## New names:
    ## * `` -> ...1

    ## Rows: 327895 Columns: 13

    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## chr (5): url, week_id, song, performer, song_id
    ## dbl (8): ...1, week_position, instance, previous_week_position, peak_positio...

    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

![](exercise_1_files/figure-markdown_github/unnamed-chunk-2-1.png)![](exercise_1_files/figure-markdown_github/unnamed-chunk-2-2.png)

#3) Wrangling the Olympics

    ## Rows: 23850 Columns: 15

    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## chr (10): name, sex, team, noc, games, season, city, sport, event, medal
    ## dbl  (5): id, age, height, weight, year

    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

    ## [1] 10.86549

![](exercise_1_files/figure-markdown_github/unnamed-chunk-3-1.png)

    ## `summarise()` has grouped output by 'year'. You can override using the `.groups` argument.

![](exercise_1_files/figure-markdown_github/unnamed-chunk-3-2.png)

#4) K-nearest neighbors ##350

    ## Rows: 29466 Columns: 17

    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## chr (11): trim, subTrim, condition, color, displacement, fuel, state, region...
    ## dbl  (5): id, mileage, year, featureCount, price
    ## lgl  (1): isOneOwner

    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

    ##        id            trim             subTrim           condition        
    ##  Min.   :  282   Length:416         Length:416         Length:416        
    ##  1st Qu.:14290   Class :character   Class :character   Class :character  
    ##  Median :26658   Mode  :character   Mode  :character   Mode  :character  
    ##  Mean   :26520                                                           
    ##  3rd Qu.:39599                                                           
    ##  Max.   :52220                                                           
    ##  isOneOwner         mileage            year         color          
    ##  Mode :logical   Min.   :     6   Min.   :1994   Length:416        
    ##  FALSE:310       1st Qu.: 19264   1st Qu.:2006   Class :character  
    ##  TRUE :106       Median : 29998   Median :2012   Mode  :character  
    ##                  Mean   : 42926   Mean   :2010                     
    ##                  3rd Qu.: 63479   3rd Qu.:2012                     
    ##                  Max.   :173000   Max.   :2013                     
    ##  displacement           fuel              state              region         
    ##  Length:416         Length:416         Length:416         Length:416        
    ##  Class :character   Class :character   Class :character   Class :character  
    ##  Mode  :character   Mode  :character   Mode  :character   Mode  :character  
    ##                                                                             
    ##                                                                             
    ##                                                                             
    ##  soundSystem         wheelType          wheelSize          featureCount   
    ##  Length:416         Length:416         Length:416         Min.   :  0.00  
    ##  Class :character   Class :character   Class :character   1st Qu.: 31.75  
    ##  Mode  :character   Mode  :character   Mode  :character   Median : 54.00  
    ##                                                           Mean   : 49.22  
    ##                                                           3rd Qu.: 70.00  
    ##                                                           Max.   :112.00  
    ##      price       
    ##  Min.   :  6600  
    ##  1st Qu.: 19401  
    ##  Median : 52900  
    ##  Mean   : 46854  
    ##  3rd Qu.: 61991  
    ##  Max.   :106010

![](exercise_1_files/figure-markdown_github/unnamed-chunk-4-1.png)

    ## Warning: executing %dopar% sequentially: no parallel backend registered

    ##          k       err
    ## result.1 2 13835.386
    ## result.2 3 11003.997
    ## result.3 4 10408.672
    ## result.4 5 10550.386
    ## result.5 6 10017.432
    ## result.6 7  9915.743

![](exercise_1_files/figure-markdown_github/unnamed-chunk-4-2.png)

    ## [1] 14

![](exercise_1_files/figure-markdown_github/unnamed-chunk-4-3.png)![](exercise_1_files/figure-markdown_github/unnamed-chunk-4-4.png)

##65 AMG

    ##        id            trim             subTrim           condition        
    ##  Min.   :  172   Length:1413        Length:1413        Length:1413       
    ##  1st Qu.:12809   Class :character   Class :character   Class :character  
    ##  Median :25863   Mode  :character   Mode  :character   Mode  :character  
    ##  Mean   :26087                                                           
    ##  3rd Qu.:38679                                                           
    ##  Max.   :52323                                                           
    ##  isOneOwner         mileage            year         color          
    ##  Mode :logical   Min.   :     1   Min.   :2008   Length:1413       
    ##  FALSE:1247      1st Qu.:    12   1st Qu.:2010   Class :character  
    ##  TRUE :166       Median :    60   Median :2014   Mode  :character  
    ##                  Mean   : 19354   Mean   :2013                     
    ##                  3rd Qu.: 36083   3rd Qu.:2015                     
    ##                  Max.   :147851   Max.   :2015                     
    ##  displacement           fuel              state              region         
    ##  Length:1413        Length:1413        Length:1413        Length:1413       
    ##  Class :character   Class :character   Class :character   Class :character  
    ##  Mode  :character   Mode  :character   Mode  :character   Mode  :character  
    ##                                                                             
    ##                                                                             
    ##                                                                             
    ##  soundSystem         wheelType          wheelSize          featureCount   
    ##  Length:1413        Length:1413        Length:1413        Min.   :  0.00  
    ##  Class :character   Class :character   Class :character   1st Qu.: 14.00  
    ##  Mode  :character   Mode  :character   Mode  :character   Median : 57.00  
    ##                                                           Mean   : 47.48  
    ##                                                           3rd Qu.: 75.00  
    ##                                                           Max.   :119.00  
    ##      price       
    ##  Min.   : 23990  
    ##  1st Qu.: 62995  
    ##  Median :150735  
    ##  Mean   :119549  
    ##  3rd Qu.:163055  
    ##  Max.   :251025

![](exercise_1_files/figure-markdown_github/unnamed-chunk-5-1.png)

    ##           k      err
    ## result.1  2 15563.67
    ## result.2  4 15454.35
    ## result.3  6 14415.34
    ## result.4  8 13847.73
    ## result.5 10 13479.68
    ## result.6 15 13200.67

![](exercise_1_files/figure-markdown_github/unnamed-chunk-5-2.png)

    ## [1] 50

![](exercise_1_files/figure-markdown_github/unnamed-chunk-5-3.png)![](exercise_1_files/figure-markdown_github/unnamed-chunk-5-4.png)
