#!/bin/bash

kill $(ps aux | grep '[i]perf' | awk '{print $2}')

