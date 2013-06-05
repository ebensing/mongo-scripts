#!/bin/bash

#create the data dirs
sudo mkdir -p /data/rs1
sudo mkdir -p /data/rs2
sudo mkdir -p /data/rs3

#start the mongo instances
sudo mongod --replSet rs0 --logpath "1.log" --dbpath /data/rs1 --port 27018 --fork --smallfiles --noprealloc
sudo mongod --replSet rs0 --logpath "2.log" --dbpath /data/rs2 --port 27019 --fork --smallfiles --noprealloc
sudo mongod --replSet rs0 --logpath "3.log" --dbpath /data/rs3 --port 27020 --fork --smallfiles --noprealloc

#config the repl set

mongo replConfig.js --port 27018
