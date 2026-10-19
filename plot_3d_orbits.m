function plot_3d_orbits(history)
    fig3d = figure('Position', [200 200 800 600]);
    ax = axes('Parent',fig3d, 'Projection','perspective');
    grid(ax, 'on'); hold(ax, 'all');
    
    % 绘制太阳
    scatter3(ax, 0,0,0, 300, 'y','filled');
    
    cmap = jet(length(history));
    valid_count = 0;
    
    for i = 1:length(history)
        pos_matrix = history(i).pos;
        
        % 数据有效性检查
        if isempty(pos_matrix) || size(pos_matrix,2)~=2 || size(pos_matrix,1)==0
            continue;
        end
        
        % ★★★ 完全修正的plot3调用 ★★★
        plot3(ax,pos_matrix(:,1),pos_matrix(:,2),i*1e5*ones(size(pos_matrix,1),'Color', cmap(i,:),'LineWidth', 1));             % 线宽设置
        
        valid_count = valid_count + 1;
    end
    
    % 图形标注
    title(ax, '3D轨道演化');
    xlabel(ax, 'X (m)'); 
    ylabel(ax, 'Y (m)');
    zlabel(ax, '时间维度 (×1e5 m)');
    view(ax, 30, 45);
end