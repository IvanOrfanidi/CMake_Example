## Example of building an using CMake

### Build using CMake
```sh
mkdir build
cd build
cmake -G "Unix Makefiles"
cmake --build .
```

### Build using Docker

#### Building:
```sh
docker build -t cmake_example:latest .
```

#### Running:
```sh
docker run -it --rm cmake_example
```

#### Extraction:
```sh
docker create -it --name dummy cmake_example:latest bash
docker cp dummy:/CMake_Example/build/cmake_example .
rm -rf build/
mkdir build/
mv cmake_example build/
docker rm -f dummy
```