#!/bin/bash

dockerize -wait tcp://rabbit:5672 -wait tcp://mongo:27017 -timeout 20s
