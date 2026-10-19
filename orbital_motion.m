function asteroids = orbital_motion(asteroids, dt)
    G = 6.67430e-11;          % 万有引力常数
    M_sun = 1.989e30;         % 太阳质量
    
    for i = 1:length(asteroids)
        % 当前天体参数
        pos = asteroids(i).pos;
        r = norm(pos);  % 轨道半径
        
        % 计算理论轨道速度（保持圆周运动）
        v_theory = sqrt(G*M_sun/r) * [-pos(2)/r, pos(1)/r]; % 切向速度
        
        % 强制修正速度为理论值（抑制轨道漂移）
        asteroids(i).vel = v_theory;
        
        % 更新位置（角度累加）
        theta = atan2(pos(2), pos(1)) + (v_theory(1)*pos(2) - v_theory(2)*pos(1))/(r^2) * dt;
        asteroids(i).pos = r * [cos(theta), sin(theta)];
    end
end