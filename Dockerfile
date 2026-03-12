# STAGE 1: Build
FROM gcc:bookworm AS builder
WORKDIR /usr/src/app

COPY . .

# Compile for Linux
RUN g++ -O3 server.cpp -o server -lpthread

# STAGE 2: Run
FROM debian:bookworm-slim
WORKDIR /app

# Install runtime libraries
RUN apt-get update && apt-get install -y libstdc++6 && rm -rf /var/lib/apt/lists/*

COPY --from=builder /usr/src/app/server .
COPY --from=builder /usr/src/app/index.html .
COPY --from=builder /usr/src/app/data.csv .   

EXPOSE 10000
CMD ["./server"]
