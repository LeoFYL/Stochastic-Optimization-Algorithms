% MainScript.m

% 2. 画出轮廓图
[x1, x2] = meshgrid(-5:0.1:5, -5:0.1:5);
z = log(0.01 + (x1.^2 + x2 - 11).^2 + (x1 + x2.^2 - 7).^2);
contour(x1, x2, z);
title('Contour Plot');
xlabel('x1');
ylabel('x2');



% 3. 使用PSO找到最小值
minima = RunPSO();
disp(minima);
