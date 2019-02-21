#!/bin/sh

# sed -i "s/{{SW_AGENT_COLLECTOR_BACKEND_SERVICES}}/${SW_AGENT_COLLECTOR_BACKEND_SERVICES}/g" agent/config/agent.config

cat agent/config/agent.config

# sed -i "s/{{SW_CORE_REST_HOST}}/${SW_CORE_REST_HOST}/g" config/application.yml
# sed -i "s/{{SW_CORE_REST_PORT}}/${SW_CORE_REST_PORT}/g" config/application.yml
# sed -i "s/{{SW_CORE_GRPC_HOST}}/${SW_CORE_GRPC_HOST}/g" config/application.yml
# sed -i "s/{{SW_CORE_GRPC_PORT}}/${SW_CORE_GRPC_PORT}/g" config/application.yml

# sed -i "s/{{SW_STORAGE_ES_CLUSTER_NODES}}/${SW_STORAGE_ES_CLUSTER_NODES}/g" config/application.yml
# sed -i "s/{{SW_STORAGE_ES_INDEX_SHARDS_NUMBER}}/${SW_STORAGE_ES_INDEX_SHARDS_NUMBER}/g" config/application.yml
# sed -i "s/{{SW_STORAGE_ES_INDEX_REPLICAS_NUMBER}}/${SW_STORAGE_ES_INDEX_REPLICAS_NUMBER}/g" config/application.yml
# sed -i "s/{{SW_STORAGE_ES_BULK_ACTIONS}}/${SW_STORAGE_ES_BULK_ACTIONS}/g" config/application.yml
# sed -i "s/{{SW_STORAGE_ES_BULK_SIZE}}/${SW_STORAGE_ES_BULK_SIZE}/g" config/application.yml
# sed -i "s/{{SW_STORAGE_ES_FLUSH_INTERVAL}}/${SW_STORAGE_ES_FLUSH_INTERVAL}/g" config/application.yml
# sed -i "s/{{SW_STORAGE_ES_CONCURRENT_REQUESTS}}/${SW_STORAGE_ES_CONCURRENT_REQUESTS}/g" config/application.yml

cat config/application.yml

# sed -i "s/{{SW_COLLECTOR_RIBBON_LISTOFSERVERS}}/${SW_COLLECTOR_RIBBON_LISTOFSERVERS}/g" webapp/webapp.yml

cat webapp/webapp.yml

bin/startup.sh

exec tail -f logs/skywalking-oap-server.log "$@"