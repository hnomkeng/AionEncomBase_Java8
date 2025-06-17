#!/bin/bash
# Aion Encom Base - macOS Build Script
# Make sure you have Java 8 installed and JAVA_HOME set correctly

set -e  # Exit on any error

echo "=== Aion Encom Base - macOS Build Script ==="
echo "Current directory: $(pwd)"
echo "Java version check:"
java -version

# Check if Java 8 is installed
JAVA_VERSION=$(java -version 2>&1 | grep -oP 'version "\K[^"]+' | head -1)
if [[ ! $JAVA_VERSION == 1.8* ]]; then
    echo "Error: Java 8 is required. Current version: $JAVA_VERSION"
    echo "Please install Java 8 and set JAVA_HOME correctly"
    exit 1
fi

echo "✓ Java 8 detected: $JAVA_VERSION"

# Check if ant is installed
if ! command -v ant &> /dev/null; then
    echo "Error: Apache Ant is not installed."
    echo "Please install Ant using: brew install ant"
    exit 1
fi

echo "✓ Apache Ant detected: $(ant -version)"

# Build AL-Commons first
echo ""
echo "=== Building AL-Commons ==="
cd AL-Commons
if [ -f "build.xml" ]; then
    ant clean jar
    echo "✓ AL-Commons build completed"
else
    echo "Error: build.xml not found in AL-Commons directory"
    exit 1
fi

# Go back to root directory
cd ..

# Build AL-Login
echo ""
echo "=== Building AL-Login ==="
cd AL-Login
if [ -f "build.xml" ]; then
    ant clean dist
    echo "✓ AL-Login build completed"
else
    echo "Error: build.xml not found in AL-Login directory"
    exit 1
fi

# Go back to root directory
cd ..

# Build AL-Game
echo ""
echo "=== Building AL-Game ==="
cd AL-Game
if [ -f "build.xml" ]; then
    ant clean dist
    echo "✓ AL-Game build completed"
else
    echo "Error: build.xml not found in AL-Game directory"
    exit 1
fi

# Go back to root directory
cd ..

echo ""
echo "=== Build Summary ==="
echo "✓ All components built successfully!"
echo ""
echo "Build artifacts location:"
echo "- AL-Commons: AL-Commons/build/"
echo "- AL-Login: AL-Login/build/dist/"
echo "- AL-Game: AL-Game/build/dist/"
echo ""
echo "To run the servers:"
echo "1. Set up your database using the SQL files in each component's sql/ directory"
echo "2. Configure the properties files in each component's config/ directory"
echo "3. Run AL-Login server first, then AL-Game server"
