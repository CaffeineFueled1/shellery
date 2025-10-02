#!/bin/bash

# Simple Static Gallery Generator
# Generates a single-page gallery from images in the images/ directory

set -e

IMAGES_DIR="images"
OUTPUT_DIR="output"
TEMPLATES_DIR="templates"
ASSETS_DIR="assets"

# Create output directory
mkdir -p "$OUTPUT_DIR"

# Start building the HTML file
OUTPUT_FILE="$OUTPUT_DIR/index.html"
> "$OUTPUT_FILE"

# Assemble templates in order
for template in $(ls "$TEMPLATES_DIR"/*.tmpl | sort); do
    # Process each template line by line to handle placeholders
    while IFS= read -r line; do
        if [[ "$line" == *"<!-- IMAGES -->"* ]]; then
            # Generate gallery items (reversed order)
            images=("$IMAGES_DIR"/*)
            for ((i=${#images[@]}-1; i>=0; i--)); do
                img="${images[$i]}"
                if [[ -f "$img" ]]; then
                    img_name=$(basename "$img")
                    echo "        <div class=\"gallery-item\">" >> "$OUTPUT_FILE"
                    echo "            <a href=\"#$img_name\">" >> "$OUTPUT_FILE"
                    echo "                <img src=\"images/$img_name\" alt=\"$img_name\" loading=\"lazy\">" >> "$OUTPUT_FILE"
                    echo "            </a>" >> "$OUTPUT_FILE"
                    echo "        </div>" >> "$OUTPUT_FILE"
                fi
            done
        elif [[ "$line" == *"<!-- LIGHTBOXES -->"* ]]; then
            # Generate lightboxes outside the gallery grid (reversed order)
            images=("$IMAGES_DIR"/*)
            for ((i=${#images[@]}-1; i>=0; i--)); do
                img="${images[$i]}"
                if [[ -f "$img" ]]; then
                    img_name=$(basename "$img")
                    echo "    <div id=\"$img_name\" class=\"lightbox\">" >> "$OUTPUT_FILE"
                    echo "        <a href=\"#\" class=\"lightbox-close\">&times;</a>" >> "$OUTPUT_FILE"
                    echo "        <img src=\"images/$img_name\" alt=\"$img_name\">" >> "$OUTPUT_FILE"
                    echo "    </div>" >> "$OUTPUT_FILE"
                fi
            done
        else
            echo "$line" >> "$OUTPUT_FILE"
        fi
    done < "$template"
done

# Copy assets
cp -r "$ASSETS_DIR"/* "$OUTPUT_DIR/"

# Copy images
cp -r "$IMAGES_DIR" "$OUTPUT_DIR/"

echo "Gallery generated successfully in $OUTPUT_DIR/index.html"
