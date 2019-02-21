FROM openjdk:8-jdk-alpine

MAINTAINER futao@ghostcloud.cn

COPY apache-skywalking-apm-incubating /apache-skywalking-apm-incubating

WORKDIR /apache-skywalking-apm-incubating

COPY docker-entrypoint.sh .

# agent/config/agent.config
ENV SW_AGENT_COLLECTOR_BACKEND_SERVICES=172.0.0.1:11800

# config/application.yml
ENV SW_CORE_REST_HOST=0.0.0.0
ENV SW_CORE_REST_PORT=12800
ENV SW_CORE_GRPC_HOST=0.0.0.0
ENV SW_CORE_GRPC_PORT=11800

ENV SW_STORAGE_ES_CLUSTER_NODES=localhost:9200
ENV SW_STORAGE_ES_INDEX_SHARDS_NUMBER=2
ENV SW_STORAGE_ES_INDEX_REPLICAS_NUMBER=0
ENV SW_STORAGE_ES_BULK_ACTIONS=2000
ENV SW_STORAGE_ES_BULK_SIZE=20
ENV SW_STORAGE_ES_FLUSH_INTERVAL=10
ENV SW_STORAGE_ES_CONCURRENT_REQUESTS=2

# webapp/webapp.yml,Point to all backend's restHost:restPort, split by ,
ENV SW_COLLECTOR_RIBBON_LISTOFSERVERS=127.0.0.1:12800

EXPOSE 8080 11800 12800

ENTRYPOINT ["sh", "./docker-entrypoint.sh"]

