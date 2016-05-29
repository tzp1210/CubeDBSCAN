function data=SampleGenerator(density)
    %测试数据生成器
    data = zeros(100000, 2);
    data(1:100, :) = random('unif', 0, 100, [100, 2]); %噪声
    num = 100;

    for i=1: 10
        origin = random('unif', 0, 100, [2, 1]);
        radius = random('unif', 0, 20); 
        ndata = CircleGenerator(density, origin, radius);
        data(num+1: num+size(ndata, 1), :) = ndata;
        num = num + size(ndata, 1);
    end
end