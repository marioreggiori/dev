FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu

WORKDIR /tmp

RUN apt update && apt install -y \
    build-essential git protobuf-compiler && \
    mkdir -p /home/vscode/.dev


# Install Golang
RUN wget https://golang.org/dl/go1.16.6.linux-amd64.tar.gz && \
    sudo tar -C /usr/local -xzf go1.16.6.linux-amd64.tar.gz && \
    rm go1.16.6.linux-amd64.tar.gz
ENV PATH="${PATH}:/usr/local/go/bin:$(go env GOPATH)/bin"

USER vscode
RUN go install golang.org/x/tools/gopls@latest && \
    go install github.com/go-delve/delve/cmd/dlv@latest && \
    go install github.com/uudashr/gopkgs/v2/cmd/gopkgs@latest && \
    go install github.com/ramya-rao-a/go-outline@latest && \
    go install honnef.co/go/tools/cmd/staticcheck@latest


# Install Golang proto tools
RUN go install google.golang.org/protobuf/cmd/protoc-gen-go@latest && \
    go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest

USER root

# Install Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash - && \
    sudo apt-get install -y nodejs

# Install grpc-web protoc tools
RUN sudo wget -O /usr/local/bin/protoc-gen-grpc-web https://github.com/grpc/grpc-web/releases/download/1.2.1/protoc-gen-grpc-web-1.2.1-linux-x86_64 && \
    sudo chmod +x /usr/local/bin/protoc-gen-grpc-web

# Install Flutter
RUN apt install -y curl zip unzip xz-utils && \
    wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_2.2.3-stable.tar.xz && \
    tar -C /home/vscode/.dev/ -xf flutter_linux_2.2.3-stable.tar.xz && \
    rm flutter_linux_2.2.3-stable.tar.xz && \
    chown -R vscode:vscode /home/vscode/.dev
ENV PATH="${PATH}:/home/vscode/.dev/flutter/bin"

USER vscode

RUN flutter config --no-analytics && \
    flutter precache
