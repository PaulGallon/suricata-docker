FROM ubuntu:16.04

RUN apt-get update && \
    apt-get upgrade && \
    apt-get install -y --no-install-recommends \
        software-properties-common \
        python-pip \
        python-yaml \
        python-setuptools

RUN add-apt-repository ppa:oisf/suricata-stable && \
    apt-get update && \
    apt-get install -y suricata

RUN pip install --upgrade pip

RUN pip install --pre --upgrade suricata-update && suricata-update

ADD suricata.yaml /etc/suricata/

VOLUME /var/log/suricata

ENTRYPOINT ["/usr/bin/suricata"]
