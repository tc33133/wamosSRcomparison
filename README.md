This is a test repository to start using git/github with our wave processing software

The scripts and data here are used to compare wave paramaters between 
Sally Ride wamos and the CDIP buoy.

The importMPEK.m script reads the wamos timeseries labeled MPEK, which are found in the 
wamos results directory.

The importCDIP.m script reads the tabular parameter data from the CDIP buoy.
The CDIP Data downloaded from 
http://cdip.ucsd.edu/themes/data/download?station=229&start=1975&end=2017&public=1&stream=p1&file_type=pm&sub_stream=p1

The script wamosCDIPComp.m does the comparisons.
