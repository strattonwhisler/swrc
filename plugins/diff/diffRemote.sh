#!/bin/bash

colordiff -B <(curl -s $1) <(curl -s $2)

exit 0