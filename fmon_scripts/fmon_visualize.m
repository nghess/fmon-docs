%% Preview FMON Data

cla

% Sniff Signal resampled to 80hz
plot(FMON_data.sniff_signal(1:20000) * 2, 'DisplayName', 'Sniff')
hold on

% Final Valve Toggle
plot(FMON_data.odor(1:20000) * .5, 'DisplayName', 'Odor')
hold on

% Poke Activity
plot(FMON_data.left_poke(1:20000), 'DisplayName', 'Left Poke')
hold on
plot(FMON_data.right_poke(1:20000), 'DisplayName', 'Right Poke')
hold on
plot(FMON_data.init_poke(1:20000) * .25, 'DisplayName', 'Init. Poke')
hold on

% ITI True/False
plot(FMON_data.iti(1:20000) * .25, 'DisplayName', 'ITI')
legend('show');

% Correct/Incorrect
plot(FMON_data.trial_correct(1:20000) * 1, 'DisplayName', 'Correct')
legend('show');

% 1=Left, 2=Right, 3=Omit
plot(FMON_data.trial_type(1:20000) * 1, 'DisplayName', 'Trial Type')
legend('show');

