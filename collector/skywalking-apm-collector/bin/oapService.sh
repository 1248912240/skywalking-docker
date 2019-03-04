# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#!/usr/bin/env sh

sed -i "s/{{SW_AGENT_COLLECTOR_BACKEND_SERVICES}}/${SW_AGENT_COLLECTOR_BACKEND_SERVICES}/g" agent/config/agent.config

cat agent/config/agent.config

 sed -i "s/{{SW_CORE_REST_HOST}}/${SW_CORE_REST_HOST}/g" config/application.yml
 sed -i "s/{{SW_CORE_REST_PORT}}/${SW_CORE_REST_PORT}/g" config/application.yml
 sed -i "s/{{SW_CORE_GRPC_HOST}}/${SW_CORE_GRPC_HOST}/g" config/application.yml
 sed -i "s/{{SW_CORE_GRPC_PORT}}/${SW_CORE_GRPC_PORT}/g" config/application.yml

 sed -i "s/{{SW_STORAGE_ES_CLUSTER_NODES}}/${SW_STORAGE_ES_CLUSTER_NODES}/g" config/application.yml
 sed -i "s/{{SW_STORAGE_ES_INDEX_SHARDS_NUMBER}}/${SW_STORAGE_ES_INDEX_SHARDS_NUMBER}/g" config/application.yml
 sed -i "s/{{SW_STORAGE_ES_INDEX_REPLICAS_NUMBER}}/${SW_STORAGE_ES_INDEX_REPLICAS_NUMBER}/g" config/application.yml
 sed -i "s/{{SW_STORAGE_ES_BULK_ACTIONS}}/${SW_STORAGE_ES_BULK_ACTIONS}/g" config/application.yml
 sed -i "s/{{SW_STORAGE_ES_BULK_SIZE}}/${SW_STORAGE_ES_BULK_SIZE}/g" config/application.yml
 sed -i "s/{{SW_STORAGE_ES_FLUSH_INTERVAL}}/${SW_STORAGE_ES_FLUSH_INTERVAL}/g" config/application.yml
 sed -i "s/{{SW_STORAGE_ES_CONCURRENT_REQUESTS}}/${SW_STORAGE_ES_CONCURRENT_REQUESTS}/g" config/application.yml

cat config/application.yml

date

TZ='Asia/Shanghai';

export TZ

date

PRG="$0"
PRGDIR=`dirname "$PRG"`
[ -z "$OAP_HOME" ] && OAP_HOME=`cd "$PRGDIR/.." >/dev/null; pwd`

OAP_LOG_DIR="${OAP_HOME}/logs"
JAVA_OPTS=" -Xms256M -Xmx512M"

if [ ! -d "${OAP_HOME}/logs" ]; then
    mkdir -p "${OAP_LOG_DIR}"
fi

_RUNJAVA=${JAVA_HOME}/bin/java
[ -z "$JAVA_HOME" ] && _RUNJAVA=java

CLASSPATH="$OAP_HOME/config:$CLASSPATH"
for i in "$OAP_HOME"/oap-libs/*.jar
do
    CLASSPATH="$i:$CLASSPATH"
done

OAP_OPTIONS=" -Doap.logDir=${OAP_LOG_DIR}"

echo "SkyWalking OAP starting!!!"

$_RUNJAVA ${JAVA_OPTS} ${OAP_OPTIONS} -classpath $CLASSPATH org.apache.skywalking.oap.server.starter.OAPServerStartUp
