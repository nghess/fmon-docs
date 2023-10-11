function [sleap_csv] = load_sleap(mouse_id, session)
    
    % 100-0 condition
    %path = "S:/fmon_data/" + num2str(mouse_id) + "/100-0/" + num2str(session) + "/";
    % Prelim SLEAP analysis CSVs
    filename = "S:/fmon_sleap/predictions/csv/mouse_" + num2str(mouse_id) + "_session_" + num2str(session) + ".analysis.csv";
    
    %% Load sleap CSV
    sleap_csv = readtable(filename);

end