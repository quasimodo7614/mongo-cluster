#!/bin/sh
set -e
h=`hostname`
while :
do
  RESULT=`ps -ef | grep "mongod" | grep -v "grep" | awk '{print $2}'`
  echo "result is: $RESULT"
  if [ -z $RESULT ]; then
      echo "mongodb not running"
      sleep 1
  else
     if [ "$h" = "mongo-cluster-0" ]; then
       echo "mongodb master running!"
       mongo --eval 'rs.initiate({_id: "MainRepSet", version: 1, members: [
         { _id: 0, host : "mongo-cluster-0.mongo-cluster:27017" },
         { _id: 1, host : "mongo-cluster-1.mongo-cluster:27017" },
         { _id: 2, host : "mongo-cluster-2.mongo-cluster:27017" }
        ]});'
       exit 0
     fi
     echo "not master, do nothing"
     exit 0
   fi
done
