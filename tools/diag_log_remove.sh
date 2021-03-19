#!/bin/bash

find ./ -type f -exec sed -i "/^.*diag_log.*/d" {} \;
