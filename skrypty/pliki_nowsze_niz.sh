#!/bin/bash

if [ -z "$1" ]; then
    echo "Błąd: Nie podano daty." >&2
    exit 1
fi

# Sprawdzenie poprawności daty
data=$(date -d "$1")
if [ -z "$data" ]; then
    echo "Błąd: Niepoprawna data: '$1'." >&2
    exit 1
fi

# Wyświetlenie plików nowszych niż podana data
echo "Pliki zmodyfikowane później niż $data:"
find . -maxdepth 1 -type f -newermt "$data"
