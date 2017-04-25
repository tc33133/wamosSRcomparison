function CDIPFile = importCDIP(filename)
%% Initialize variables.
delimiter = ' ';

%% Read columns of data as text:
% For more information, see the TEXTSCAN documentation.
formatSpec = '%d %d %d %d %d %f %f %d %f %f %f %f %f %f %f %f %f %d';
%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to the format.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec,'Delimiter', delimiter, 'MultipleDelimsAsOne', true, 'HeaderLines', 2, 'ReturnOnError', false, 'EndOfLine', '\r\n');

%% Close the text file.
fclose(fileID);

%% Create output variable
CDIPFile = table;

%% Create date num vec
Y=double(dataArray{1});
M=double(dataArray{2});
D=double(dataArray{3});
hh=double(dataArray{4});
mm=double(dataArray{5});
ss=double(dataArray{6});
CDIPFile.Date=datenum(Y,M,D,hh,mm,ss);

CDIPFile.Hs = dataArray{6};
CDIPFile.Tp = dataArray{7};
CDIPFile.pdir = dataArray{8};
CDIPFile.Depth = dataArray{9};
CDIPFile.Ta = dataArray{10};
CDIPFile.Pres = dataArray{11};
CDIPFile.Wspd = dataArray{12};
CDIPFile.Wdir = dataArray{13};
CDIPFile.TempA = dataArray{14};
CDIPFile.TempS = dataArray{15};
CDIPFile.CSpd = dataArray{16};
CDIPFile.Cdir = dataArray{17};
CDIPFile.Pf = dataArray{18};


