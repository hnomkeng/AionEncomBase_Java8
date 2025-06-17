#!/bin/bash
# Build AL-Game on macOS
echo "Building AL-Game..."
cd "$(dirname "$0")"
ant clean dist
echo "AL-Game build completed!"
