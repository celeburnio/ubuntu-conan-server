FROM ubuntu:18.04

RUN apt-get clean && apt-get update
RUN apt-get install -y build-essential git pkg-config cmake ninja-build vim curl python python-pip
RUN git clone https://github.com/conan-io/conan.git && cd conan && git checkout master && pip install -r conans/requirements.txt && pip install -r conans/requirements_server.txt && pip install gunicorn

RUN mkdir -p ~/.conan_server
COPY server.conf /opt/.conan_server/
