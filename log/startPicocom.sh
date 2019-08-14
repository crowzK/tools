#!/bin/bash

usb_dev="/dev/ttyUSB0"
baudrate="921600"
time=`date '+%Y_%m_%dT%H_%M_%S'`
filename="./$time.log"

echo "Create $filename"
#picocom -b $baudrate --imap lfcrlf $usb_dev | tee -a $filename

picocom -b $baudrate --imap lfcrlf $usb_dev | awk '{ "date +[T%H:%M:%S:%3N]" |& getline timestamp; print timestamp,$0; close("date +[T%H:%M:%S:%3N]"); fflush(); }' | tee -a $filename


#picocom -b 921600 --imap lfcrlf /deb/ttyUSB0 | awk '{ "date +T%H:%M:%S:%3N:" |& getline timestamp; print timestamp,$0; close("date +T%H:%M:%S:%3N:"); fflush(); }' | tee -a test.log





