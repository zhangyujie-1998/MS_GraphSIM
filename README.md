## MS-GraphSIM: Inferring Point Cloud Quality via Multiscale Graph Similarity
MS-GraphSIM is an objective metric for point cloud quality assessment. This full-reference metric is a multiscale metric that correlates well with human visual characteristics.

Before running Ms_GraphSIM, please install GSPbox first (https://github.com/epfl-lts2/gspbox) 
We upload a version of GSPbox, please use gspbox-master.zip, different versions might cause BUG.
### Resampling 
```
Demo_fast_make.m
```
### MS_GraphSIM
Please use "point cloud sample.7z" to get the sample, including the reference point cloud, the distorted point cloud and the resampled keypoints. To get the quality score,
```markdown
MS_GraphSIM.m
```

