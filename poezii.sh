#!/bin/bash

#It extracts the poetry content from a website

curl -s "http://poezii.romanianvoice.com/index.php" | pup "tbody tr:nth-child(3) a attr{href}" | head -n1 | while read -r author_url; do curl -s "$author_url" | pup "ol li a attr{href}" | sed 's|^..|http://romanianvoice.com/poezii|' | head -n2; done  
