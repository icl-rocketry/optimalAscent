clear vars;
figure(1)
clf(1)

h = (0:100:5000)';

for day = 1:366
    
    
    
    lat = 32.9904*ones(size(h));
    long = -106.9750*ones(size(h));
    
    wind = atmoshwm(lat,long,h,'day',day*ones(size(h)));
    
    windstore(:,day) = sqrt(wind(:,1).^2 + wind(:,2).^2);
    
    %figure(1);
    %hold on
    %plot(wind(:,1), h, '--')
    %plot(wind(:,2), h, ':')
    %plot(sqrt(wind(:,1).^2+wind(:,2).^2), h)
end

xlabel('Wind Speed (m/s)')
ylabel('Altitude (m)')

%%
figure(1)
for hi =1:length(h)
    
    wind_mean(hi) = mean(windstore(hi,:));
    wind_median(hi) = median(windstore(hi,:));
    wind_min(hi) = min(windstore(hi,:));
    wind_max(hi) = max(windstore(hi,:));
    wind_25(hi) = quantile(windstore(hi,:),0.25);
    wind_75(hi) = quantile(windstore(hi,:),0.75);
    
end


figure(1);
clf
hold on
plot(wind_mean,h, 'r')
plot(wind_median,h,'k.')
plot(wind_min,h,'b')
plot(wind_max,h,'b')
for hi =1:length(h)
    plot([wind_25(hi), wind_75(hi)],[h(hi), h(hi)],'k')
end
%plot(wind_25,h)
%plot(wind_75,h)




