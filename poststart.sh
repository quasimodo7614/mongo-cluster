#!/bin/sh
set -e
h=`hostname`

(sleep 40
 if [ ! "$h" = "mongo-cluster-0" ]; then
    echo "slave node do nothing"
    exit
 fi
 mongo --eval 'rs.initiate({_id: "MainRepSet", version: 1, members: [
         { _id: 0, host : "mongo-cluster-0.mongo-cluster:27017" },
         { _id: 1, host : "mongo-cluster-1.mongo-cluster:27017" },
         { _id: 2, host : "mongo-cluster-2.mongo-cluster:27017" }
        ]});'

) &


