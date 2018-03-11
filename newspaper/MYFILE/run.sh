#!/bin/bash
#runs the tests for throughput and latency
#simply just run bash run.sh and the program will prompt you with inputs
#branch, L1, L2, IPC, LLC
#inst=0
#core=$1
echo Welcome to Newspaper benchmarks!
echo latency \(l\) or throughput \(t\)?
read benchmark
if [ $benchmark = 't' ]
then
	echo Each throughput benchmarks will output five different tests. 
	echo Please click the image to view, click again to go back to preview.
	echo If you accidentally close the window, saved images can be found in the folder nmplot.
	echo Previous images WILL be deleted!
	echo How many threads? \(1,2,4,8\)
	read thread
	echo Total instructions divided by \(1, 4, 16, 64, 256\)?
	read core
	#rm -r ogdata/*
	#rm -r nmdata/*
	#rm -r nmplot/*
	#thread 1 (2048, 512, 128, 32, 8)
	#IPC
	if [ $thread = '1' ]
	then
		if [ $core = '1' ]
		then
			#IPC
			ocperf.py stat -I 1000 -e instructions,cycles -x, -o ogdata/t1_1.csv python3 testrun2.py 2048
			interval-normalize.py ogdata/t1_1.csv --output nmdata/t1_1n.csv 
			python ipc-plot.py nmdata/t1_1n.csv -o nmplot/t1_1n.png
			#branch misses
			ocperf.py stat -I 1000 -e branches,branch-misses -x, -o ogdata/b1_1.csv python3 testrun2.py 2048
			interval-normalize.py ogdata/b1_1.csv --output nmdata/b1_1n.csv 
			python branch-plot.py nmdata/b1_1n.csv -o nmplot/b1_1n.png
			#L1 Misses
			ocperf.py stat -I 1000 -e instructions,L1-dcache-load-misses -x, -o ogdata/l1_1.csv python3 testrun2.py 2048
			interval-normalize.py ogdata/l1_1.csv --output nmdata/l1_1n.csv 
			python L1-plot.py nmdata/l1_1n.csv -o nmplot/l1_1n.png
			#L2 Misses
			ocperf.py stat -I 1000 -e instructions,l2_rqsts.miss -x, -o ogdata/l2_1.csv python3 testrun2.py 2048
			interval-normalize.py ogdata/l2_1.csv --output nmdata/l2_1n.csv 
			python L2-plot.py nmdata/l2_1n.csv -o nmplot/l2_1n.png
			#LLC Misses
			ocperf.py stat -I 1000 -e instructions,LLC-load-misses -x, -o ogdata/llc_1.csv python3 testrun2.py 2048
			interval-normalize.py ogdata/llc_1.csv --output nmdata/llc_1n.csv 
			python LLC-plot.py nmdata/llc_1n.csv -o nmplot/llc_1n.png
		elif [ $core = '4' ]
		then
			#IPC
			ocperf.py stat -I 1000 -e instructions,cycles -x, -o ogdata/t1_4.csv python3 testrun2.py 512
			interval-normalize.py ogdata/t1_4.csv --output nmdata/t1_4n.csv 
			python ipc-plot.py nmdata/t1_4n.csv -o nmplot/t1_4n.png
			#branch misses
			ocperf.py stat -I 1000 -e branches,branch-misses -x, -o ogdata/b1_4.csv python3 testrun2.py 512
			interval-normalize.py ogdata/b1_4.csv --output nmdata/b1_4n.csv 
			python branch-plot.py nmdata/b1_4n.csv -o nmplot/b1_4n.png
			#L1 Misses
			ocperf.py stat -I 1000 -e instructions,L1-dcache-load-misses -x, -o ogdata/l1_4.csv python3 testrun2.py 512
			interval-normalize.py ogdata/l1_4.csv --output nmdata/l1_4n.csv 
			python L1-plot.py nmdata/l1_4n.csv -o nmplot/l1_4n.png
			#L2 Misses
			ocperf.py stat -I 1000 -e instructions,l2_rqsts.miss -x, -o ogdata/l2_4.csv python3 testrun2.py 512
			interval-normalize.py ogdata/l2_4.csv --output nmdata/l2_4n.csv 
			python L2-plot.py nmdata/l2_4n.csv -o nmplot/l2_4n.png
			#LLC Misses
			ocperf.py stat -I 1000 -e instructions,LLC-load-misses -x, -o ogdata/llc_4.csv python3 testrun2.py 512
			interval-normalize.py ogdata/llc_4.csv --output nmdata/llc_4n.csv 
			python LLC-plot.py nmdata/llc_4n.csv -o nmplot/llc_4n.png
		elif [ $core = '16' ]
		then
			#IPC
			ocperf.py stat -I 100 -e instructions,cycles -x, -o ogdata/t1_16.csv python3 testrun2.py 128
			interval-normalize.py ogdata/t1_16.csv --output nmdata/t1_16n.csv 
			python ipc-plot.py nmdata/t1_16n.csv -o nmplot/t1_16n.png
			#branch misses
			ocperf.py stat -I 100 -e branches,branch-misses -x, -o ogdata/b1_16.csv python3 testrun2.py 128
			interval-normalize.py ogdata/b1_16.csv --output nmdata/b1_16n.csv 
			python branch-plot.py nmdata/b1_16n.csv -o nmplot/b1_16n.png
			#L1 Misses
			ocperf.py stat -I 100 -e instructions,L1-dcache-load-misses -x, -o ogdata/l1_16.csv python3 testrun2.py 128
			interval-normalize.py ogdata/l1_16.csv --output nmdata/l1_16n.csv 
			python L1-plot.py nmdata/l1_16n.csv -o nmplot/l1_16n.png
			#L2 Misses
			ocperf.py stat -I 100 -e instructions,l2_rqsts.miss -x, -o ogdata/l2_16.csv python3 testrun2.py 128
			interval-normalize.py ogdata/l2_16.csv --output nmdata/l2_16n.csv 
			python L2-plot.py nmdata/l2_16n.csv -o nmplot/l2_16n.png
			#LLC Misses
			ocperf.py stat -I 100 -e instructions,LLC-load-misses -x, -o ogdata/llc_16.csv python3 testrun2.py 128
			interval-normalize.py ogdata/llc_16.csv --output nmdata/llc_16n.csv 
			python LLC-plot.py nmdata/llc_16n.csv -o nmplot/llc_16n.png
		elif [ $core = '64' ]
		then
			#IPC
			ocperf.py stat -I 100 -e instructions,cycles -x, -o ogdata/t1_64.csv python3 testrun2.py 32
			interval-normalize.py ogdata/t1_64.csv --output nmdata/t1_64n.csv 
			python ipc-plot.py nmdata/t1_64n.csv -o nmplot/t1_64n.png
			#branch misses
			ocperf.py stat -I 100 -e branches,branch-misses -x, -o ogdata/b1_64.csv python3 testrun2.py 32
			interval-normalize.py ogdata/b1_64.csv --output nmdata/b1_64n.csv 
			python branch-plot.py nmdata/b1_64n.csv -o nmplot/b1_64n.png
			#L1 Misses
			ocperf.py stat -I 100 -e instructions,L1-dcache-load-misses -x, -o ogdata/l1_64.csv python3 testrun2.py 32
			interval-normalize.py ogdata/l1_64.csv --output nmdata/l1_64n.csv 
			python L1-plot.py nmdata/l1_64n.csv -o nmplot/l1_64n.png
			#L2 Misses
			ocperf.py stat -I 100 -e instructions,l2_rqsts.miss -x, -o ogdata/l2_64.csv python3 testrun2.py 32
			interval-normalize.py ogdata/l2_64.csv --output nmdata/l2_64n.csv 
			python L2-plot.py nmdata/l2_64n.csv -o nmplot/l2_64n.png
			#LLC Misses
			ocperf.py stat -I 100 -e instructions,LLC-load-misses -x, -o ogdata/llc_64.csv python3 testrun2.py 32
			interval-normalize.py ogdata/llc_64.csv --output nmdata/llc_64n.csv 
			python LLC-plot.py nmdata/llc_64n.csv -o nmplot/llc_64n.png
		elif [ $core = '256' ]
		then
			#IPC
			ocperf.py stat -I 10 -e instructions,cycles -x, -o ogdata/t1_256.csv python3 testrun2.py 8
			interval-normalize.py ogdata/t1_256.csv --output nmdata/t1_256n.csv 
			python ipc-plot.py nmdata/t1_256n.csv -o nmplot/t1_256n.png
			#branch misses
			ocperf.py stat -I 10 -e branches,branch-misses -x, -o ogdata/b1_256.csv python3 testrun2.py 8
			interval-normalize.py ogdata/b1_256.csv --output nmdata/b1_256n.csv 
			python branch-plot.py nmdata/b1_256n.csv -o nmplot/b1_256n.png
			#L1 Misses
			ocperf.py stat -I 10 -e instructions,L1-dcache-load-misses -x, -o ogdata/l1_256.csv python3 testrun2.py 8
			interval-normalize.py ogdata/l1_256.csv --output nmdata/l1_256n.csv 
			python L1-plot.py nmdata/l1_256n.csv -o nmplot/l1_256n.png
			#L2 Misses
			ocperf.py stat -I 10 -e instructions,l2_rqsts.miss -x, -o ogdata/l2_256.csv python3 testrun2.py 8
			interval-normalize.py ogdata/l2_256.csv --output nmdata/l2_256n.csv 
			python L2-plot.py nmdata/l2_256n.csv -o nmplot/l2_256n.png
			#LLC Misses
			ocperf.py stat -I 10 -e instructions,LLC-load-misses -x, -o ogdata/llc_256.csv python3 testrun2.py 8
			interval-normalize.py ogdata/llc_256.csv --output nmdata/llc_256n.csv 
			python LLC-plot.py nmdata/llc_256n.csv -o nmplot/llc_256n.png
		fi
	elif [ $thread = '2' ]
	then
		if [ $core = '1' ]
		then
			#2 threads (1024, 256, 64, 16, 4)
			#IPC
			ocperf.py stat -I 1000 -e instructions,cycles -x, -o ogdata/t2_1.csv parallel ::: "python3 testrun2.py 1024" "python3 testrun2.py 1024"
			interval-normalize.py ogdata/t2_1.csv --output nmdata/t2_1n.csv 
			python ipc-plot.py nmdata/t2_1n.csv -o nmplot/t2_1n.png
			#branch misses
			ocperf.py stat -I 1000 -e branches,branch-misses -x, -o ogdata/b2_1.csv parallel ::: "python3 testrun2.py 1024" "python3 testrun2.py 1024"
			interval-normalize.py ogdata/b2_1.csv --output nmdata/b2_1n.csv 
			python branch-plot.py nmdata/b2_1n.csv -o nmplot/b2_1n.png
			#L1 Misses
			ocperf.py stat -I 1000 -e instructions,L1-dcache-load-misses -x, -o ogdata/2l1_1.csv parallel ::: "python3 testrun2.py 1024" "python3 testrun2.py 1024"
			interval-normalize.py ogdata/2l1_1.csv --output nmdata/2l1_1n.csv 
			python L1-plot.py nmdata/2l1_1n.csv -o nmplot/2l1_1n.png
			#L2 Misses
			ocperf.py stat -I 1000 -e instructions,l2_rqsts.miss -x, -o ogdata/2l2_1.csv parallel ::: "python3 testrun2.py 1024" "python3 testrun2.py 1024"
			interval-normalize.py ogdata/2l2_1.csv --output nmdata/2l2_1n.csv 
			python L2-plot.py nmdata/2l2_1n.csv -o nmplot/2l2_1n.png
			#LLC Misses
			ocperf.py stat -I 1000 -e instructions,LLC-load-misses -x, -o ogdata/2llc_1.csv parallel ::: "python3 testrun2.py 1024" "python3 testrun2.py 1024"
			interval-normalize.py ogdata/2llc_1.csv --output nmdata/2llc_1n.csv 
			python LLC-plot.py nmdata/2llc_1n.csv -o nmplot/2llc_1n.png
		elif [ $core = '4' ]
		then
			#IPC
			ocperf.py stat -I 1000 -e instructions,cycles -x, -o ogdata/t2_4.csv parallel ::: "python3 testrun2.py 256" "python3 testrun2.py 256"
			interval-normalize.py ogdata/t2_4.csv --output nmdata/t2_4n.csv 
			python ipc-plot.py nmdata/t2_4n.csv -o nmplot/t2_4n.png
			#branch misses
			ocperf.py stat -I 1000 -e branches,branch-misses -x, -o ogdata/b2_4.csv parallel ::: "python3 testrun2.py 256" "python3 testrun2.py 256"
			interval-normalize.py ogdata/b2_4.csv --output nmdata/b2_4n.csv 
			python branch-plot.py nmdata/b2_4n.csv -o nmplot/b2_4n.png
			#L1 Misses
			ocperf.py stat -I 1000 -e instructions,L1-dcache-load-misses -x, -o ogdata/2l1_4.csv parallel ::: "python3 testrun2.py 256" "python3 testrun2.py 256"
			interval-normalize.py ogdata/2l1_4.csv --output nmdata/2l1_4n.csv 
			python L1-plot.py nmdata/2l1_4n.csv -o nmplot/2l1_4n.png
			#L2 Misses
			ocperf.py stat -I 1000 -e instructions,l2_rqsts.miss -x, -o ogdata/2l2_4.csv parallel ::: "python3 testrun2.py 256" "python3 testrun2.py 256"
			interval-normalize.py ogdata/2l2_4.csv --output nmdata/2l2_4n.csv 
			python L2-plot.py nmdata/2l2_4n.csv -o nmplot/2l2_4n.png
			#LLC Misses
			ocperf.py stat -I 1000 -e instructions,LLC-load-misses -x, -o ogdata/2llc_4.csv parallel ::: "python3 testrun2.py 256" "python3 testrun2.py 256"
			interval-normalize.py ogdata/2llc_4.csv --output nmdata/2llc_4n.csv 
			python LLC-plot.py nmdata/2llc_4n.csv -o nmplot/2llc_4n.png
		elif [ $core = '16' ]
		then
			#IPC
			ocperf.py stat -I 100 -e instructions,cycles -x, -o ogdata/t2_16.csv parallel ::: "python3 testrun2.py 64" "python3 testrun2.py 64"
			interval-normalize.py ogdata/t2_16.csv --output nmdata/t2_16n.csv 
			python ipc-plot.py nmdata/t2_16n.csv -o nmplot/t2_16n.png
			#branch misses
			ocperf.py stat -I 100 -e branches,branch-misses -x, -o ogdata/b2_16.csv parallel ::: "python3 testrun2.py 64" "python3 testrun2.py 64"
			interval-normalize.py ogdata/b2_16.csv --output nmdata/b2_16n.csv 
			python branch-plot.py nmdata/b2_16n.csv -o nmplot/b2_16n.png
			#L1 Misses
			ocperf.py stat -I 100 -e instructions,L1-dcache-load-misses -x, -o ogdata/2l1_16.csv parallel ::: "python3 testrun2.py 64" "python3 testrun2.py 64"
			interval-normalize.py ogdata/2l1_16.csv --output nmdata/2l1_16n.csv 
			python L1-plot.py nmdata/2l1_16n.csv -o nmplot/2l1_16n.png
			#L2 Misses
			ocperf.py stat -I 100 -e instructions,l2_rqsts.miss -x, -o ogdata/2l2_16.csv parallel ::: "python3 testrun2.py 64" "python3 testrun2.py 64"
			interval-normalize.py ogdata/2l2_16.csv --output nmdata/2l2_16n.csv 
			python L2-plot.py nmdata/2l2_16n.csv -o nmplot/2l2_16n.png
			#LLC Misses
			ocperf.py stat -I 100 -e instructions,LLC-load-misses -x, -o ogdata/2llc_16.csv parallel ::: "python3 testrun2.py 64" "python3 testrun2.py 64"
			interval-normalize.py ogdata/2llc_16.csv --output nmdata/2llc_16n.csv 
			python LLC-plot.py nmdata/2llc_16n.csv -o nmplot/2llc_16n.png
		elif [ $core = '64' ]
		then
			#IPC
			ocperf.py stat -I 100 -e instructions,cycles -x, -o ogdata/t2_64.csv parallel ::: "python3 testrun2.py 16" "python3 testrun2.py 16"
			interval-normalize.py ogdata/t2_64.csv --output nmdata/t2_64n.csv 
			python ipc-plot.py nmdata/t2_64n.csv -o nmplot/t2_64n.png
			#branch misses
			ocperf.py stat -I 100 -e branches,branch-misses -x, -o ogdata/b2_64.csv parallel ::: "python3 testrun2.py 16" "python3 testrun2.py 16"
			interval-normalize.py ogdata/b2_64.csv --output nmdata/b2_64n.csv 
			python branch-plot.py nmdata/b2_64n.csv -o nmplot/b2_64n.png
			#L1 Misses
			ocperf.py stat -I 100 -e instructions,L1-dcache-load-misses -x, -o ogdata/2l1_64.csv parallel ::: "python3 testrun2.py 16" "python3 testrun2.py 16"
			interval-normalize.py ogdata/2l1_64.csv --output nmdata/2l1_64n.csv 
			python L1-plot.py nmdata/2l1_64n.csv -o nmplot/2l1_64n.png
			#L2 Misses
			ocperf.py stat -I 100 -e instructions,l2_rqsts.miss -x, -o ogdata/2l2_64.csv parallel ::: "python3 testrun2.py 16" "python3 testrun2.py 16"
			interval-normalize.py ogdata/2l2_64.csv --output nmdata/2l2_64n.csv 
			python L2-plot.py nmdata/2l2_64n.csv -o nmplot/2l2_64n.png
			#LLC Misses
			ocperf.py stat -I 100 -e instructions,LLC-load-misses -x, -o ogdata/2llc_64.csv parallel ::: "python3 testrun2.py 16" "python3 testrun2.py 16"
			interval-normalize.py ogdata/2llc_64.csv --output nmdata/2llc_64n.csv 
			python LLC-plot.py nmdata/2llc_64n.csv -o nmplot/2llc_64n.png
		elif [ $core = '256' ]
		then
			#IPC
			ocperf.py stat -I 10 -e instructions,cycles -x, -o ogdata/t2_256.csv parallel ::: "python3 testrun2.py 4" "python3 testrun2.py 4"
			interval-normalize.py ogdata/t2_256.csv --output nmdata/t2_256n.csv 
			python ipc-plot.py nmdata/t2_256n.csv -o nmplot/t2_256n.png
			#branch misses
			ocperf.py stat -I 10 -e branches,branch-misses -x, -o ogdata/b2_256.csv parallel ::: "python3 testrun2.py 4" "python3 testrun2.py 4"
			interval-normalize.py ogdata/b2_256.csv --output nmdata/b2_256n.csv 
			python branch-plot.py nmdata/b2_256n.csv -o nmplot/b2_256n.png
			#L1 Misses
			ocperf.py stat -I 10 -e instructions,L1-dcache-load-misses -x, -o ogdata/2l1_256.csv parallel ::: "python3 testrun2.py 4" "python3 testrun2.py 4"
			interval-normalize.py ogdata/2l1_256.csv --output nmdata/2l1_256n.csv 
			python L1-plot.py nmdata/2l1_256n.csv -o nmplot/2l1_256n.png
			#L2 Misses
			ocperf.py stat -I 10 -e instructions,l2_rqsts.miss -x, -o ogdata/2l2_256.csv parallel ::: "python3 testrun2.py 4" "python3 testrun2.py 4"
			interval-normalize.py ogdata/2l2_256.csv --output nmdata/2l2_256n.csv 
			python L2-plot.py nmdata/2l2_256n.csv -o nmplot/2l2_256n.png
			#LLC Misses
			ocperf.py stat -I 10 -e instructions,LLC-load-misses -x, -o ogdata/2llc_256.csv parallel ::: "python3 testrun2.py 4" "python3 testrun2.py 4"
			interval-normalize.py ogdata/2llc_256.csv --output nmdata/2llc_256n.csv 
			python LLC-plot.py nmdata/2llc_256n.csv -o nmplot/2llc_256n.png
		fi
	elif [ $thread = '4' ]
	then
		if [ $core = '1' ]
		then
			#4 threads (512, 128, 32, 8, 2)
			#IPC
			ocperf.py stat -I 1000 -e instructions,cycles -x, -o ogdata/t4_1.csv parallel ::: "python3 testrun2.py 512" "python3 testrun2.py 512" "python3 testrun2.py 512" "python3 testrun2.py 512"
			interval-normalize.py ogdata/t4_1.csv --output nmdata/t4_1n.csv 
			python ipc-plot.py nmdata/t4_1n.csv -o nmplot/t4_1n.png
			#branch misses
			ocperf.py stat -I 1000 -e branches,branch-misses -x, -o ogdata/b4_1.csv parallel ::: "python3 testrun2.py 512" "python3 testrun2.py 512" "python3 testrun2.py 512" "python3 testrun2.py 512"
			interval-normalize.py ogdata/b4_1.csv --output nmdata/b4_1n.csv 
			python branch-plot.py nmdata/b4_1n.csv -o nmplot/b4_1n.png
			#L1 Misses
			ocperf.py stat -I 1000 -e instructions,L1-dcache-load-misses -x, -o ogdata/4l1_1.csv parallel ::: "python3 testrun2.py 512" "python3 testrun2.py 512" "python3 testrun2.py 512" "python3 testrun2.py 512"
			interval-normalize.py ogdata/4l1_1.csv --output nmdata/4l1_1n.csv 
			python L1-plot.py nmdata/4l1_1n.csv -o nmplot/4l1_1n.png
			#L2 Misses
			ocperf.py stat -I 1000 -e instructions,l2_rqsts.miss -x, -o ogdata/4l2_1.csv parallel ::: "python3 testrun2.py 512" "python3 testrun2.py 512" "python3 testrun2.py 512" "python3 testrun2.py 512"
			interval-normalize.py ogdata/4l2_1.csv --output nmdata/4l2_1n.csv 
			python L2-plot.py nmdata/4l2_1n.csv -o nmplot/4l2_1n.png
			#LLC Misses
			ocperf.py stat -I 1000 -e instructions,LLC-load-misses -x, -o ogdata/4llc_1.csv parallel ::: "python3 testrun2.py 512" "python3 testrun2.py 512" "python3 testrun2.py 512" "python3 testrun2.py 512"
			interval-normalize.py ogdata/4llc_1.csv --output nmdata/4llc_1n.csv 
			python LLC-plot.py nmdata/4llc_1n.csv -o nmplot/4llc_1n.png
		elif [ $core = '4' ]
		then
			#IPC
			ocperf.py stat -I 1000 -e instructions,cycles -x, -o ogdata/t4_4.csv parallel ::: "python3 testrun2.py 128" "python3 testrun2.py 128" "python3 testrun2.py 128" "python3 testrun2.py 128"
			interval-normalize.py ogdata/t4_4.csv --output nmdata/t4_4n.csv 
			python ipc-plot.py nmdata/t4_4n.csv -o nmplot/t4_4n.png
			#branch misses
			ocperf.py stat -I 1000 -e branches,branch-misses -x, -o ogdata/b4_4.csv parallel ::: "python3 testrun2.py 128" "python3 testrun2.py 128" "python3 testrun2.py 128" "python3 testrun2.py 128"
			interval-normalize.py ogdata/b4_4.csv --output nmdata/b4_4n.csv 
			python branch-plot.py nmdata/b4_4n.csv -o nmplot/b4_4n.png
			#L1 Misses
			ocperf.py stat -I 1000 -e instructions,L1-dcache-load-misses -x, -o ogdata/4l1_4.csv parallel ::: "python3 testrun2.py 128" "python3 testrun2.py 128" "python3 testrun2.py 128" "python3 testrun2.py 128"
			interval-normalize.py ogdata/4l1_4.csv --output nmdata/4l1_4n.csv 
			python L1-plot.py nmdata/4l1_4n.csv -o nmplot/4l1_4n.png
			#L2 Misses
			ocperf.py stat -I 1000 -e instructions,l2_rqsts.miss -x, -o ogdata/4l2_4.csv parallel ::: "python3 testrun2.py 128" "python3 testrun2.py 128" "python3 testrun2.py 128" "python3 testrun2.py 128"
			interval-normalize.py ogdata/4l2_4.csv --output nmdata/4l2_4n.csv 
			python L2-plot.py nmdata/4l2_4n.csv -o nmplot/4l2_4n.png
			#LLC Misses
			ocperf.py stat -I 1000 -e instructions,LLC-load-misses -x, -o ogdata/4llc_4.csv parallel ::: "python3 testrun2.py 128" "python3 testrun2.py 128" "python3 testrun2.py 128" "python3 testrun2.py 128"
			interval-normalize.py ogdata/4llc_4.csv --output nmdata/4llc_4n.csv 
			python LLC-plot.py nmdata/4llc_4n.csv -o nmplot/4llc_4n.png
		elif [ $core = '16' ]
		then
			#IPC
			ocperf.py stat -I 100 -e instructions,cycles -x, -o ogdata/t4_16.csv parallel ::: "python3 testrun2.py 32" "python3 testrun2.py 32" "python3 testrun2.py 32" "python3 testrun2.py 32"
			interval-normalize.py ogdata/t4_16.csv --output nmdata/t4_16n.csv 
			python ipc-plot.py nmdata/t4_16n.csv -o nmplot/t4_16n.png
			#branch misses
			ocperf.py stat -I 100 -e branches,branch-misses -x, -o ogdata/b4_16.csv parallel ::: "python3 testrun2.py 32" "python3 testrun2.py 32" "python3 testrun2.py 32" "python3 testrun2.py 32"
			interval-normalize.py ogdata/b4_16.csv --output nmdata/b4_16n.csv 
			python branch-plot.py nmdata/b4_16n.csv -o nmplot/b4_16n.png
			#L1 Misses
			ocperf.py stat -I 100 -e instructions,L1-dcache-load-misses -x, -o ogdata/4l1_16.csv parallel ::: "python3 testrun2.py 32" "python3 testrun2.py 32" "python3 testrun2.py 32" "python3 testrun2.py 32"
			interval-normalize.py ogdata/4l1_16.csv --output nmdata/4l1_16n.csv 
			python L1-plot.py nmdata/4l1_16n.csv -o nmplot/4l1_16n.png
			#L2 Misses
			ocperf.py stat -I 100 -e instructions,l2_rqsts.miss -x, -o ogdata/4l2_16.csv parallel ::: "python3 testrun2.py 32" "python3 testrun2.py 32" "python3 testrun2.py 32" "python3 testrun2.py 32"
			interval-normalize.py ogdata/4l2_16.csv --output nmdata/4l2_16n.csv 
			python L2-plot.py nmdata/4l2_16n.csv -o nmplot/4l2_16n.png
			#LLC Misses
			ocperf.py stat -I 100 -e instructions,LLC-load-misses -x, -o ogdata/4llc_16.csv parallel ::: "python3 testrun2.py 32" "python3 testrun2.py 32" "python3 testrun2.py 32" "python3 testrun2.py 32"
			interval-normalize.py ogdata/4llc_16.csv --output nmdata/4llc_16n.csv 
			python LLC-plot.py nmdata/4llc_16n.csv -o nmplot/4llc_16n.png
		elif [ $core = '64' ]
		then
			#IPC
			ocperf.py stat -I 100 -e instructions,cycles -x, -o ogdata/t4_64.csv parallel ::: "python3 testrun2.py 8" "python3 testrun2.py 8" "python3 testrun2.py 8" "python3 testrun2.py 8"
			interval-normalize.py ogdata/t4_64.csv --output nmdata/t4_64n.csv 
			python ipc-plot.py nmdata/t4_64n.csv -o nmplot/t4_64n.png
			#branch misses
			ocperf.py stat -I 100 -e branches,branch-misses -x, -o ogdata/b4_64.csv parallel ::: "python3 testrun2.py 8" "python3 testrun2.py 8" "python3 testrun2.py 8" "python3 testrun2.py 8"
			interval-normalize.py ogdata/b4_64.csv --output nmdata/b4_64n.csv 
			python branch-plot.py nmdata/b4_64n.csv -o nmplot/b4_64n.png
			#L1 Misses
			ocperf.py stat -I 100 -e instructions,L1-dcache-load-misses -x, -o ogdata/4l1_64.csv parallel ::: "python3 testrun2.py 8" "python3 testrun2.py 8" "python3 testrun2.py 8" "python3 testrun2.py 8"
			interval-normalize.py ogdata/4l1_64.csv --output nmdata/4l1_64n.csv 
			python L1-plot.py nmdata/4l1_64n.csv -o nmplot/4l1_64n.png
			#L2 Misses
			ocperf.py stat -I 100 -e instructions,l2_rqsts.miss -x, -o ogdata/4l2_64.csv parallel ::: "python3 testrun2.py 8" "python3 testrun2.py 8" "python3 testrun2.py 8" "python3 testrun2.py 8"
			interval-normalize.py ogdata/4l2_64.csv --output nmdata/4l2_64n.csv 
			python L2-plot.py nmdata/4l2_64n.csv -o nmplot/4l2_64n.png
			#LLC Misses
			ocperf.py stat -I 100 -e instructions,LLC-load-misses -x, -o ogdata/4llc_64.csv parallel ::: "python3 testrun2.py 8" "python3 testrun2.py 8" "python3 testrun2.py 8" "python3 testrun2.py 8"
			interval-normalize.py ogdata/4llc_64.csv --output nmdata/4llc_64n.csv 
			python LLC-plot.py nmdata/4llc_64n.csv -o nmplot/4llc_64n.png
		elif [ $core = '256' ]
		then
			#IPC
			ocperf.py stat -I 10 -e instructions,cycles -x, -o ogdata/t4_256.csv parallel ::: "python3 testrun2.py 2" "python3 testrun2.py 2" "python3 testrun2.py 2" "python3 testrun2.py 2"
			interval-normalize.py ogdata/t4_256.csv --output nmdata/t4_256n.csv 
			python ipc-plot.py nmdata/t4_256n.csv -o nmplot/t4_256n.png
			#branch misses
			ocperf.py stat -I 10 -e branches,branch-misses -x, -o ogdata/b4_256.csv parallel ::: "python3 testrun2.py 2" "python3 testrun2.py 2" "python3 testrun2.py 2" "python3 testrun2.py 2"
			interval-normalize.py ogdata/b4_256.csv --output nmdata/b4_256n.csv 
			python branch-plot.py nmdata/b4_256n.csv -o nmplot/b4_256n.png
			#L1 Misses
			ocperf.py stat -I 10 -e instructions,L1-dcache-load-misses -x, -o ogdata/4l1_256.csv parallel ::: "python3 testrun2.py 2" "python3 testrun2.py 2" "python3 testrun2.py 2" "python3 testrun2.py 2"
			interval-normalize.py ogdata/4l1_256.csv --output nmdata/4l1_256n.csv 
			python L1-plot.py nmdata/4l1_256n.csv -o nmplot/4l1_256n.png
			#L2 Misses
			ocperf.py stat -I 10 -e instructions,l2_rqsts.miss -x, -o ogdata/4l2_256.csv parallel ::: "python3 testrun2.py 2" "python3 testrun2.py 2" "python3 testrun2.py 2" "python3 testrun2.py 2"
			interval-normalize.py ogdata/4l2_256.csv --output nmdata/4l2_256n.csv 
			python L2-plot.py nmdata/4l2_256n.csv -o nmplot/4l2_256n.png
			#LLC Misses
			ocperf.py stat -I 10 -e instructions,LLC-load-misses -x, -o ogdata/4llc_256.csv parallel ::: "python3 testrun2.py 2" "python3 testrun2.py 2" "python3 testrun2.py 2" "python3 testrun2.py 2"
			interval-normalize.py ogdata/4llc_256.csv --output nmdata/4llc_256n.csv 
			python LLC-plot.py nmdata/4llc_256n.csv -o nmplot/4llc_256n.png
		fi
	elif [ $thread = '8' ]
	then
		if [ $core = '1' ]
		then
			#8 threads (256, 64, 16, 4, 1)
			#IPC
			ocperf.py stat -I 1000 -e instructions,cycles -x, -o ogdata/t8_1.csv parallel ::: "python3 testrun2.py 256" "python3 testrun2.py 256" "python3 testrun2.py 256" "python3 testrun2.py 256" "python3 testrun2.py 256" "python3 testrun2.py 256" "python3 testrun2.py 256" "python3 testrun2.py 256"
			interval-normalize.py ogdata/t8_1.csv --output nmdata/t8_1n.csv 
			python ipc-plot.py nmdata/t8_1n.csv -o nmplot/t8_1n.png
			#branch misses
			ocperf.py stat -I 1000 -e branches,branch-misses -x, -o ogdata/b8_1.csv parallel ::: "python3 testrun2.py 256" "python3 testrun2.py 256" "python3 testrun2.py 256" "python3 testrun2.py 256" "python3 testrun2.py 256" "python3 testrun2.py 256" "python3 testrun2.py 256" "python3 testrun2.py 256"
			interval-normalize.py ogdata/b8_1.csv --output nmdata/b8_1n.csv 
			python branch-plot.py nmdata/b8_1n.csv -o nmplot/b8_1n.png
			#L1 Misses
			ocperf.py stat -I 1000 -e instructions,L1-dcache-load-misses -x, -o ogdata/8l1_1.csv parallel ::: "python3 testrun2.py 256" "python3 testrun2.py 256" "python3 testrun2.py 256" "python3 testrun2.py 256" "python3 testrun2.py 256" "python3 testrun2.py 256" "python3 testrun2.py 256" "python3 testrun2.py 256"
			interval-normalize.py ogdata/8l1_1.csv --output nmdata/8l1_1n.csv 
			python L1-plot.py nmdata/8l1_1n.csv -o nmplot/8l1_1n.png
			#L2 Misses
			ocperf.py stat -I 1000 -e instructions,l2_rqsts.miss -x, -o ogdata/8l2_1.csv parallel ::: "python3 testrun2.py 256" "python3 testrun2.py 256" "python3 testrun2.py 256" "python3 testrun2.py 256" "python3 testrun2.py 256" "python3 testrun2.py 256" "python3 testrun2.py 256" "python3 testrun2.py 256"
			interval-normalize.py ogdata/8l2_1.csv --output nmdata/8l2_1n.csv 
			python L2-plot.py nmdata/8l2_1n.csv -o nmplot/8l2_1n.png
			#LLC Misses
			ocperf.py stat -I 1000 -e instructions,LLC-load-misses -x, -o ogdata/8llc_1.csv parallel ::: "python3 testrun2.py 256" "python3 testrun2.py 256" "python3 testrun2.py 256" "python3 testrun2.py 256" "python3 testrun2.py 256" "python3 testrun2.py 256" "python3 testrun2.py 256" "python3 testrun2.py 256"
			interval-normalize.py ogdata/8llc_1.csv --output nmdata/8llc_1n.csv 
			python LLC-plot.py nmdata/8llc_1n.csv -o nmplot/8llc_1n.png
		elif [ $core = '4' ]
		then
			#IPC
			ocperf.py stat -I 1000 -e instructions,cycles -x, -o ogdata/t8_4.csv parallel ::: "python3 testrun2.py 64" "python3 testrun2.py 64" "python3 testrun2.py 64" "python3 testrun2.py 64" "python3 testrun2.py 64" "python3 testrun2.py 64" "python3 testrun2.py 64" "python3 testrun2.py 64"
			interval-normalize.py ogdata/t8_4.csv --output nmdata/t8_4n.csv 
			python ipc-plot.py nmdata/t8_4n.csv -o nmplot/t8_4n.png
			#branch misses
			ocperf.py stat -I 1000 -e branches,branch-misses -x, -o ogdata/b8_4.csv parallel ::: "python3 testrun2.py 64" "python3 testrun2.py 64" "python3 testrun2.py 64" "python3 testrun2.py 64" "python3 testrun2.py 64" "python3 testrun2.py 64" "python3 testrun2.py 64" "python3 testrun2.py 64"
			interval-normalize.py ogdata/b8_4.csv --output nmdata/b8_4n.csv 
			python branch-plot.py nmdata/b8_4n.csv -o nmplot/b8_4n.png
			#L1 Misses
			ocperf.py stat -I 1000 -e instructions,L1-dcache-load-misses -x, -o ogdata/8l1_4.csv parallel ::: "python3 testrun2.py 64" "python3 testrun2.py 64" "python3 testrun2.py 64" "python3 testrun2.py 64" "python3 testrun2.py 64" "python3 testrun2.py 64" "python3 testrun2.py 64" "python3 testrun2.py 64"
			interval-normalize.py ogdata/8l1_4.csv --output nmdata/8l1_4n.csv 
			python L1-plot.py nmdata/8l1_4n.csv -o nmplot/8l1_4n.png
			#L2 Misses
			ocperf.py stat -I 1000 -e instructions,l2_rqsts.miss -x, -o ogdata/8l2_4.csv parallel ::: "python3 testrun2.py 64" "python3 testrun2.py 64" "python3 testrun2.py 64" "python3 testrun2.py 64" "python3 testrun2.py 64" "python3 testrun2.py 64" "python3 testrun2.py 64" "python3 testrun2.py 64"
			interval-normalize.py ogdata/8l2_4.csv --output nmdata/8l2_4n.csv 
			python L2-plot.py nmdata/8l2_4n.csv -o nmplot/8l2_4n.png
			#LLC Misses
			ocperf.py stat -I 1000 -e instructions,LLC-load-misses -x, -o ogdata/8llc_4.csv parallel ::: "python3 testrun2.py 64" "python3 testrun2.py 64" "python3 testrun2.py 64" "python3 testrun2.py 64" "python3 testrun2.py 64" "python3 testrun2.py 64" "python3 testrun2.py 64" "python3 testrun2.py 64"
			interval-normalize.py ogdata/8llc_4.csv --output nmdata/8llc_4n.csv 
			python LLC-plot.py nmdata/8llc_4n.csv -o nmplot/8llc_4n.png
		elif [ $core = '16' ]
		then
			#IPC START FROM HERE IRIS
			ocperf.py stat -I 100 -e instructions,cycles -x, -o ogdata/t8_16.csv parallel ::: "python3 testrun2.py 16" "python3 testrun2.py 16" "python3 testrun2.py 16" "python3 testrun2.py 16" "python3 testrun2.py 16" "python3 testrun2.py 16" "python3 testrun2.py 16" "python3 testrun2.py 16"
			interval-normalize.py ogdata/t8_16.csv --output nmdata/t8_16n.csv 
			python ipc-plot.py nmdata/t8_16n.csv -o nmplot/t8_16n.png
			#branch misses
			ocperf.py stat -I 100 -e branches,branch-misses -x, -o ogdata/b8_16.csv parallel ::: "python3 testrun2.py 16" "python3 testrun2.py 16" "python3 testrun2.py 16" "python3 testrun2.py 16" "python3 testrun2.py 16" "python3 testrun2.py 16" "python3 testrun2.py 16" "python3 testrun2.py 16"
			interval-normalize.py ogdata/b8_16.csv --output nmdata/b8_16n.csv 
			python branch-plot.py nmdata/b8_16n.csv -o nmplot/b8_16n.png
			#L1 Misses
			ocperf.py stat -I 100 -e instructions,L1-dcache-load-misses -x, -o ogdata/8l1_16.csv parallel ::: "python3 testrun2.py 16" "python3 testrun2.py 16" "python3 testrun2.py 16" "python3 testrun2.py 16" "python3 testrun2.py 16" "python3 testrun2.py 16" "python3 testrun2.py 16" "python3 testrun2.py 16"
			interval-normalize.py ogdata/8l1_16.csv --output nmdata/8l1_16n.csv 
			python L1-plot.py nmdata/8l1_16n.csv -o nmplot/8l1_16n.png
			#L2 Misses
			ocperf.py stat -I 100 -e instructions,l2_rqsts.miss -x, -o ogdata/8l2_16.csv parallel ::: "python3 testrun2.py 16" "python3 testrun2.py 16" "python3 testrun2.py 16" "python3 testrun2.py 16" "python3 testrun2.py 16" "python3 testrun2.py 16" "python3 testrun2.py 16" "python3 testrun2.py 16"
			interval-normalize.py ogdata/8l2_16.csv --output nmdata/8l2_16n.csv 
			python L2-plot.py nmdata/8l2_16n.csv -o nmplot/8l2_16n.png
			#LLC Misses
			ocperf.py stat -I 100 -e instructions,LLC-load-misses -x, -o ogdata/8llc_16.csv parallel ::: "python3 testrun2.py 16" "python3 testrun2.py 16" "python3 testrun2.py 16" "python3 testrun2.py 16" "python3 testrun2.py 16" "python3 testrun2.py 16" "python3 testrun2.py 16" "python3 testrun2.py 16"
			interval-normalize.py ogdata/8llc_16.csv --output nmdata/8llc_16n.csv 
			python LLC-plot.py nmdata/8llc_16n.csv -o nmplot/8llc_16n.png
		elif [ $core = '64' ]
		then
			#IPC
			ocperf.py stat -I 100 -e instructions,cycles -x, -o ogdata/t8_64.csv parallel ::: "python3 testrun2.py 4" "python3 testrun2.py 4" "python3 testrun2.py 4" "python3 testrun2.py 4" "python3 testrun2.py 4" "python3 testrun2.py 4" "python3 testrun2.py 4" "python3 testrun2.py 4"
			interval-normalize.py ogdata/t8_64.csv --output nmdata/t8_64n.csv 
			python ipc-plot.py nmdata/t8_64n.csv -o nmplot/t8_64n.png
			#branch misses
			ocperf.py stat -I 100 -e branches,branch-misses -x, -o ogdata/b8_64.csv parallel ::: "python3 testrun2.py 4" "python3 testrun2.py 4" "python3 testrun2.py 4" "python3 testrun2.py 4" "python3 testrun2.py 4" "python3 testrun2.py 4" "python3 testrun2.py 4" "python3 testrun2.py 4"
			interval-normalize.py ogdata/b8_64.csv --output nmdata/b8_64n.csv 
			python branch-plot.py nmdata/b8_64n.csv -o nmplot/b8_64n.png
			#L1 Misses
			ocperf.py stat -I 100 -e instructions,L1-dcache-load-misses -x, -o ogdata/8l1_64.csv parallel ::: "python3 testrun2.py 4" "python3 testrun2.py 4" "python3 testrun2.py 4" "python3 testrun2.py 4" "python3 testrun2.py 4" "python3 testrun2.py 4" "python3 testrun2.py 4" "python3 testrun2.py 4"
			interval-normalize.py ogdata/8l1_64.csv --output nmdata/8l1_64n.csv 
			python L1-plot.py nmdata/8l1_64n.csv -o nmplot/8l1_64n.png
			#L2 Misses
			ocperf.py stat -I 100 -e instructions,l2_rqsts.miss -x, -o ogdata/8l2_64.csv parallel ::: "python3 testrun2.py 4" "python3 testrun2.py 4" "python3 testrun2.py 4" "python3 testrun2.py 4" "python3 testrun2.py 4" "python3 testrun2.py 4" "python3 testrun2.py 4" "python3 testrun2.py 4"
			interval-normalize.py ogdata/8l2_64.csv --output nmdata/8l2_64n.csv 
			python L2-plot.py nmdata/8l2_64n.csv -o nmplot/8l2_64n.png
			#LLC Misses
			ocperf.py stat -I 100 -e instructions,LLC-load-misses -x, -o ogdata/8llc_64.csv parallel ::: "python3 testrun2.py 4" "python3 testrun2.py 4" "python3 testrun2.py 4" "python3 testrun2.py 4" "python3 testrun2.py 4" "python3 testrun2.py 4" "python3 testrun2.py 4" "python3 testrun2.py 4"
			interval-normalize.py ogdata/8llc_64.csv --output nmdata/8llc_64n.csv 
			python LLC-plot.py nmdata/8llc_64n.csv -o nmplot/8llc_64n.png
		elif [ $core = '256' ]
		then
			#IPC
			ocperf.py stat -I 10 -e instructions,cycles -x, -o ogdata/t8_256.csv parallel ::: "python3 testrun2.py 1" "python3 testrun2.py 1" "python3 testrun2.py 1" "python3 testrun2.py 1" "python3 testrun2.py 1" "python3 testrun2.py 1" "python3 testrun2.py 1" "python3 testrun2.py 1"
			interval-normalize.py ogdata/t8_256.csv --output nmdata/t8_256n.csv 
			python ipc-plot.py nmdata/t8_256n.csv -o nmplot/t8_256n.png
			#branch misses
			ocperf.py stat -I 10 -e branches,branch-misses -x, -o ogdata/b8_256.csv parallel ::: "python3 testrun2.py 1" "python3 testrun2.py 1" "python3 testrun2.py 1" "python3 testrun2.py 1" "python3 testrun2.py 1" "python3 testrun2.py 1" "python3 testrun2.py 1" "python3 testrun2.py 1"
			interval-normalize.py ogdata/b8_256.csv --output nmdata/b8_256n.csv 
			python branch-plot.py nmdata/b8_256n.csv -o nmplot/b8_256n.png
			#L1 Misses
			ocperf.py stat -I 10 -e instructions,L1-dcache-load-misses -x, -o ogdata/8l1_256.csv parallel ::: "python3 testrun2.py 1" "python3 testrun2.py 1" "python3 testrun2.py 1" "python3 testrun2.py 1" "python3 testrun2.py 1" "python3 testrun2.py 1" "python3 testrun2.py 1" "python3 testrun2.py 1"
			interval-normalize.py ogdata/8l1_256.csv --output nmdata/8l1_256n.csv 
			python L1-plot.py nmdata/8l1_256n.csv -o nmplot/8l1_256n.png
			#L2 Misses
			ocperf.py stat -I 10 -e instructions,l2_rqsts.miss -x, -o ogdata/8l2_256.csv parallel ::: "python3 testrun2.py 1" "python3 testrun2.py 1" "python3 testrun2.py 1" "python3 testrun2.py 1" "python3 testrun2.py 1" "python3 testrun2.py 1" "python3 testrun2.py 1" "python3 testrun2.py 1"
			interval-normalize.py ogdata/8l2_256.csv --output nmdata/8l2_256n.csv 
			python L2-plot.py nmdata/8l2_256n.csv -o nmplot/8l2_256n.png
			#LLC Misses
			ocperf.py stat -I 10 -e instructions,LLC-load-misses -x, -o ogdata/8llc_256.csv parallel ::: "python3 testrun2.py 1" "python3 testrun2.py 1" "python3 testrun2.py 1" "python3 testrun2.py 1" "python3 testrun2.py 1" "python3 testrun2.py 1" "python3 testrun2.py 1" "python3 testrun2.py 1"
			interval-normalize.py ogdata/8llc_256.csv --output nmdata/8llc_256n.csv 
			python LLC-plot.py nmdata/8llc_256n.csv -o nmplot/8llc_256n.png
		fi	
	fi
	#gmic nmplot/*.png
fi
if [ $benchmark = 'l' ]
then
	echo helllo
fi

#ocperf.py stat -I 100 -e instructions,cycles -x, -o ogdata/t1_2.csv python3 testrun2.py
#interval-normalize.py ogdata/t1_2.csv --output nmdata/t1_2n.csv 
#python ipc-plot.py nmdata/t1_2n.csv -o nmplot/t1_2n.png
