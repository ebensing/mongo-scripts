#!/bin/bash

mongo admin shutdown.js --port 27018
mongo admin shutdown.js --port 27019
mongo admin shutdown.js --port 27020

sleep 2

sudo rm -rf /data/rs1
sudo rm -rf /data/rs2
sudo rm -rf /data/rs3
