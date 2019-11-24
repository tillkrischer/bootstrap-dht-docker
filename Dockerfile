FROM ubuntu
RUN apt-get update
RUN apt-get install -y git libboost-all-dev
RUN git clone https://github.com/bittorrent/bootstrap-dht.git
WORKDIR bootstrap-dht
RUN b2
EXPOSE 6881/tcp
EXPOSE 6881/udp
CMD ./dht-bootstrap $IP