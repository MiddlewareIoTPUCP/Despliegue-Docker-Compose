#!/bin/bash

dockerize -wait tcp://rabbit:5672 -wait tcp://influx:8086 -timeout 20s
