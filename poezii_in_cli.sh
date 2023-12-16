#!/bin/bash

#It extracts the poetry content from a website

curl -s "http://poezii.romanianvoice.com/index.php" | pup "tbody tr:nth-child(3) a attr{href}" | while read -r author_url; do curl -s "$author_url" | pup "ol li a attr{href}" | sed 's|^..|http://romanianvoice.com/poezii|' | while read -r poem_url; do content=$(curl -s "$poem_url" | pup "body table:nth-child(3) tr td:nth-child(3) font:first-of-type text{}, body table:nth-child(3) tr td:nth-child(3) text{}" | sed 's/&#34;//g; s/^[[:space:]]*//; /^*\|^Audio\|^Your/d' | sed ':a;N;$!ba;s/\n\n\n\n/\n\n/g; :a;N;$!ba;s/\([^\n]\)\n\n\([^\n]\)/\1\n\2/g'); dir=$(echo "$content" | sed -n '4p'); file=$(echo "$content" | sed -n '12p'); if [[ -n "$dir" && -n "$file" ]]; then mkdir -p "$dir" && echo "$content" | sed -n '13,$p' | sed '/./,$!d' > "$dir/$file"; else echo "Error: Directory or file name is empty"; fi; done; done
