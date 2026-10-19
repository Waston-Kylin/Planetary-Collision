%% 简化模型轨道运动函数 orbital_motion_simple.m
function asteroids = orbital_motion_simple(asteroids, dt)
    G = 6.67430e-11;
    M_sun = 1.989e30;
    
    for i = 1:length(asteroids)
        pos = asteroids(i).pos;
        r = norm(pos);
        
        % 理论轨道速度计算
        v_mag = sqrt(G*M_sun/r);
        theta = atan2(pos(2), pos(1));
        v_dir = [-sin(theta), cos(theta)]; % 切向方向
        
        % 更新位置（保持圆形轨道）
        new_theta = theta + v_mag/r * dt;
        asteroids(i).pos = r * [cos(new_theta), sin(new_theta)];
        asteroids(i).vel = v_mag * v_dir;
    end
end