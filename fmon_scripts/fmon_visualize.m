%% Load Session
mouseid = 2194;
session = 11;

[sniff_dat, poke_dat] = load_nidaq(mouseid, session);
[sleap_dat] = load_sleap(mouseid, session);
S = load_bpod(mouseid, session);

%% Preferences

preview_raw = false;
preview_log = false;

%% Preview Raw Data

if preview_raw == true

    % Pokes
    plot(poke_dat(1,1:200000), 'DisplayName', 'Left')
    hold on
    plot(poke_dat(2,1:200000), 'DisplayName', 'Right')
    hold on
    plot(poke_dat(3,1:200000), 'DisplayName', 'Init.')
    hold on
    
    % Final Valves
    plot(sniff_dat(3,1:200000), 'DisplayName', 'Final Valves')
    
    legend('show');

end



%% Preview logical vectors

%if preview_log == true
    cla

    % Looking at event alignment between Bpod and Bonsai
    scatter(bpod_pokes(1:13), .5, 'DisplayName', 'Bpod Pokes');
    hold on
    % scatter(fv_transitions(1:5), .5, 'DisplayName', 'FV Open');
    % hold on

    plot(final_vlv(1:200000) * .5, 'DisplayName', 'FV')
    hold on
    
    % Poke Activity
    plot(left_poke(1:200000), 'DisplayName', 'Left')
    hold on
    plot(right_poke(1:200000), 'DisplayName', 'Right')
    hold on
    plot(init_poke(1:200000) * .25, 'DisplayName', 'Init.')
    hold on

    plot(iti_logical(1:200000) * .25, 'DisplayName', 'ITI')
    legend('show');

    plot(trial_outcome(1:200000) * 1.25, 'DisplayName', 'Correct')
    legend('show');

    plot(trial_type(1:200000) * 1, 'DisplayName', 'Trial Type')
    legend('show');
%end

%% Get timestamps



%% Build Trial Summarry
% n = S.session_data.nTrials;
% trialcount = (1:n)';
% start_time = zeros(1, n)';
% end_time = zeros(1, n)';
% iti_times = zeros(1, n)';
% 
% % Vectors for trial initiation and end timestamp
% for ii = 1:n
%     iti_bgn = session_data.RawEvents.Trial{1, ii}.States.ITI(1);
%     iti_end = session_data.RawEvents.Trial{1, ii}.States.ITI(2);
% end
% 
% 
% % Loop through trials and count only if event was triggered (is not NaN)
%     for ii = 1:length(trialtypes)
%         if ~isnan(session_data.RawEvents.Trial{1, ii}.States.GoLeft)
%             left_total = left_total + 1;
%             if ~isnan(session_data.RawEvents.Trial{1, ii}.States.CorrectLeft)
%                 left_correct = left_correct + 1;
%             end
%         end
%         if ~isnan(session_data.RawEvents.Trial{1, ii}.States.GoRight)
%             right_total = right_total + 1;
%             if ~isnan(session_data.RawEvents.Trial{1, ii}.States.CorrectRight)
%                 right_correct = right_correct + 1;
%             end
%         end
%     end

%%

