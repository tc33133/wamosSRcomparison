function MPEKFile = importMPEK(filename)
%IMPORTFILE Import numeric data from a text file as a matrix.
%   MPEKSSR201703 = IMPORTFILE(FILENAME) Reads data from text file FILENAME
%   for the default selection.
%
%   MPEKSSR201703 = IMPORTFILE(FILENAME, STARTROW, ENDROW) Reads data from
%   rows STARTROW through ENDROW of text file FILENAME.
%
% Example:
%   MPEKssr201703 = importfile('MPEK_ssr_201703.txt', 1, 5);
%
%    See also TEXTSCAN.
%% Initialize variables.
delimiter = ' ';

%% Read columns of data as text:
% For more information, see the TEXTSCAN documentation.
formatSpec = '%s %f %f %d %d %f %f %d %d %f %f %d %d %f %f %d %d %f %f %d %d %f %d %d %f %f %f %f %d %s %s %s %[^\n\r]';
%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to the format.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec,'Delimiter', ' ', 'MultipleDelimsAsOne', true, 'HeaderLines', 1, 'ReturnOnError', false, 'EndOfLine', '\r\n');

%% Close the text file.
fclose(fileID);

%% convert date to datenum

dateVec=datenum(cell2mat(dataArray{1}),'yyyymmddHHMMSS');
dataArray{1}=dateVec;
%% Turn -9 into NAN in data column - skip first column
% column 30 is last numberic column

for i=2:29
    a=double(dataArray{i});
    ind=find(a==-9|a==-8);
    a(ind)=NaN;   
    dataArray{i}=a;
end
    

%% Create output variable
MPEKFile = table;
MPEKFile.Date = dataArray{1};
MPEKFile.Hs = dataArray{2};
MPEKFile.Tp = dataArray{3};
MPEKFile.pdir = dataArray{4};
MPEKFile.Lp = dataArray{5};
MPEKFile.HsW = dataArray{6};
MPEKFile.TpW = dataArray{7};
MPEKFile.PDW = dataArray{8};
MPEKFile.lpW = dataArray{9};
MPEKFile.Hss1 = dataArray{10};
MPEKFile.Tps1 = dataArray{11};
MPEKFile.PDs1 = dataArray{12};
MPEKFile.lps1 = dataArray{13};
MPEKFile.Hss2 = dataArray{14};
MPEKFile.Tps2 = dataArray{15};
MPEKFile.PDs2 = dataArray{16};
MPEKFile.lps2 = dataArray{17};
MPEKFile.Hss3 = dataArray{18};
MPEKFile.Tps3 = dataArray{19};
MPEKFile.PDs3 = dataArray{20};
MPEKFile.lps3 = dataArray{21};
MPEKFile.Us = dataArray{22};
MPEKFile.Ud = dataArray{23};
MPEKFile.IQ = dataArray{24};
MPEKFile.Tlim = dataArray{25};
MPEKFile.SPR = dataArray{26};
MPEKFile.CSI = dataArray{27};
MPEKFile.GAM = dataArray{28};
MPEKFile.NORI = dataArray{29};
MPEKFile.ELEVL = dataArray{30};

