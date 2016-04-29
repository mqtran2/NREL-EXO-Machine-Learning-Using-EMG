function  EMG(a)
putvar(a);
[data,time] = daqread(a);
putvar(data);
putvar(time);
%% filter
DataSet = data;
Ntotal = size(DataSet,1); % DataSet: the raw EMG data
Nsig = size(DataSet,2);
DataSet = DataSet - ones(Ntotal,1)*mean(DataSet);
[b,a] = butter(8,[300/500 450/500],'bandpass');   
DataSet_processed = filtfilt(b,a,DataSet);
New_Ntotal = size(DataSet_processed,1);
time_processed = [1:New_Ntotal]';
putvar(DataSet_processed);
%% plot 
emg = DataSet_processed;
putvar(DataSet_processed);
putvar(time_processed);
figure
% Set the plot line color.
colors={'r','b','k','g','c','r','b','k','g','c','r','b','k','g','c','r'};
% Loop through all 16 EMG channels and plot on the same figure.
for ii=1:16
plot(time, emg(:,ii)-(ii-1)*0.3,colors{ii})

hold on
end
%% slide

win_size = 256;
win_inc = 128;
i=1;
j=0;
while  New_Ntotal-i>win_size
    t_temp = i:(i+win_size-1) ;
     j=j+1;
     i=i+win_inc;
end
putvar(j);
%}
end