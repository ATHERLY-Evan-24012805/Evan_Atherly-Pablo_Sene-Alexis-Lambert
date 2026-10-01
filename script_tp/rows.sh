#!/bin/bash
total_lines=0

count_line() {
    local file="$1"
    local local_lines=0
    while IFS= read -r line || [ -n "$line" ]; do
        ((local_lines++))
    done < "$file"
    echo "$file : $local_lines lignes"
    ((total_lines += local_lines))
}

while IFS= read -r file; do
    if [ -f "$file" ]; then
        if [[ "$file" != */vendor/* ]]; then
                count_line "$file"
            fi
    fi
done < <(find ../app -type f)

echo "Nombre total de lignes dans tous les fichiers : $total_lines"


