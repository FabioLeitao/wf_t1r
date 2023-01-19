#!/bin/bash
# shell script para criar a imagem customizada no Docker
COMANDO=$0
VERSAO_SOLICITADA=$1

function ajuda_(){
        echo "Usage: $COMANDO [TAG da imagem para usar no service do docker em swarm] [-h|--help]" >&2 ;
}

function cria_serv_(){
	docker service create \
	--detach=false \
	--replicas 1 \
	--mode=replicated \
	--reserve-cpu 0.2 \
	--reserve-memory 256MB \
	--limit-cpu 2 \
	--limit-memory 4GB \
	--restart-condition=on-failure \
	--update-delay 20s \
	--publish mode=host,target=8080,published=8080,protocol=tcp \
	--publish mode=host,target=9990,published=9990,protocol=tcp \
	--mount type=bind,source=/Dockerfile/wildfly/bin_${WILD},destination=/opt/wildfly/bin \
	--mount type=bind,source=/Dockerfile/wildfly/log_${WILD},destination=/opt/wildfly/standalone/log \
	--mount type=bind,source=/Dockerfile/wildfly/configuration_${WILD},destination=/opt/wildfly/standalone/configuration \
	--mount type=bind,source=/Dockerfile/wildfly/deployment,destination=/opt/wildfly/standalone/deployments \
	--host host.docker.internal:172.17.0.1 \
	--name tosp \
	wildfly_t1r:${VERSAO_SOLICITADA}
}

if [ $# -lt 1 ]; then
	ajuda_;
else
  case "${VERSAO_SOLICITADA}" in
	-h|--help)
		ajuda_ ;
		;;
	*w17.*)
		WILD=w17
		;;
	*w22.*)
		WILD=w22
		;;
	*w26.*)
		WILD=w26
		;;
	*w27.*)
 		WILD=w27
		;;
  esac
  cria_serv_ ;
fi
