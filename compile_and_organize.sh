#!/bin/bash

BASE_DIR="/Users/wanghley/Workspace/projects/duke-ece280-lab-redesign"
SRC_DIR="$BASE_DIR/src"
OUTPUT_DIR="$BASE_DIR/output"

# Loop through each lab folder
for lab_folder in "$SRC_DIR"/*/ ; do
    folder_name=$(basename "$lab_folder")
    
    # Extract the lab number (first 2 digits)
    lab_num=$(echo "$folder_name" | grep -oE "^[0-9]{2}")
    
    # Skip if not a numbered lab folder
    if [ -z "$lab_num" ]; then
        continue
    fi
    
    echo "Processing Lab $lab_num: $folder_name"
    
    # Compile all .tex files in this folder
    cd "$lab_folder"
    
    for tex_file in *.tex; do
        if [ -f "$tex_file" ]; then
            echo "  Compiling: $tex_file"
            # Run pdflatex twice to resolve references
            pdflatex -interaction=nonstopmode "$tex_file" > /dev/null 2>&1
            pdflatex -interaction=nonstopmode "$tex_file" > /dev/null 2>&1
            
            # Get the PDF name (same as tex file but with .pdf extension)
            pdf_file="${tex_file%.tex}.pdf"
            
            if [ -f "$pdf_file" ]; then
                echo "    Generated: $pdf_file"
                # Move to output folder
                mv "$pdf_file" "$OUTPUT_DIR/$lab_num/"
                echo "    Moved to: output/$lab_num/"
            fi
        fi
    done
    
    # Clean up auxiliary files
    rm -f *.aux *.log *.toc *.out 2>/dev/null
    
done

echo "Done! All PDFs have been compiled and organized."
