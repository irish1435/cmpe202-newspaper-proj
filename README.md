Newspaper Benchmarks

This is a short Newspaper Benchmark application that uses the Newspaper application from:

https://github.com/codelucas/newspaper

My repo includes a full download of the newspaper with my own test script in it.

For an easy set up and run, please download the setup and run scripts from:

https://github.com/irish1435/202script

which will eventually access:

https://github.com/irish1435/cmpe202-newspaper-proj

After you run the setup script, run the run.sh script, user will be prompted for which kind of benchmarks, throughput or latency? 

For a throughput benchmark, users can choose from (1,2,4,8) threads with (X, X/4, X/16, X/64, X/256) instructions with X being around 1.6 Trillion instructions. The chosen parameter will run the throughput benchmark and will output 5 graphs each representing different tests. The five tests include IPC, branch misses, L1 misses, L2 misses, and LLC misses. 

For a latency benchmark, the program will run the script for about 3 minutes and ourput a normal distribution graph. 