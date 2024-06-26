FROM ubuntu:22.04
COPY . repo/
WORKDIR repo
VOLUME /home/logs
RUN apt update
RUN apt install -yy gcc g++ cmake
RUN cmake -H. -B_build -DBUILD_TESTS=ON -DBUILD_COVERAGE=ON
RUN cmake --build _build
RUN cmake --build _build --target test -- ARGS=--verbose > /home/logs/log.txt
ENTRYPOINT /bin/ls /home/logs
