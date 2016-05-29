function AddIntoCluster(cluster_num, index)
    global cluster stat
    cluster(index) = cluster_num;
    stat(index) = -1;
end