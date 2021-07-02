#!/bin/bash

scp build/cmake_example rock@192.168.109.15:/home/rock/CMake_Example/build && ssh rock@192.168.109.15 gdbserver :4444 CMake_Example/build/cmake_example
