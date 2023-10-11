function [data] = sleap_impute_nans(sleap_dat, colname)

% Sample data with NaN values
data = sleap_dat{:, colname};

% Find indices of NaN values
nan_indices = find(isnan(data));

% Find indices of non-NaN values
non_nan_indices = find(~isnan(data));

% Interpolate missing values
for i = 1:length(nan_indices)
    % Get the index of the missing value
    idx = nan_indices(i);
    
    % Find neighboring non-NaN indices
    prev_idx = find(non_nan_indices < idx, 1, 'last');
    next_idx = find(non_nan_indices > idx, 1, 'first');
    
    % If both neighbors are available, interpolate
    if ~isempty(prev_idx) && ~isempty(next_idx)
        x = [non_nan_indices(prev_idx), non_nan_indices(next_idx)];
        y = [data(x(1)), data(x(2))];
        data(idx) = interp1(x, y, idx);
    elseif ~isempty(prev_idx)  % If only the previous neighbor is available, use its value
        data(idx) = data(non_nan_indices(prev_idx));
    elseif ~isempty(next_idx)  % If only the next neighbor is available, use its value
        data(idx) = data(non_nan_indices(next_idx));
    end
end

end