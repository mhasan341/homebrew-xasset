#!/bin/bash

# Function to generate Swift enum based on folder names
generate_enum() {
  local folder=$1
  local nested=$2

  # Check if the folder exists
  if [ -d "$folder" ]; then
    # Print the enum header
    echo "enum AssetFolder: String {"

    # List items in the folder
    for item in "$folder"/*; do
      # Check if the item is a directory and has a .imageset or .colorset extension
      if [ -d "$item" ] && { [ "${item##*.}" == "imageset" ] || [ "${item##*.}" == "colorset" ]; }; then
        # Get the folder name without extension
        folder_name=$(basename "$item")
        echo "    case ${folder_name%.*} = \"${folder_name%.*}\"" # Print the enum case
      elif [ -d "$item" ] && [ "$nested" == "true" ]; then
        # Recursively generate enum for nested folders
        generate_enum "$item" "$nested"
      fi
    done

    # Print the enum footer
    echo "}"
  else
    echo "Folder not found: $folder"
  fi
}

# Default values
folder="Assets.xcassets"
nested="false"

# Parse command line arguments
while [ "$#" -gt 0 ]; do
  case "$1" in
    -n|--nested)
      nested="true"
      shift
      ;;
    -f|--folder)
      folder="$2"
      shift 2
      ;;
    *)
      echo "Unknown argument: $1"
      exit 1
      ;;
  esac
done

# Check if the provided folder is a relative path
if [[ "$folder" != "Assets.xcassets" ]]; then
    folder="Assets.xcassets/$folder"
fi

# Generate Swift enum based on the specified folder
if [ -d "$folder" ]; then

    generate_enum "$folder" "$nested" > AssetEnum.swift
    echo "Successfully generated enum file"
else
    echo "Folder not found: $folder"
fi
