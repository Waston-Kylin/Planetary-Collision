function asteroids = orbital_motion_full(asteroids, dt)
    G = 6.67430e-11;
    M_sun = 1.989e30;
    
    % 第一步：计算加速度
    acc = zeros(length(asteroids), 2);
    for i = 1:length(asteroids)
        pos_i = asteroids(i).pos;
        r = norm(pos_i);
        acc(i,:) = -G*M_sun/r^3 * pos_i;
    end
    
    % 第二步：更新速度和位置
    for i = 1:length(asteroids)
        % 更新速度（半隐式欧拉）
        asteroids(i).vel = asteroids(i).vel + acc(i,:) * dt;
        
        % 更新位置
        asteroids(i).pos = asteroids(i).pos + asteroids(i).vel * dt;
    end
end