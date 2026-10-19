%% 碰撞处理 process_collisions.m

function [new_astro, merges] = process_collisions(asteroids, pairs)
    merged = [];
    new_astro = asteroids;
    merges = 0;
    
    for p = 1:size(pairs,1)
        i = pairs(p,1);
        j = pairs(p,2);
        
        if ~ismember(i, merged) && ~ismember(j, merged)
            % 动量守恒合并
            m1 = new_astro(i).mass;
            m2 = new_astro(j).mass;
            v_new = (m1*new_astro(i).vel + m2*new_astro(j).vel)/(m1+m2);
            
            % 新天体属性
            new_mass = m1 + m2;
            new_radius = (new_mass / asteroids(1).mass)^(1/3) * asteroids(1).radius;
            
            % 更新列表
            new_astro(i) = struct('pos',mean([new_astro(i).pos; new_astro(j).pos]),...
                                 'vel',v_new,...
                                 'mass',new_mass,...
                                 'radius',new_radius);
            merged = [merged, j];
            merges = merges + 1;
        end
    end
    
    % 移除已合并天体
    new_astro(merged) = [];
end