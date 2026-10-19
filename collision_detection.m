%% 碰撞检测 collision_detection.m（使用空间网格优化）

function [pairs] = collision_detection(asteroids, threshold)
    grid_size = 2*threshold;
    grid = containers.Map();
    
    % 空间网格索引
    for i = 1:length(asteroids)
        pos = asteroids(i).pos;
        key = [floor(pos(1)/grid_size), floor(pos(2)/grid_size)];
        if isKey(grid, num2str(key))
            grid(num2str(key)) = [grid(num2str(key)), i];
        else
            grid(num2str(key)) = [i];
        end
    end
    
    % 邻近检测
    pairs = [];
    keys = grid.keys();
    for k = 1:length(keys)
        cells = str2num(keys{k});
        neighbors = get_neighbor_cells(cells);
        
        % 本cell内检测
        indices = grid(keys{k});
        for i = 1:length(indices)
            for j = i+1:length(indices)
                if norm(asteroids(indices(i)).pos - asteroids(indices(j)).pos) < threshold
                    pairs = [pairs; indices(i), indices(j)];
                end
            end
        end
        
        % 相邻cell检测
        for n = 1:size(neighbors,1)
            if isKey(grid, num2str(neighbors(n,:)))
                other_indices = grid(num2str(neighbors(n,:)));
                for i = indices
                    for j = other_indices
                        if norm(asteroids(i).pos - asteroids(j).pos) < threshold
                            pairs = [pairs; i, j];
                        end
                    end
                end
            end
        end
    end
end