#!/bin/bash

# Introduction
echo "This is a Single source / destination threading application
with a ratio of 100:1 source/destination ports per thread.
Ensure you have the server running on the destination host"

# Read the destination IP address.
echo "What is the IP of the destination?"
read dst

# Number of threads
echo "This script will initiate 100 streams per thread, how many threads
should be initiated?"
read sockets

# How long
echo "how long to run each thread?"
read t_time

dst_port=5201
counter=1
while [ $counter -le $sockets ]; do
	echo Building Thread $counter
	iperf3 -c $dst -p $dst_port -P 100 -i 10 -t $t_time &
	let counter=counter+1
	let dst_port=dst_port+1
done

#test
