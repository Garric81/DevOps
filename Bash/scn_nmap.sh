#!/bin/bash
ports=$(-p- --min-rate=$1 grep ^[0-9] | cut -d '/' -f tr '\n' ','
nmap -p$ports -A $1