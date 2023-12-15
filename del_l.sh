#!/bin/bash

#here's an algorithm to remove consecutive empty lines more than three from files in each directory


for i in *; do
	if [ -d "$i" ]; then
		for j in "$i"/*; do
			sed -i '/./,$!d' "$j"
		done 
	fi 
done
