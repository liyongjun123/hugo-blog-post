#!/bin/bash

sed -i "3c date: $(date +%FT%T+08:00)" todo.md
sed -i "3c date: $(date +%FT%T+08:00)" recode.md
#echo "date: $(date +%FT%T+08:00)" >> ${file_name}
