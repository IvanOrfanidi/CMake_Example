FROM ubuntu:18.04

LABEL maintainer="i.orfanidi@mail.ru"

COPY . /CMake_Example

WORKDIR /CMake_Example

RUN apt-get update && \
    apt-get install -y gcc cmake build-essential && \
    rm -rf build && \
    mkdir build && \
    cd build && \
    cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release .. && \
    cmake --build .

CMD ["./build/cmake_example"]