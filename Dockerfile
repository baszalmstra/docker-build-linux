FROM ubuntu:14.04.4
MAINTAINER Bas Zalmstra <zalmstra.bas@gmail.com>

RUN echo "deb http://llvm.org/apt/trusty/ llvm-toolchain-trusty main" >> /etc/apt/sources.list && \
    echo "deb-src http://llvm.org/apt/trusty/ llvm-toolchain-trusty main" >> /etc/apt/sources.list && \
    echo "deb http://llvm.org/apt/trusty/ llvm-toolchain-trusty-3.8 main" >> /etc/apt/sources.list && \
    echo "deb-src http://llvm.org/apt/trusty/ llvm-toolchain-trusty-3.8 main" >> /etc/apt/sources.list && \
    apt-get install wget -y && \
    wget -O - http://llvm.org/apt/llvm-snapshot.gpg.key | apt-key add - && \
    apt-get update && apt-get dist-upgrade -y && \
    sudo apt-get install build-essential -y && \
    wget https://cmake.org/files/v3.4/cmake-3.4.3.tar.gz && \
    tar xf cmake-3.4.3.tar.gz && \
    rm -rf cmake-3.4.3.tar.gz && \
    cd cmake-3.4.3 && \
    ./configure && \
    make && \
    sudo make install && \
    cd .. && rm -rf cmake-3.4.3 && \
    sudo apt-get install -y clang-3.8 lldb-3.8 libc++-dev libc++abi-dev libsdl2-dev && \
    sudo update-alternatives --install /usr/bin/cc cc /usr/bin/clang-3.8 100 && \
    sudo update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++-3.8 100 &&  \
    apt-get autoremove -y
