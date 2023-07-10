dataset_chicago;

% initializing variables

speed = ChicagoTrafficTrack.SPEED;
gps = ChicagoTrafficTrack.NUM_READS;
count_gps = 0;
day = ChicagoTrafficTrack.DAY_OF_WEEK;
traffic = ChicagoTrafficTrack.BUS_COUNT;
speed = ChicagoTrafficTrack.SPEED;
gps_new = ChicagoTrafficTrack.NUM_READS;
day_week = '';
count_day = 0;

% finding and elimintaing rows with unidentifiable gps probes recieved

for i = 1:length(gps)
    if gps(i)==0 || isnan(gps(i))
        count_gps = count_gps+1;
    end
end

ChicagoTrafficTrack(gps == 0, :) = [];

