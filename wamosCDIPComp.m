% Script to compare wamos wave height with CDIP buoy wave height

% define times for comparison
% start time - 3/22 0z
% end time -   4/9 15z
startTime=datenum([2017,3,22,0,0,0]);
endTime=datenum(2017,4,7,17,0,0);

% read in wamos data
% timeseries in 4 files.
% PEAK and MPEK - this also has wave height for swell and wind seas
% date,Hs,Tp,pdir,Lp,HsS,Tp1,PD1,lp1,Tp3,PD3,lp3,HsW,Tp2,PD2,lp2,Tp4,PD4,lp4
% PARA and MPAR - this has surface current
% MPAR & MPEK averaged values
% PARA & PEAK single values

wamosPEK1=importMPEK('MPEK_ssr_201703.txt');
wamosPEK2=importMPEK('MPEK_ssr_201704.txt');
wamos=[wamosPEK1;wamosPEK2];

% filter by date
ind=find(wamos.Date>=startTime & wamos.Date<=endTime);
wamosDate=wamos.Date(ind);
wamosHs=wamos.Hs(ind);
wamosTp=wamos.Tp(ind);
wamosPd=wamos.pdir(ind);

% read in CDIP buoy
%

cdip=importCDIP('pm229p1p1_197501-201712');
ind=find(cdip.Date>=startTime & cdip.Date<=endTime);
cdipDate=cdip.Date(ind);
cdipHs=cdip.Hs(ind);
cdipTp=cdip.Tp(ind);
cdipPd=cdip.pdir(ind);

%plot
plotyy(cdipDate,cdipPd,wamosDate,wamosPd)
datetick('x');


