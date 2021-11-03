#!/bin/sh

# URL passed in environment
if [ -z "$LOAD_URL_BASE" ]
then
    echo "LOAD_URL_BASE not set"
    echo "Bye"
    exit 1
fi

while true
do
    echo "$LOAD_URL_BASE"
    ./hey -c 2 -q 4 -z 10s -m GET -t 3 "$LOAD_URL_BASE"
    echo "${LOAD_URL_BASE}/echo"
    ./hey -c 2 -q 4 -z 10s -m POST -t 3 -d "Hello World" "${LOAD_URL_BASE}/echo"
done
