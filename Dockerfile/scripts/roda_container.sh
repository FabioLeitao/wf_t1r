#!/bin/bash
# shell script para rodar a imagem customizada no Docker
COMANDO=$0
VERSAO_SOLICITADA=$1

function ajuda_(){
        echo "Usage: $COMANDO [TAG da imagem para usar no docker] [-h|--help]" >&2 ;
}

function roda_versao_(){
	docker run -it --rm --name tosp -v /Dockerfile/wildfly/deployment:/opt/wildfly/standalone/deployments -v /Dockerfile/wildfly/log_${WILD}:/opt/wildfly/standalone/log -v /Dockerfile/wildfly/configuration_${WILD}:/opt/wildfly/standalone/configuration -v /Dockerfile/wildfly/bin_${WILD}:/opt/wildfly/bin -p 8080:8080 -p 9990:9990 wildfly_t1r:${VERSAO_SOLICITADA}
}

if [ $# -lt 1 ]; then
	ajuda_;
else
  case "${VERSAO_SOLICITADA}" in
	-h|--help)
		ajuda_;
		;;
	*17.0.1*)
		WILD=w17
		;;
	*22.0.1*)
		WILD=w22
		;;
	*26.1.1*)
		WILD=w26
		;;
	*)
		WILD=w27
		;;
  esac
  roda_versao_;
fi
