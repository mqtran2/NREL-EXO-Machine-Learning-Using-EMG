% 10-02-08 AC Added code to downsampled the myoelectric signals from 3000
%             Hz to 1000 Hz
% 09-10-06 AC Added filter to remove motion artifact and high frequency
%             noise
% 09-10-06 AC Added code to remove resting state from the start and end of
%             the files
function [data,motion,start_index] = load_data(subject_id)

data_dir = 'data\';
data_filename = [data_dir subject_id 'data.daq'];
index_filename = [data_dir subject_id 'index.mat'];
data = daqread(data_filename);

% resample from 3000 Hz to 1000 Hz
[b,a] = butter(3,[20 450]/500); % filter between 10 and 400 Hz
data = filtfilt(b,a,data);


load(index_filename);

% resample from 3000 Hz to 1000 Hz
% clip the resting data from the start and end of the files

