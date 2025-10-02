FROM docker.io/ubuntu:24.04

WORKDIR /app

# Copy project files
COPY build.sh /app/
COPY templates /app/templates
COPY assets /app/assets

# Create directories
RUN mkdir -p /app/images /app/output

# Make build script executable
RUN chmod +x /app/build.sh

# Set volumes for images and output
VOLUME ["/app/images", "/app/output"]

CMD ["./build.sh"]
