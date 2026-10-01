#!/bin/bash
DIR="${1:-.}"

# grep -Iq . : ne garde que les fichiers texte (ignore images et autres binaires)
# La commande tient sur une seule ligne pour ne pas casser au copier-coller.
find "$DIR" -type f ! -name "*.cpp" ! -path "*/.git/*" ! -path "*/node_modules/*" ! -path "*/vendor/*" ! -path "*/Question/*" -exec grep -Iq . {} \; -print0 | xargs -0 wc -l | sort -n
