#!/bin/bash

usb_dev="/dev/ttyUSB0"
baudrate="921600"
time=`date '+%Y_%m_%dT%H_%M_%S'`
filename="./$time.log"

echo "Create $filename"
picocom -b $baudrate --imap lfcrlf $usb_dev | tee -a $filename

#picocom -b 921600 --imap lfcrlf /dev/ttyUSB0 | awk '{ print strftime("%c%N: "), $0; fflush(); }' | tee serial.txt

#picocom -b 921600 --imap lfcrlf /dev/ttyUSB0 | awk '{ print strftime("%m/%d/%Y %H:%M:%S: ", systime()); fflush(); }' | tee serial.txt




