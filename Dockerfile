# 베이스 이미지를 Ubuntu로 설정
FROM ubuntu:20.04

# 필수 패키지 설치
RUN apt-get update && apt-get install -y \
    cmake \
    g++ \
    make \
    libgl1-mesa-dev \
    libx11-dev \
    libxxf86vm-dev \
    libglew-dev \
    git \
    && rm -rf /var/lib/apt/lists/*

# 작업 디렉토리 설정
WORKDIR /usr/src/doom

# 현재 디렉토리의 모든 파일을 컨테이너의 작업 디렉토리로 복사
COPY . .

# Doom 빌드
RUN cmake .
RUN make

# Doom 실행 명령어
CMD ["./doom"]
