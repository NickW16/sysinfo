#!/bin/bash
# This script displays your system's information

separator () {
   for ((i=0; i<=20; i++)); do
      echo -n "-="
   done
   # Just to break a line:
   echo ""
      return 0
   }

function CPU() {
   echo "CPU information:"
   CPU_MODEL=$(lscpu | grep "Model name" | cut -f 2 -d ":" | xargs) 
   echo "CPU Model: ${CPU_MODEL}"
   
   CPU_CORES=$(lscpu | grep "^CPU(s):" | xargs)
   echo "Total CPU Cores: ${CPU_CORES}"

   CPU_MHZ=$(lscpu | grep  "CPU max MHz:" | awk '{print $4}')
   echo "CPU Frequency: ${CPU_MHZ} "
   return 0
}

function MEM() {
   echo "MEM information:"
   # Decided to leave 'free -h' since its a complete info
   MEM_TOTAL=$(free -h)
   echo "${MEM_TOTAL}"
}   

DISK=""
OS=""

separator
CPU
separator
MEM
