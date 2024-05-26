FROM ubuntu:20.04
RUN apt-get update && apt-get install -y \
    wget \
    build-essential \
    libssl-dev
RUN apt-get remove -y cmake
RUN wget https://github.com/Kitware/CMake/releases/download/v3.28.3/cmake-3.28.3-linux-x86_64.sh
RUN chmod +x cmake-3.28.3-linux-x86_64.sh
RUN ./cmake-3.28.3-linux-x86_64.sh --skip-license --prefix=/usr/local

RUN apt-get install -y \
    gcc \
    g++ \
    make

COPY . /print/
WORKDIR /print

RUN cmake -H. -B_build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=_install
RUN cmake --build _build
RUN cmake --build _build --target install
