#!/bin/bash

uptime | cut -d ' ' -f4- | cut -d ',' -f 1
