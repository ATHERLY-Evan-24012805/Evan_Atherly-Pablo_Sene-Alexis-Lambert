#!/bin/bash
# Mesure LOC : compte toutes les lignes de tous les fichiers d'un dossier,
# sous-dossiers compris.
# Usage : ./loc.sh [dossier]   (dossier courant par défaut)

dossier="${1:-.}"

if [ ! -d "$dossier" ]; then
    echo "Erreur : '$dossier' n'est pas un dossier" >&2
    exit 1
fi

total=0
nb_fichiers=0

# find parcourt le dossier récursivement ; on ignore .git et le dossier Question
while IFS= read -r -d '' fichier; do
    # grep -I ignore les fichiers binaires (images, etc.)
    if grep -Iq . "$fichier"; then
        lignes=$(wc -l < "$fichier")
        echo "$lignes $fichier"
        total=$((total + lignes))
        nb_fichiers=$((nb_fichiers + 1))
    fi
done < <(find "$dossier" -type f -not -path '*/.git/*' -not -path '*/Question/*' -print0)

echo "Fichiers comptés : $nb_fichiers"
echo "Total LOC : $total"
