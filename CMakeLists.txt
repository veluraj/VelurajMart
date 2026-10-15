cmake_minimum_required(VERSION 3.20)

project(VelurajMart LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

find_package(Drogon CONFIG REQUIRED)
find_package(CURL REQUIRED)
find_package(PostgreSQL REQUIRED)

add_executable(VelurajMart main.cc)

target_link_libraries(VelurajMart PRIVATE
    Drogon::Drogon
    CURL::libcurl
    PostgreSQL::PostgreSQL
)