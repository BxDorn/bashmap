#!/bin/bash

echo "How many sockets?"
read sockets

echo "What is the server IP?"
read server

iperf3 -c $server -P $sockets
