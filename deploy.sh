#!/bin/bash
set -e

echo "🚀 Starting deployment process..."

# Clone repository
REPO_URL="https://github.com/AlikhanTurash/genotek-test-app.git"
CLONE_DIR=".temp_clone"

echo "📥 Cloning repository..."
git clone $REPO_URL $CLONE_DIR
cd $CLONE_DIR

# Install dependencies
echo "🔧 Installing dependencies..."
flutter pub get

# Run code analysis
echo "🔍 Running code analysis..."
flutter analyze

# Run tests
echo "🧪 Running tests..."
flutter test

# Build applications
echo "🏗 Building applications..."
flutter build apk --release
flutter build ios --release
flutter build macos --release

# Generate artifacts
echo "📦 Packaging artifacts..."
mkdir -p release_builds
cp build/app/outputs/flutter-apk/app-release.apk release_builds/
cp build/ios/iphoneos/Runner.app release_builds/
cp build/macos/Build/Products/Release/genotek_prices.app release_builds/

echo "✅ Build completed successfully!"
echo ""
echo "📱 Installation instructions:"
echo "Android:"
echo "  adb install release_builds/app-release.apk"
echo "iOS:"
echo "  xcrun simctl install booted release_builds/Runner.app"
echo "macOS:"
echo "  open release_builds/genotek_prices.app"

# Cleanup
cd ..
rm -rf $CLONE_DIR