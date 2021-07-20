function [G1, pointset2, weight1] = graphSample_os_1(G, pointset, center, weight, radius, r_b, r_s)
% tic;
% clearvars -except G pointset center radius weight


% k = 1;
% figure(1)
% scatter3(pointset(:,1),pointset(:,2),pointset(:,3));


N = G.N;
W = full(G.W);
A = full(G.A);

center_index = find(ismember(pointset(:,1:3),center(1,1:3),'rows')==1);
center_info = pointset(center_index(1),:);

% 
% figure(1)
% scatter3(pointset(:,1),pointset(:,2),pointset(:,3));


pointset_temp = [pointset, (1:N)'];
pointset_temp = unique(pointset_temp,'rows');
keep_index = pointset_temp(1:2:N,7);
pointset1 = pointset(keep_index,:);
pointset1 = unique([pointset1;center_info],'rows');


pointset1_coor = pointset1(:,1:3);
pointset1_color = pointset1(:,4:6);

center_coor = center_info(1:3);
center_coor_repeat = repmat(center_coor, size(pointset1,1), 1);
pointset2_coor = power(0.5,r_s)*(pointset1_coor - center_coor_repeat)+center_coor_repeat;
pointset2 = [pointset2_coor, pointset1_color];


[idx,dit] = knnsearch(pointset2(:,1:3), center(1,1:3), 'k', size(pointset2,1), 'distance', 'euclidean');
r1 =  radius/r_b;
sigma = r1^2/2;
weight0 = exp(-dit.^2/sigma);
for m = 1:size(pointset2,1)
    weight1(1,idx(m))= weight0(m);
end
center_index = find(ismember(pointset2(:,1:3),center(1,1:3),'rows')==1);
weight1(1,center_index(1)) = 0;
    
param.type = 'radius';
param.epsilon = radius;
param.sigma = sigma;
G1 = gsp_nn_graph(pointset2(:,1:3), param);

% figure(2)
% scatter3(pointset2(:,1),pointset2(:,2),pointset2(:,3));
% toc;
