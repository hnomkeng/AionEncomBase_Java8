#!/bin/bash
# Build AL-Commons on macOS
echo "Building AL-Commons..."
cd "$(dirname "$0")"
ant clean jar
echo "AL-Commons build completed!"
