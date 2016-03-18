#!/usr/bin/env bash

FILES=()
GEOJSON_DIR="$1geojson"
TOLERANCE=${2:-0.005}

if [ -d "$1" ]; then
  FILES="$1*.kml"
fi

rm -rf "$GEOJSON_DIR"
mkdir -p "$GEOJSON_DIR"

echo "Tolerance set to: $TOLERANCE"
for f in $FILES
do
  FILENAME=$(basename "$f")
  echo "converting $f to geojson and simplifying"
  togeojson "$f" | simplify-geojson -t $TOLERANCE > "$GEOJSON_DIR/${FILENAME%.*}.geojson"
done

echo "merging files into $GEOJSON_DIR/!merged.geojson"
GEOJSON_FILES=("$GEOJSON_DIR/*.geojson")
geojson-merge $GEOJSON_FILES > "$GEOJSON_DIR/!merged.geojson"
