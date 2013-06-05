#!/bin/bash

sudo mkdir -p /data/s1-a
sudo mkdir -p /data/s1-b
sudo mkdir -p /data/s1-c

sudo mongod --replSet s1 --logpath "s1-a.log" --dbpath /data/s1-a --port 37017 --fork --shardsvr --smallfiles --noprealloc
sudo mongod --replSet s1 --logpath "s1-b.log" --dbpath /data/s1-b --port 37018 --fork --shardsvr --smallfiles --noprealloc
sudo mongod --replSet s1 --logpath "s1-c.log" --dbpath /data/s1-c --port 37019 --fork --shardsvr --smallfiles --noprealloc

mongo shardRepl-s1.js --port 37017


sudo mkdir -p /data/s2-a
sudo mkdir -p /data/s2-b
sudo mkdir -p /data/s2-c

sudo mongod --replSet s2 --logpath "s2-a.log" --dbpath /data/s2-a --port 47017 --fork --shardsvr --smallfiles --noprealloc
sudo mongod --replSet s2 --logpath "s2-b.log" --dbpath /data/s2-b --port 47018 --fork --shardsvr --smallfiles --noprealloc
sudo mongod --replSet s2 --logpath "s2-c.log" --dbpath /data/s2-c --port 47019 --fork --shardsvr --smallfiles --noprealloc

mongo shardRepl-s2.js --port 47017

sudo mkdir -p /data/cfg-a
sudo mkdir -p /data/cfg-b
sudo mkdir -p /data/cfg-c

sudo mongod --logpath "cfg-a.log" --dbpath /data/cfg-a --port 57017 --fork --configsvr --smallfiles --noprealloc
sudo mongod --logpath "cfg-b.log" --dbpath /data/cfg-b --port 57018 --fork --configsvr --smallfiles --noprealloc
sudo mongod --logpath "cfg-c.log" --dbpath /data/cfg-c --port 57019 --fork --configsvr --smallfiles --noprealloc

mongos --port 67017 --fork --logpath "mongos-1.log" --configdb localhost:57017,localhost:57018,localhost:57019 --chunkSize 1

# do the sharding setup here, see addShards.js for an example of how to do this
#mongo addShards.js --port 67017
