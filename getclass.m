function class = getclass(data,motion,index,win_size,win_inc)

Ndata = size(data,1);
index = [index;Ndata];
putvar(index);
class = [];
for i = 1:win_inc:(Ndata - win_size + 1)
    motion_index = find((i + win_size/2) > index);
    
    motion_index = motion_index(length(motion_index));
    class = [class;motion(motion_index)];
    
end    
