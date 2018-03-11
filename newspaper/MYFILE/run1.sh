#!/bin/bash

#parallel

#Choose the number of threads
x=1
#thread = 2
#thread = 3
#thread = 4

if [ $x = '1' ]
then
	#echo running with 1 thread
	ocperf.py stat parallel ::: "python3 testrun2.py"
elif [ $x = '2' ]
then
	#echo running with 2 threads
	ocperf.py stat parallel ::: "python3 testrun2.py" "python3 testrun2.py"
elif [ $x = '4' ]
then
	#echo running with 2 threads
	ocperf.py stat parallel ::: "python3 testrun2.py" "python3 testrun2.py" "python3 testrun2.py" "python3 testrun2.py"
elif [ $x = '8' ]
then
	#echo running with 2 threads
	ocperf.py stat parallel ::: "python3 testrun2.py" "python3 testrun2.py" "python3 testrun2.py" "python3 testrun2.py" "python3 testrun2.py" "python3 testrun2.py" "python3 testrun2.py" "python3 testrun2.py"
fi
