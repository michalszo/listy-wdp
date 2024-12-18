#!/bin/bash

if [ -z "$1" ]; then
    echo "Błąd: Nie podano żadnych liczb." >&2
    exit 1
fi

for liczba in "$@"; do
    if [[ $liczba =~ ^[0-9]+$ && $liczba -gt 0 ]]; then
        plik="dzielniki_$liczba.txt"
        
        if [ -e "$plik" ]; then
            echo "Błąd: Plik $plik już istnieje." >&2
        else
            touch "$plik"
            for (( i=1; i<=liczba; i++ )); do
                if (( liczba % i == 0 )); then
                    echo "$i" >> "$plik"
                fi
            done
            echo "Utworzono plik $plik."
        fi
    else
        echo "Błąd: $liczba nie jest liczbą naturalną." >&2
    fi
done
