clear all;
global data grid stat cluster
Eps = 80;
density = 1000000;
    
set(0,'RecursionLimit',5000);
%产生数据
data = SampleGenerator(density);
figure(1);
plot(data(:, 1), data(:, 2), '.');
%view([90 90]);

%网格化
grid = GridSpace(data, 100); %分成100格

%统计
stat = zeros(max(grid(:, 1)), max(grid(:, 2)));
for i=1: size(data, 1)
    stat(grid(i, 1), grid(i, 2)) = stat(grid(i, 1), grid(i, 2)) + 1;
end

%定义聚类的值
cluster = zeros(size(stat));
cluster_num = 0;

%删去噪声点
noise_threshold = 10; %噪声簇的阈值
cluster_num = cluster_num + 1;
AddIntoCluster(cluster_num, stat<=noise_threshold);

%聚类
while true
    [PT, T_index] = max(stat(:));
    if PT == -1
        break;
    end
    cluster_num = cluster_num + 1;
    AddIntoCluster(cluster_num, T_index);
    gather(cluster_num, PT, Eps, T_index);
end

figure(2);
A = imagesc(rot90(cluster));

% figure(3);
% colorb = random('unif', 0, 1, [cluster_num, 3]);
% cc = colorb(cluster(grid(:, 1), grid(:, 2)), :);
% clear cluster grid stat
% plot(data(:, 1), data(:, 2), '.', 'Color', cc);