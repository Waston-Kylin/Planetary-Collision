function [asteroids, params] = initialize_asteroids1(sim_params)
    params = struct();
    G = 6.67430e-11;
    M_sun = 1.989e30;
    std_vel = sqrt(G*M_sun/sim_params.R_orbit);
    
    asteroids = struct('pos', [], 'vel', [], 'mass', [], 'radius', []);
    
    % 生成初始位置
    theta = linspace(0, 2*pi, sim_params.N);
    switch sim_params.distribution
        case 'uniform'
            r = sim_params.R_orbit * ones(1, sim_params.N);
        case 'gaussian'
            r = sim_params.R_orbit + 0.1*sim_params.R_orbit*randn(1, sim_params.N);
        case 'fractal'
            r = sim_params.R_orbit * (1 + 0.2*rand(1, sim_params.N).*sin(5*theta));
    end
    
    for i = 1:sim_params.N
        asteroids(i).pos = [r(i)*cos(theta(i)), r(i)*sin(theta(i))];
        asteroids(i).vel = [-std_vel*sin(theta(i)), std_vel*cos(theta(i))];
        asteroids(i).mass = 1e20; 
        asteroids(i).radius = 1e5;
    end
end