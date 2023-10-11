%%


clf
% Visualize Sleap
x_h = sleap_dat{:, 'head_x'};
y_h = sleap_dat{:, 'head_y'};

x_t = sleap_dat{:, 'tail_base_x'};
y_t = sleap_dat{:, 'tail_base_y'};

% scatter(x_h, y_h);
% hold on
% scatter(x_t, y_t);
% hold on
plot([x_h, x_t], [y_h, y_t]);

xlim([0, 1184])
ylim([0, 696])

%%
for ii = 1:length(sleap_dat{:,1})

    cla

    x_h = sleap_dat{ii, 'head_x'};
    y_h = sleap_dat{ii, 'head_y'};
    x_t = sleap_dat{ii, 'tail_base_x'};
    y_t = sleap_dat{ii, 'tail_base_y'};

    plot([x_h, x_t], [y_h, y_t]);
    hold on
    scatter(x_h, y_h, 'filled');
    hold on
    scatter(x_t, y_t, 'filled');  

    xlim([0, 1184])
    ylim([0, 696])
    pause(.0016)
end

%%

% Sample data
%x = linspace(0, 4*pi, 100);
%y = sin(x);

% Calculate the change between adjacent y-values
delta_y = diff(y);

% Normalize the change to be between 0 and 1 for coloring
normalized_delta_y = (delta_y - min(delta_y)) / (max(delta_y) - min(delta_y));

% Create a new figure
figure;

% Hold the plot to add multiple line segments
hold on;

% Loop through the data points to plot individual line segments
for i = 1:length(x) - 1
    % Determine the color based on the normalized change in y-value
    color = [0, normalized_delta_y(i), 1 - normalized_delta_y(i)];
    
    % Plot the line segment between adjacent points with the determined color
    plot(x(i:i+1), y(i:i+1), 'Color', color, 'LineWidth', 2);
end

% Release the hold on the plot
hold off;

% Add labels and title
xlim([0, 1184])
ylim([0, 696])

xlabel('X-axis');
ylabel('Y-axis');
title('Line Color Based on Change in Y-Value');
