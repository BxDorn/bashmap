#!/bin/bash

#Tshark control
tshark -i lo -w file.pcap
tshark -r file.pcap -q -z conv,tcp -n
echo "The total number of TCP sockets created was:"
tshark -r file.pcap -q -z conv,tcp -n | wc -l
rm -f file.pcap
