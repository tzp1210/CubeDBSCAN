function data=CircleGenerator(density, origin, radius)
    %生成圆形数据
    raw_data = random('unif', 0, 100, [density, 2]);

    data = zeros(density, 2);
    num=0;
    for i=1: density
        if ((raw_data(i, 1)-origin(1))^2 + (raw_data(i, 2)-origin(2))^2) <= radius^2
            num = num + 1;
            data(num, :) = raw_data(i, :);
        end
    end
    data = data(1:num, :);
end