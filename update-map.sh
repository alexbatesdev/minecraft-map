#!/bin/bash

# COMPLETELY UNTESTED AI SCRIPT

# Define variables
BACKUP_DIR="../backups/daily"
EXTRACT_DIR="./temp"
OUTPUT_DIR="./output"
# GITHUB_REPO="https://github.com/yourusername/yourrepo.git"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Find the latest backup file
LATEST_BACKUP=$(ls -t $BACKUP_DIR/minecraft_daily_*.tar.gz | head -n 1)

# Extract the latest backup
mkdir -p $EXTRACT_DIR
tar -xzf $LATEST_BACKUP -C $EXTRACT_DIR

# Run Overviewer to generate the map
overviewer.py --config=/path/to/overviewer_config

# Copy the generated map to the GitHub repository directory
cp -r $OUTPUT_DIR/* $REPO_DIR

# Commit and push the changes to GitHub
git add .
git commit -m "Update map on $TIMESTAMP"
git push origin main

# Clean up
rm -rf $EXTRACT_DIR