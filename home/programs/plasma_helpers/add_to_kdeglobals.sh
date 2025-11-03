#!/usr/bin/env bash

# Usage: ./add_to_kdeglobals.sh "below this text" "text to insert"

FILE="$HOME/.config/kdeglobals"
GROUP="$1"
TEXT="$2"

# Check if the file exists
if [[ ! -f "$FILE" ]]; then
    echo "Error: File '$FILE' does not exist."
    exit 1
fi

# Check if text was provided
if [[ -z "$TEXT" ]]; then
    echo "Error: No text provided to insert."
    echo "Usage: $0 filename \"text to insert\""
    exit 1
fi

# Check if [General] exists
if grep -q "^\[$GROUP\]$" "$FILE"; then
    echo "Section [$GROUP] found. Inserting text after it..."
    sed -i "/^\[$GROUP\]$/a $TEXT" "$FILE"
else
    echo "Section [$GROUP] not found. Appending [$GROUP] and text to end of file..."
    {
        echo ""
        echo "[$GROUP]"
        echo "$TEXT"
    } >> "$FILE"
fi

echo "Done."
