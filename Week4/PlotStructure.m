%# date strings and values
dates = {'02.11.2012 00:02:15'; '02.11.2012 00:07:12'};
values = [5.8; 5.7];

%# convert to serial date numbers
t = datenum(dates, 'mm.dd.yyyy HH:MM:SS');

%# plot and format x-ticks as datetime
plot(t,values)
datetick('x')
%%
http://stackoverflow.com/questions/15851793/matlab-plotting-data-from-struct