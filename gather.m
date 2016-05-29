function gather(cluster_num, PT, Eps, T_index)
    global data grid stat cluster
    [Ti, Tj] = ind2sub(size(stat), [T_index]);
    
    if Ti-1 >= 1 && Tj-1 >= 1   %����
        PR = stat(Ti-1, Tj-1);
        R_index = sub2ind(size(stat), Ti-1, Tj-1);
        if PR>=0 
            AddIntoCluster(cluster_num, R_index);
            if PR>=PT-Eps
                gather(cluster_num, PT, Eps, R_index);
            end
        end
    end
    
    if Ti-1 >= 1   %��
        PR = stat(Ti-1, Tj);
        R_index = sub2ind(size(stat), Ti-1, Tj);
        if PR>=0 
            AddIntoCluster(cluster_num, R_index);
            if PR>=PT-Eps
                gather(cluster_num, PT, Eps, R_index);
            end
        end
    end
    
    if Ti-1 >= 1 && Tj+1<=size(stat, 2)   %����
        PR = stat(Ti-1, Tj+1);
        R_index = sub2ind(size(stat), Ti-1, Tj+1);
        if PR>=0 
            AddIntoCluster(cluster_num, R_index);
            if PR>=PT-Eps
                gather(cluster_num, PT, Eps, R_index);
            end
        end
    end
    
    if Tj-1 >= 1   %��
        PR = stat(Ti, Tj-1);
        R_index = sub2ind(size(stat), Ti, Tj-1);
        if PR>=0 
            AddIntoCluster(cluster_num, R_index);
            if PR>=PT-Eps
                gather(cluster_num, PT, Eps, R_index);
            end
        end
    end
    
    if Tj+1 <= size(stat, 2)  %��
        PR = stat(Ti, Tj+1);
        R_index = sub2ind(size(stat), Ti, Tj+1);
        if PR>=0 
            AddIntoCluster(cluster_num, R_index);
            if PR>=PT-Eps
                gather(cluster_num, PT, Eps, R_index);
            end
        end
    end
    
    if Ti+1 <= size(stat, 1) && Tj-1 >= 1   %����
        PR = stat(Ti+1, Tj-1);
        R_index = sub2ind(size(stat), Ti+1, Tj-1);
        if PR>=0 
            AddIntoCluster(cluster_num, R_index);
            if PR>=PT-Eps
                gather(cluster_num, PT, Eps, R_index);
            end
        end
    end
    
    if Ti+1 <= size(stat, 1)   %��
        PR = stat(Ti+1, Tj);
        R_index = sub2ind(size(stat), Ti+1, Tj);
        if PR>=0 
            AddIntoCluster(cluster_num, R_index);
            if PR>=PT-Eps
                gather(cluster_num, PT, Eps, R_index);
            end
        end
    end
    
    if Ti+1 <= size(stat, 1) && Tj+1 <= size(stat, 2)  %����
        PR = stat(Ti+1, Tj+1);
        R_index = sub2ind(size(stat), Ti+1, Tj+1);
        if PR>=0 
            AddIntoCluster(cluster_num, R_index);
            if PR>=PT-Eps
                gather(cluster_num, PT, Eps, R_index);
            end
        end
    end
end
