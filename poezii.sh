#!/bin/bash

#It extracts the poetry content from a website

curl -s "http://poezii.romanianvoice.com/index.php" | pup "tbody tr:nth-child(3) a attr{href}" | head -n2 
