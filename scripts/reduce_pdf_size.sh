#!/bin/bash

# Display help message
show_help() {
    echo "Usage: $0 input.pdf output.pdf <screen|ebook|printer|prepress>"
    echo
    echo "Compress a PDF file using Ghostscript with different settings."
    echo
    echo "Arguments:"
    echo "  input.pdf   The path to the input PDF file."
    echo "  output.pdf  The path to the output compressed PDF file."
    echo "  <settings>  The PDF settings for compression. Choose from:"
    echo
    echo "  screen      Low quality and smallest file size (suitable for screen viewing)."
    echo "  ebook       Medium quality and file size (suitable for eBooks)."
    echo "  printer     High quality and larger file size (suitable for printing)."
    echo "  prepress    Highest quality (suitable for professional printing)."
    echo
    echo "Example:"
    echo "  $0 input.pdf output.pdf screen"
}

# Check for help option
if [ "$#" -eq 1 ] && [ "$1" == "--help" ]; then
    show_help
    exit 0
fi

# Check if the correct number of arguments are provided
if [ "$#" -ne 3 ]; then
    echo "Error: Incorrect number of arguments."
    show_help
    exit 1
fi

# Input and output files
INPUT_FILE="$1"
OUTPUT_FILE="$2"
PDF_SETTINGS="$3"

# Check if the chosen PDF settings are valid
case "$PDF_SETTINGS" in
    screen|ebook|printer|prepress)
        ;;
    *)
        echo "Error: Invalid PDF settings. Choose from: screen, ebook, printer, prepress."
        show_help
        exit 1
        ;;
esac

# Check if input file exists
if [ ! -f "$INPUT_FILE" ]; then
    echo "Error: Input file does not exist: $INPUT_FILE"
    exit 1
fi

# Compress the PDF file using Ghostscript
gs -sDEVICE=pdfwrite \
   -dCompatibilityLevel=1.4 \
   -dPDFSETTINGS=/$PDF_SETTINGS \
   -dNOPAUSE \
   -dBATCH \
   -sOutputFile="$OUTPUT_FILE" \
   "$INPUT_FILE"

# Check if the compression was successful
if [ $? -eq 0 ]; then
    echo "PDF compression successful: $OUTPUT_FILE"
else
    echo "PDF compression failed."
    exit 1
fi
