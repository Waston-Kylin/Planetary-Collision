function neighbors = get_neighbor_cells(current_cell)
% 获取当前网格单元的邻近9宫格坐标（包含自身）
% 输入：current_cell = [x, y] 当前单元坐标
% 输出：neighbors = N×2矩阵，包含所有相邻单元坐标

dx = [-1, 0, 1];
dy = [-1, 0, 1];
[X, Y] = meshgrid(current_cell(1)+dx, current_cell(2)+dy);
neighbors = [X(:), Y(:)];
end