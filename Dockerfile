FROM ubuntu AS builder
RUN apt-get update
RUN apt-get install -y git libboost-all-dev
RUN git clone https://github.com/bittorrent/bootstrap-dht.git
WORKDIR bootstrap-dht
RUN b2

FROM ubuntu
COPY --from=builder /bootstrap-dht/dht-bootstrap .
RUN dht-bootstrap $IP