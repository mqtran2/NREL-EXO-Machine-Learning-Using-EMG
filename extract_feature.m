function feature = extract_feature(data,win_size,win_inc)

if nargin < 3
    if nargin < 2
        win_size = 256;
    end
    win_inc = 32;
end

[Ndata,Nsignal] = size(data);

feature1 = getrmsfeat(data,win_size,win_inc);

ar_order = 4;
feature2 = getarfeat(data,ar_order,win_size,win_inc);

deadzone = 0;
feature3 = getzcfeat(data,deadzone,win_size,win_inc);

feature4 = getiavfeat(data,win_size,win_inc);

feature5 = getmavfeat(data,win_size,win_inc);

feature6 = getwlfeat(data,win_size,win_inc);
feature = [feature1 feature2 feature6];
