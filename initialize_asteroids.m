function [asteroids] = initialize_asteroids(N, R_orbit)
    asteroids = struct('pos',[], 'vel',[], 'mass',[], 'radius',[]);
    std_vel = sqrt(6.67e-11 * 1.989e30 / R_orbit); % 轨道速度
    
    for i = 1:N
        theta = 2*pi*rand();
        r = R_orbit + 0.1*R_orbit*(rand()-0.5); % 允许±5%轨道偏离
        asteroids(i).pos = [r*cos(theta), r*sin(theta)];
        asteroids(i).vel = [-std_vel*sin(theta), std_vel*cos(theta)];
        asteroids(i).mass = 1e20; % 基本质量
        asteroids(i).radius = 1e5; % 基本半径
    end
end