function show_dynamics(asteroids, step, log)
    % 参数设置
    persistent fig ax1 ax2 ax3;
    if isempty(fig) || ~isvalid(fig)
        fig = figure('Position', [100 100 1200 800]);
        ax1 = subplot(2,2,[1,3]);
        ax2 = subplot(2,2,2);
        ax3 = subplot(2,2,4);
    end
    
    % 子图1：轨道分布
    cla(ax1);
    theta = 0:0.01:2*pi;
    plot(ax1, 1.5e11*cos(theta), 1.5e11*sin(theta), 'k--');
    hold(ax1, 'on');
    
    colors = jet(length(asteroids));
    mass_ratio = [asteroids.mass]/max([asteroids.mass]);
    
    for i = 1:length(asteroids)
        pos = asteroids(i).pos;
        scatter(ax1, pos(1), pos(2), 80*mass_ratio(i), colors(i,:), 'filled',...
            'MarkerEdgeColor','k');
    end
    title(ax1, sprintf('Step %d: %d Remaining', step, length(asteroids)));
    axis(ax1, 'equal');
    set(ax1, 'XLim', [-2e11 2e11], 'YLim', [-2e11 2e11]);
    
    % 子图2：质量分布直方图
    cla(ax2);
    masses = [asteroids.mass]/1e20;
    histogram(ax2, masses, 'BinWidth', 5, 'FaceColor', [0.2 0.6 0.8]);
    xlabel(ax2, 'Mass (1e20 kg)');
    ylabel(ax2, 'Count');
    title(ax2, 'Mass Distribution');
    grid(ax2, 'on');
    
    % 子图3：合并过程曲线
    cla(ax3);
    days = log.t/86400;
    plot(ax3, days, log.N, 'b-o', 'LineWidth',1.5);
    xlabel(ax3, 'Time (days)');
    ylabel(ax3, 'Number of Bodies');
    title(ax3, 'Aggregation Process');
    grid(ax3, 'on');
    set(ax3, 'YScale','log');
    
    drawnow;
end