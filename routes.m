clc,clear

%calling the script with a clen dataset

cleaning_dataset_chicago;

% This is the main script of the program, which is user interactive and
% presents the best time on the basis of the route selection.

% initializing variables

best_speed = 0;             % maximum speed
best_day = 0;               % the day whne the speed was maximum
best_hour = 0;              % the hour of the day when the speed was maximum
best_month = 0;             % the month where the speed was maximum
n=1;                        % counter
count_speed_route1 = 0;     % counter to find when the speed is zero
best_day_1 = '';            % converting numerical value of day to day of week
best_month_1 = '';          % converting numerical value of month to the alphabetic value

% creating a menu for easier use

fprintf("Welcome! Here are the routes we have information for:" + ...
    "\n1. 119th to 91st. Ashland to Stony Island" + ...
    "\n2. 119th to 91st. Cicero to Ashland" + ...
    "\n3. 119th to 91st. Stony Island to State Line" + ...
    "\n4. 138th to 119th. Ashland to State Line"+...
    "\n5. 71st to Pershing. Cicero to Western"+...
    "\n6. 71st to Pershing. Cottage Grove to Lake Shore"+...
    "\n7. 71st to Pershing. Halem to Cicero"+...
    "\n8.71st to Pershing. Steward to Cottage Grove" + ...
    "\n9. 71st to Pershing. Western to Steward" + ...
    "\n10. 91st to 71st. Cicero to Damen" + ...
    "\n11. 91st to 71st. Cottage Grove to Lake Shore"+ ...
    "\n12. 91st to 71st. Damen to Cottage Grove"+ ...
    "\n13. Diversey to Montrose. Cicero to Ravenswood" + ...
    "\n14. Montrose to Devon. Cicero to Ravenswood" + ...
    "\n15. Montrose to Devon. Ravenswood to Lake Shore" + ...
    "\n16. North Ave to Diversy. Cicero to Ravenswood" + ...
    "\n17. North Ave to Montrose. East River to Cicero" + ...
    "\n18. North Ave to Montrose. Ravenswood to Lake Shore" + ...
    "\n19. North of Devon. Kedzie to Lake Shore" + ...
    "\n20. North of Montrose. East River to Cicero" + ...
    "\n21. Pershing to Roosevel. Cicero to Western" + ...
    "\n22. Pershing to Roosevel. Western to Stewart"+ ...
    "\n23. Pershing to Roosevelt. Stewart to Lake Shore" + ...
    "\n24. Roosevelt to North Ave. Austin to Cicero" + ...
    "\n25. Roosevelt to North Ave. Cicero to Rockwell" + ...
    "\n26. Roosevelt to North. Rockwell to Halsted" + ...
    "\n27. Roosevelt to Oak. Michigan to Lake Shore" + ...
    "\n28. Roosevelt to Wacker: Halsted to Michigan" + ...
    "\n29. Wacker to North. Halsted to  Michigan\n") ;

% main while loop to keep the code running until the user desires

while n>0

route = input("\nPlease enter the route whose information you require: ", 's');

% Creating a new table for the user's choice of route

Chicago_route1 = ChicagoTrafficTrack(ChicagoTrafficTrack.DESCRIPTION == route,:);

% Finding the number of places where the speed recieved is zero hence eliminating 
% them from checking through those rows for maximum speed and minimum traffic 

for i = 1: length(Chicago_route1.NUM_READS)
        if Chicago_route1.SPEED(i) == 0
            count_speed_route1 = count_speed_route1+1;            
        end
end

fprintf("\nThere are %.0f places where the car is at a stop light.", count_speed_route1);

Chicago_route1(Chicago_route1.SPEED == 0, :) = [];

% finding the minimum gps probes recieved

min_traffic_route1 = min(Chicago_route1.NUM_READS);

for i = 1:length(Chicago_route1.NUM_READS)
    
    if (Chicago_route1.NUM_READS(i) == min_traffic_route1) 
        new = Chicago_route1(Chicago_route1.NUM_READS == min_traffic_route1, :);
        
% finding the maximum speed where the gps probes recieved are minimum

        for j = 1:length(new.SPEED)

            if new.SPEED(j) == max(new.SPEED)

                best_speed = new.SPEED(j);
                
                best_hour = new.HOUR(j);
                
                best_day = new.DAY_OF_WEEK(j);
                best_day_1 = num2day(best_day);
                
                best_month = new.MONTH(j);
                best_month_1 = num2month(best_month);
                
                
            end
        end
   end
end

fprintf("\nThe best time to travel the route %s is at %0.f hour of %s in the month of %s with an average speed of %.0f mph\n",route,best_hour,best_day_1,best_month_1, best_speed);
n1 = input("\nWould you like to see graphs or try a different route? \nEnter 1 for graphs and 2 for another route and 3 to exit: ");

if n1 == 1
    figure(1)
    histogram2(new.NUM_READS, new.HOUR)
    title("Traffic in route vs hour of the day")
    figure(2)
    histogram2(new.NUM_READS, new.DAY_OF_WEEK)
    title("Traffic in route vs day of the week")
    figure(3)
    histogram2(new.NUM_READS, new.MONTH)
    title("Traffic in route vs month")

    n = input("\nWould you like to know more information about some other routes?\nEnter 1 for yes and 0 for no: ");
    
elseif n1 == 2
    n = input("\nWould you like to know more information about some other routes?\nEnter 1 for yes and 0 for no: ");
elseif n1 == 3
    n=0;
else
    disp("Wrong input!");
    n = input("\nWould you like to know more information about some other routes?\nEnter 1 for yes and 0 for no: ");
    
end

end

fprintf("\nTerminating Program. Goodbye!\n");