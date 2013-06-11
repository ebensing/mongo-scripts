#!/bin/bash

sudo mkdir -p /data/s1

sudo mongod --logpath "s1.log" --dbpath /data/s1 --port 37017 --fork --shardsvr --smallfiles --noprealloc

sudo mkdir -p /data/s2

sudo mongod --logpath "s2.log" --dbpath /data/s2 --port 47017 --fork --shardsvr --smallfiles --noprealloc

sudo mkdir -p /data/cfg-a
sudo mkdir -p /data/cfg-b
sudo mkdir -p /data/cfg-c

sudo mongod --logpath "cfg-a.log" --dbpath /data/cfg-a --port 57017 --fork --configsvr --smallfiles --noprealloc
sudo mongod --logpath "cfg-b.log" --dbpath /data/cfg-b --port 57018 --fork --configsvr --smallfiles --noprealloc
sudo mongod --logpath "cfg-c.log" --dbpath /data/cfg-c --port 57019 --fork --configsvr --smallfiles --noprealloc

mongos --port 67017 --fork --logpath "mongos-1.log" --configdb localhost:57017,localhost:57018,localhost:57019 --chunkSize 1

# do the sharding setup here, see addShards.js for an example of how to do this
mongo addShards-small.js --port 67017
