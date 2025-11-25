# Start with the official Dart image since Flutter is built on top of Dart
FROM dart:stable AS dart-base

# Install dependencies for Flutter
RUN apt-get update && \
    apt-get install -y git curl unzip xz-utils zip libglu1-mesa && \
    rm -rf /var/lib/apt/lists/*

# Install Flutter
ENV FLUTTER_VERSION=3.22.1
RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter \n    && git -C /usr/local/flutter checkout $FLUTTER_VERSION \n    && /usr/local/flutter/bin/flutter doctor

# Add Flutter to PATH
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Enable Flutter web
RUN flutter channel stable && flutter upgrade && flutter config --enable-web

# Set working directory inside container
WORKDIR /app

# Copy yaml files and dependency configs first to leverage Docker cache
COPY pubspec.* ./
RUN flutter pub get

# Copy the rest of your Flutter app
COPY . .

# Build the Flutter web app (adjust as needed for your target platform)
RUN flutter build web

# Expose default web port
EXPOSE 5000

# Serve the build using a simple static file server
RUN dart pub global activate dhttpd
CMD ["dhttpd", "--path", "build/web", "--port", "5000"]