## Clustering and PCA

We first ran PCA on those 11 chemical properties.

![](exercise_4_files/figure-markdown_github/winepca-1.png)![](exercise_4_files/figure-markdown_github/winepca-2.png)

From the first graph, we can see that red and white wines sort of form
clusters. This suggests that even after applying PCA, clustering would
be useful. The second graph says that the qualities are kind of all over
places, not easy to find a pattern.

![](exercise_4_files/figure-markdown_github/wineclustering-1.png)![](exercise_4_files/figure-markdown_github/wineclustering-2.png)

I first picked the model of 2 clusters to see if it would naturally form
two clusters of red and white wines. The first graph represents how the
two clusters are formed with the color and quality, it looks like one
cluster has red wine and the other has white wine, across all qualities.

Next, I picked the model of 4 clusters, hoping to see four groups of
wine, low/high qualities and red/wine. The second graph represents the 4
clusters across different colors and qualities of wine. I can’t really
find a set pattern for the groups I was hoping to find.

I then went ahead to graph the clusters on the PCA axes, having the
shape denote the color/quality. We can see how useful the clusters are
to explain the colors but not so much for the qualities. That is, almost
all points belong to one color of wine in the first graph, whereas there
are many points that are in different clusters with the same quality.

![](exercise_4_files/figure-markdown_github/wineclustering-graph1-1.png)

![](exercise_4_files/figure-markdown_github/wineclustering-graph2-1.png)

## Market Segmentation

![](exercise_4_files/figure-markdown_github/market_segmentation-1.png)![](exercise_4_files/figure-markdown_github/market_segmentation-2.png)![](exercise_4_files/figure-markdown_github/market_segmentation-3.png)![](exercise_4_files/figure-markdown_github/market_segmentation-4.png)![](exercise_4_files/figure-markdown_github/market_segmentation-5.png)![](exercise_4_files/figure-markdown_github/market_segmentation-6.png)![](exercise_4_files/figure-markdown_github/market_segmentation-7.png)

## Association rules for grocery purchase

![](exercise_4_files/figure-markdown_github/groceries-1.png)![](exercise_4_files/figure-markdown_github/groceries-2.png)![](exercise_4_files/figure-markdown_github/groceries-3.png)![](exercise_4_files/figure-markdown_github/groceries-4.png)

Chose the confidence and the support cutoff levels so that the subset
have around 25 rows.
