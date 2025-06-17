# Aion Encom Base - macOS Build Guide

## Prerequisites

### 1. Install Java 8
```bash
# Using Homebrew (recommended)
brew install openjdk@8

# Set JAVA_HOME (add to your ~/.zshrc or ~/.bash_profile)
export JAVA_HOME="/opt/homebrew/opt/openjdk@8/libexec/openjdk.jdk/Contents/Home"
export PATH="$JAVA_HOME/bin:$PATH"
```

### 2. Install Apache Ant
```bash
# Using Homebrew
brew install ant
```

### 3. Verify Installation
```bash
java -version    # Should show Java 8
ant -version     # Should show Apache Ant version
```

## Building the Project

### Option 1: Build All Components (Recommended)
```bash
# Navigate to project root
cd /Users/hnomkeng/Documents/GitHub/AionEncomBase_Java8

# Run the complete build script
./build-macos.sh
```

### Option 2: Build Individual Components
```bash
# Build AL-Commons first (required by others)
cd AL-Commons
./build-macos.sh

# Build AL-Login
cd ../AL-Login
./build-macos.sh

# Build AL-Game
cd ../AL-Game
./build-macos.sh
```

### Option 3: Manual Build with Ant
```bash
# AL-Commons
cd AL-Commons
ant clean jar

# AL-Login
cd ../AL-Login
ant clean dist

# AL-Game
cd ../AL-Game
ant clean dist
```

## Build Output Locations

- **AL-Commons**: `AL-Commons/build/al-commons.jar`
- **AL-Login**: `AL-Login/build/dist/AL-Login/`
- **AL-Game**: `AL-Game/build/dist/AL-Game/`

## Troubleshooting

### Java Version Issues
If you get Java version errors:
```bash
# Check current Java version
java -version

# List installed Java versions
/usr/libexec/java_home -V

# Set Java 8 as default (replace path as needed)
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
```

### Ant Not Found
```bash
# Install Ant if not available
brew install ant

# Or install manually from Apache Ant website
```

### Permission Denied
```bash
# Make scripts executable
chmod +x build-macos.sh
chmod +x AL-*/build-macos.sh
```

## Running the Servers

1. **Setup Database**: Import SQL files from each component's `sql/` directory
2. **Configure**: Edit properties files in each component's `config/` directory
3. **Start AL-Login** first, then **AL-Game**

## Notes

- This project requires Java 8 specifically
- Build order matters: AL-Commons → AL-Login → AL-Game
- Make sure your database is properly configured before running servers
