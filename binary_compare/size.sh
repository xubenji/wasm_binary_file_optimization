#!/bin/bash

find . -type f -name "*.bin" -exec ls -l --block-size=1 {} \; | awk '{print $5  $9}'

