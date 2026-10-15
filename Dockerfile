# Build VelurajMart with Ubuntu's packaged Drogon, JsonCpp, UUID, libcurl, and PostgreSQL libraries.
FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        cmake \
        pkg-config \
        ca-certificates \
        libdrogon-dev \
        libjsoncpp-dev \
        uuid-dev \
        libcurl4-openssl-dev \
        libpq-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy the source, build configuration, and frontend served by Drogon.
COPY CMakeLists.txt main.cc velurajmart.html ./

RUN cmake -S . -B build -DCMAKE_BUILD_TYPE=Release \
    && cmake --build build --config Release --parallel 2

ENV PORT=8080
EXPOSE 8080

# main.cc reads Render's PORT variable and serves velurajmart.html from /app.
CMD ["./build/VelurajMart"]
