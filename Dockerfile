FROM alpine:3.16

ENV VER=1.3.0

RUN wget https://github.com/prometheus-community/elasticsearch_exporter/releases/download/v${VER}/elasticsearch_exporter-${VER}.linux-amd64.tar.gz \
    && tar xvf elasticsearch_exporter-${VER}.linux-amd64.tar.gz \
    && cp elasticsearch_exporter-${VER}.linux-amd64/elasticsearch_exporter /usr/bin

EXPOSE 9114

ENTRYPOINT ["elasticsearch_exporter", "--es.url", "${ES_URL}", "--es.apiKey", "${ES_APIKEY}"]