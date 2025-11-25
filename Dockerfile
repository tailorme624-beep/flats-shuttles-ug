# This Dockerfile builds a Flutter APK for your project
# Uses a community image with Android SDK and Flutter pre-installed
FROM cirrusci/flutter:latest

# Set working directory inside the container
WORKDIR /app

# Copy pubspec files first and download dependencies (use Docker cache efficiently)
COPY pubspec.* ./
RUN flutter pub get

# Copy the rest of the Flutter application
COPY . .

# Build the release APK
RUN flutter build apk --release

# The APK will be output to: build/app/outputs/flutter-apk/app-release.apk
# To extract it, run the container with a volume: 
# docker run --rm -v $PWD/build/app/outputs/flutter-apk:/output flutter-apk-builder cp build/app/outputs/flutter-apk/app-release.apk /output/