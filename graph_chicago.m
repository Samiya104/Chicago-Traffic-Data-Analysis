cleaning_dataset_chicago;


figure("Name","traffic analysis")

histogram(ChicagoTrafficTrack.DESCRIPTION);
title('Route frequency')

figure
histogram2(ChicagoTrafficTrack.SPEED,ChicagoTrafficTrack.HOUR);
title('Speed vs time of the day')

figure
histogram2(ChicagoTrafficTrack.SPEED,ChicagoTrafficTrack.DAY_OF_WEEK);
title('Speed vs day of the week')

figure
histogram2(ChicagoTrafficTrack.SPEED,ChicagoTrafficTrack.MONTH);
title('Speed vs month of the year')

figure
histogram2(ChicagoTrafficTrack.SPEED,ChicagoTrafficTrack.MONTH);
title('Speed vs month of the year')

figure
histogram2(ChicagoTrafficTrack.BUS_COUNT,ChicagoTrafficTrack.HOUR);
title('bus count vs time of the day')

figure
histogram2(ChicagoTrafficTrack.BUS_COUNT,ChicagoTrafficTrack.DAY_OF_WEEK);
title('bus count vs day of the week')

figure
histogram2(ChicagoTrafficTrack.BUS_COUNT,ChicagoTrafficTrack.MONTH);
title('bus count vs month of the year')

figure
histogram2(ChicagoTrafficTrack.NUM_READS,ChicagoTrafficTrack.HOUR);
title('gps probes vs time of the day')

figure
histogram2(ChicagoTrafficTrack.NUM_READS,ChicagoTrafficTrack.DAY_OF_WEEK);
title('gps probes vs day of the week')
figure
histogram2(ChicagoTrafficTrack.NUM_READS,ChicagoTrafficTrack.MONTH);
title('gps probes vs month of the year')


figure
subplot(2,1,1);
scatter(gps_new,speed);
xlabel("GPS probes received")
ylabel("Speed")

subplot(2,1,2);
scatter(traffic,speed);
xlabel("Number of buses")
ylabel("Speed")
