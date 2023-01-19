#!/bin/bash
# shell script para criar a imagem customizada no Docker
COMANDO=$0
VERSAO_SOLICITADA=$1

function ajuda_(){
        echo "Usage: $COMANDO [TAG para usar na imagem do docker] [-h|--help]" >&2 ;
}

function cria_versao(){
	docker build --no-cache -t wildfly_t1r:${VERSAO_SOLICITADA} ..
}

if [ $# -lt 1 ]; then
	ajuda_;
else
  case "${VERSAO_SOLICITADA}" in
	-h|--help)
		ajuda_;
		;;
	*)
		cria_versao;
		;;
  esac
fi
