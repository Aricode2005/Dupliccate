# STAGE 1: Build (The Compiler)
FROM gcc:latest AS builder

# Create and set the working directory
WORKDIR /usr/src/app

# Copy your source code and index.html
# This includes server.cpp, httplib.h, and index.html
COPY . .

# Compile for Linux. 
# NOTE: We remove -lws2_32 because it doesn't exist on Linux.
# We add -lpthread because Linux needs it for the server threads.
RUN g++ -O3 server.cpp -o server -lpthread

# STAGE 2: Run (The Smallest possible image)
FROM debian:bookworm-slim

# Install necessary runtime libraries
RUN apt-get update && apt-get install -y libstdc++6 && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy only the compiled program and the HTML from the builder stage
COPY --from=builder /usr/src/app/server .
COPY --from=builder /usr/src/app/index.html .
# If you have a CSV data file, uncomment the next line:
# COPY --from=builder /usr/src/app/adani_ports.csv .

# Set the default port for Render
EXPOSE 10000

# Start the server
CMD ["./server"]