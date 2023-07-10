%% Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 17, "Encoding", "UTF-8");

% Specify range and delimiter
opts.DataLines = [1, Inf];
opts.Delimiter = ",";

% Specify column names and types
opts.VariableNames = ["TIME", "REGION_ID", "SPEED", "REGION", "BUS_COUNT", "NUM_READS", "HOUR", "DAY_OF_WEEK", "MONTH", "DESCRIPTION", "RECORD_ID", "WEST", "EAST", "SOUTH", "NORTH", "NW_LOCATION", "SE_LOCATION"];
opts.VariableTypes = ["datetime", "double", "double", "categorical", "double", "double", "double", "double", "double", "categorical", "string", "double", "double", "double", "double", "categorical", "categorical"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Specify variable properties
opts = setvaropts(opts, "RECORD_ID", "WhitespaceRule", "preserve");
opts = setvaropts(opts, ["REGION", "DESCRIPTION", "RECORD_ID", "NW_LOCATION", "SE_LOCATION"], "EmptyFieldRule", "auto");
opts = setvaropts(opts, "TIME", "InputFormat", "MM/dd/yyyy hh:mm:ss aa");
opts = setvaropts(opts, ["REGION_ID", "SPEED", "BUS_COUNT", "NUM_READS", "HOUR", "DAY_OF_WEEK", "MONTH", "WEST", "EAST", "SOUTH", "NORTH"], "ThousandsSeparator", ",");

% Import the data
ChicagoTrafficTrack = readtable("C:\Users\qasmi\OneDrive\Documents\MATLAB\Honors_Project_ENGR128_chicagoo\Chicago_Traffic_Tracker_-_Historical_Congestion_Estimates_by_Region_-_2018-Current.csv", opts);
