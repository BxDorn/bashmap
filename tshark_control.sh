#!/bin/bash

#interface selection
clear
echo "-----------------------------------------------------------"
ip addr show
echo "-----------------------------------------------------------"
echo "What interface will you be sending data from?"
read out_interface

echo "what size slice should I keep per packet (128 will usually do fine)"
read slice

#Tshark control
clear
echo "*****************************************************************************"
echo "*************use ^C to end the capture once Iperf3 is complete***************"
echo "*****************************************************************************"
#define the interface for capture and output to file
tshark -i $out_interface -s $slice -w raw_file.pcap

#once the capture is completed, read teh results by conversation
tshark -r raw_file.pcap -q -z conv,tcp -n

#print the number of sockets created
echo "The total number of TCP sockets created was:"
tshark -r raw_file.pcap -q -z conv,tcp -n | wc -l


#copy the summary conversation results to a file
#tshark -r raw_file.pcap -q -z conv,tcp -n > test_result_"$(date +%Y-%m-%d_%H:%M:%S)".txt

#move the files to the user's desktop
mkdir /home/$USER/Desktop/test_result_"$(date +%Y-%m-%d_%H:%M:%S)"
mv raw_file.pcap /home/$USER/Desktop/test_result_"$(date +%Y-%m-%d_%H:%M:%S)"
#mv test_result_"$(date +%Y-%m-%d_%H:%M:%S)".txt /home/$USER/Desktop/test_result_"$(date +%Y-%m-%d_%H:%M:%S)"


echo "test complete, the pcap file has been placed to your desktop"
