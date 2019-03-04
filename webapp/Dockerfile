FROM internal-registry.ghostcloud.cn/venus/ubuntu-jdk8:16.04.1

MAINTAINER futao@ghostcloud.cn

COPY skywalking-apm-webapp /skywalking-apm-webapp

WORKDIR /skywalking-apm-webapp

# agent/config/agent.config
ENV SW_AGENT_COLLECTOR_BACKEND_SERVICES=192.168.0.151:11800

# webapp/webapp.yml,Point to all backend's restHost:restPort, split by ,
ENV SW_COLLECTOR_RIBBON_LISTOFSERVERS=192.168.0.151:12800

EXPOSE 8080

ENTRYPOINT ["sh", "bin/webappService.sh"]