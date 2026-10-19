%% 空间密度热力图函数 plot_density_heatmap.m
function plot_density_heatmap(asteroids)
    % 网格设置
    x_edges = linspace(-2e11, 2e11, 50);
    y_edges = linspace(-2e11, 2e11, 50);
    
    % 统计密度
    pos = reshape([asteroids.pos], 2, [])';
    N = histcounts2(pos(:,1), pos(:,2), x_edges, y_edges);
    
    % 绘图
    figure;
    imagesc(flipud(N'));
    colormap(hot);
    colorbar;
    title('Spatial Density Distribution');
    xlabel('X Grid');
    ylabel('Y Grid');
    axis image;
    
    % 坐标轴标注
    xticks(linspace(1,50,5));
    xticklabels(arrayfun(@num2str, linspace(-2e11,2e11,5), 'UniformOutput',false));
    yticks(linspace(1,50,5));
    yticklabels(arrayfun(@num2str, linspace(2e11,-2e11,5), 'UniformOutput',false));
end