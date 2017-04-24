% read in wamos data
% timeseries in 4 files.
% PEAK and MPEK - this also has wave height for swell and wind seas
% date,Hs,Tp,pdir,Lp,HsS,Tp1,PD1,lp1,Tp3,PD3,lp3,HsW,Tp2,PD2,lp2,Tp4,PD4,lp4
% PARA and MPAR - this has surface current
% MPAR & MPEK averaged values
% PARA & PEAK single values
filename='MPEK_ssr_201703.txt';
headerLines=1;
delimiter=' ';
wamos=importdata(filename,delimiter,headerLines);


% read in CDIP buoy
%