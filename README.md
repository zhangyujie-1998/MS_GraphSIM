## MS-GraphSIM: Inferring Point Cloud Quality via Multiscale Graph Similarity
MS-GraphSIM is an objective metric for point cloud quality assessment. This full-reference metric is a multiscale metric that correlates well with human visual characteristics.

Before running MS_GraphSIM, please install GSPbox first (https://github.com/epfl-lts2/gspbox) 
We upload a version of GSPbox, please use gspbox-master.zip, different versions might cause BUG.

### MS_GraphSIM
Please unzip "point cloud sample.7z". Then run
```markdown
MS_GraphSIM.m
```
The output is the quality score for the distorted point cloud “redandblack_0_0.ply”.
