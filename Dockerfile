FROM fedora:34

RUN dnf -y update
RUN dnf -y install python3-pip python3-wheel python3-setuptools make git hadolint
RUN dnf clean all

RUN git clone https://github.com/Iolaum/podcust.git /src
WORKDIR /src/
RUN pip install --no-cache-dir .[dev]
RUN chmod +x /src/entrypoint.sh
ENTRYPOINT ["/src/entrypoint.sh"]