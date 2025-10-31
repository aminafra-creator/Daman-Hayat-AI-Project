#!/bin/bash
# Slide Update Script - Apply USD conversions and content updates

SLIDES_DIR="/home/ubuntu/Daman-Hayat-AI-Project/presentation/slides"

echo "Starting slide updates..."

# Convert AED to USD (rounded values)
find "$SLIDES_DIR" -name "*.html" -type f -exec sed -i \
  -e 's/AED 100/$30/g' \
  -e 's/AED 1,000/$270/g' \
  -e 's/AED 5,000/$1,400/g' \
  -e 's/AED 367-734/$100-200/g' \
  -e 's/AED 11B/$3.0B (verified from AED 11B)/g' \
  {} \;

echo "Currency conversions applied"
echo "Ready for manual content updates (cancer detection, CVD messaging, purple borders)"
