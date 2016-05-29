clear all;
global data grid stat cluster
Eps = 80;
density = 1000000;
    
set(0,'RecursionLimit',5000);
%��������
data = SampleGenerator(density);
figure(1);
plot(data(:, 1), data(:, 2), '.');
%view([90 90]);

%����
grid = GridSpace(data, 100); %�ֳ�100��

%ͳ��
stat = zeros(max(grid(:, 1)), max(grid(:, 2)));
for i=1: size(data, 1)
    stat(grid(i, 1), grid(i, 2)) = stat(grid(i, 1), grid(i, 2)) + 1;
end

%��������ֵ
cluster = zeros(size(stat));
cluster_num = 0;

%ɾȥ������
noise_threshold = 10; %�����ص���ֵ
cluster_num = cluster_num + 1;
AddIntoCluster(cluster_num, stat<=noise_threshold);

%����
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