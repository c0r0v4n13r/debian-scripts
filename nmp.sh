#!/bin/bash
echo '#######################################'
echo nmap -v -A -Pn --max-parallelism 10000 - Fast Scan
echo nmap -vv -A -Pn -n -p 1-65535 --max-parallelism 10000 - Full Scan
echo '#######################################'
