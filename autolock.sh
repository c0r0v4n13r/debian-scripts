#!/bin/bash
timer=$(( RANDOM%900 ))
sleep $timer
dm-tool lock
