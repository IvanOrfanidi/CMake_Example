# Version CMake
cmake_minimum_required(VERSION 3.10)

# Project name
project(cmake_example)

# Source files
set(SOURCES
    src/main.cpp
)

# Compiling target
add_executable(${PROJECT_NAME} ${SOURCES})