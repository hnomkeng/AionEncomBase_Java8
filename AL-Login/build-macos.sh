#!/bin/bash
# Build AL-Login on macOS
echo "Building AL-Login..."
cd "$(dirname "$0")"
ant clean dist
echo "AL-Login build completed!"
