#!/bin/bash

#It extracts the poetry content from a website

curl -s "http://poezii.romanianvoice.com/index.php" | pup "tbody tr:nth-child(3) a attr{href}" | head -n1 | while read -r author_url; do curl -s "$author_url" | pup "ol li a attr{href}" | sed 's|^..|http://romanianvoice.com/poezii|' | head -n2 | while read -r poem_url; do content=$(curl -s "$poem_url" | pup "body table:nth-child(3) tr td:nth-child(3) font:first-of-type text{}, body table:nth-child(3) tr td:nth-child(3) text{}"); echo "$content" ;done; done
