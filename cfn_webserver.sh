#!/bin/bash
until $(curl --output /dev/null --silent --head --fail http://localhost); do
    sleep 5
done
