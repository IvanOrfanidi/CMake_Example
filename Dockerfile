FROM iorfanidi/ubuntu-18.04-gcc-cmake-git:latest

# Label
LABEL maintainer="i.orfanidi@mail.ru"

COPY . /CMake_Example

WORKDIR /CMake_Example

RUN rm -rf build && \
    mkdir build && \
    cd build && \
    cmake -DCMAKE_BUILD_TYPE=Release .. && \
    cmake --build .

CMD ["./build/cmake_example"]