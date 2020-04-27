FROM ubuntu:18.04

RUN apt-get clean && apt-get update
RUN apt-get install -y build-essential git pkg-config cmake ninja-build vim curl python python-pip python3.6 python3-pip
RUN pip3 install conan && git clone https://github.com/conan-io/conan.git && cd conan && git checkout master && pip3 install -r conans/requirements.txt && pip3 install -r conans/requirements_server.txt && pip3 install gunicorn

RUN mkdir -p ~/.conan_server
COPY server.conf /opt/.conan_server/


# to run server gunicorn -b 0.0.0.0:9300 -w 4 -t 300 conans.server.server_launcher:app