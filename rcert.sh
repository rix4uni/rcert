#!/bin/bash

process_domain() {
    local DOMAIN=$1

    echo "$DOMAIN" >> wildcards1.txt

    local counter=1

    while true; do
        cat "wildcards${counter}.txt" | sed 's/*.//' | certinfo | jq -r '.Certificate_Subject_Alternative_Name // empty | .[]' | unew "$DOMAIN".txt | tee -a "wildcards$((counter + 1)).txt"
        if [ ! -s "wildcards$((counter + 1)).txt" ]; then
            break
        fi
        counter=$((counter + 1))
    done

    rm -rf wildcards[0-9]*.txt
}

# Check if an argument is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <domain|domain_file>"
    exit 1
fi

INPUT=$1

# Check if the input is a file or a single domain
if [ -f "$INPUT" ]; then
    # It's a file, process each domain in the file
    while IFS= read -r DOMAIN; do
        process_domain "$DOMAIN"
    done < "$INPUT"
else
    # It's a single domain
    process_domain "$INPUT"
fi
