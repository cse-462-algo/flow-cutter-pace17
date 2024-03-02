#!/bin/bash

# check if 1 argument is given
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 exact || heuristic"
    exit 1
fi

outdir="output-logs-$1"

mkdir -p $outdir

# Iterate over all unzipped instances
for file in unzipped/*; do
    echo "Running instance $(basename $file)..."
    # Run "./flow_cutter_pace17 < $file" in the background
    ./flow_cutter_pace17 < $file > $outdir/$(basename $file).log 2>&1 &
    pid=$!

    # Sleep for 60s (change here if you want to run for more/less time)
    sleep 5

    # Check if the process is still running and send SIGTERM
    if kill -0 $pid 2> /dev/null; then
    echo "Sending SIGTERM to process $pid"
    kill -TERM $pid
    fi
    echo "------------------Instance $(basename $file) done---------------------"
done

