 function pointset1 = graphBlur(G, pointset)
%      clearvars -except G pointset
   
W = full(G.W);
D = diag(G.d);
N = G.N;

weight = zeros(N);
pointset_coor = pointset(:,1:3);
pointset_color = pointset(:,4:6);
if ~ismember(0,G.d)
    weight = 0 * eye(N) + 1 * diag(1./G.d) * W;
else
    zero_index = find(G.d == 0);
    for i = 1:N
        if ~ismember(i, zero_index)
            weight(i,:) = 1 * 1/G.d(i) * W(i,:);
            weight(i,i) = 0;
        else
            weight(i,:) = W(i,:);
            weight(i,i) = 1;
        end
    end
end

pointset_color1 = single(weight * pointset_color);
pointset1 = [pointset_coor, pointset_color1];

    
        
    
    

