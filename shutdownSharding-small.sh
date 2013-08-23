#!/bin/bash
#shutdown the mongos
mongo admin shutdown.js --port 67017

#shutdown the config servers
mongo admin shutdown.js --port 57017
#mongo admin shutdown.js --port 57018
#mongo admin shutdown.js --port 57019

#shutdown the sharding servers
mongo admin shutdown.js --port 37017
mongo admin shutdown.js --port 47017

# sleep for a couple seconds then blow up the data dirs
sleep 2

sudo rm -rf /data/s1
sudo rm -rf /data/s2
sudo rm -rf /data/cfg-a
#sudo rm -rf /data/cfg-b
#sudo rm -rf /data/cfg-c

