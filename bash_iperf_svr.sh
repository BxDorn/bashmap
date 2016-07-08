#!/bin/bash



echo "This is the server component to the iperf client script, the client will send 
100 streams per thread, how many threads will you be terminating?"
read streams

port=5201
counter=1
while [ $counter -le $streams ]; do
	iperf3 -s -p $port &
	let port=port+1
	let counter=counter+1
done


