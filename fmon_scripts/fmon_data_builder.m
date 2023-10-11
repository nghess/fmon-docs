mouse_id = 2194;
session = 11;

% Load Nidaq Data
[sniff_dat, poke_dat] = load_nidaq(mouse_id, session);

% Load Bpod Session Data Struct
S = load_bpod(mouse_id, session);
