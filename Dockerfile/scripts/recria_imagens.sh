#!/bin/bash
COMANDO=$0
ARGUMENTO=$1

function ajuda_(){
	echo "Usage: $COMANDO [-p|--publica|--push] [-h|--help]" >&2 ;
}

function tag_image_(){
	docker tag wildfly_t1r:et-oj${TYPE}${RELEASE}-${OS}_w${SERV} fabioleitao/wildfly_t1r:et-oj${TYPE}${RELEASE}-${OS}_w${SERV} 
}

function push_image_(){
	docker push fabioleitao/wildfly_t1r:et-oj${TYPE}${RELEASE}-${OS}_w${SERV}
}

function arruma_standalone_(){
	cp ../wildfly/standalone.xml.${WILD} ../wildfly/standalone.xml
}

function cria_image_param_(){
	cp ../configs/Dockerfile.et-oj${TYPE}${RELEASE}-${OS}_w${SERV} ../Dockerfile 
	bash -x ./cria_image.sh et-oj${TYPE}${RELEASE}-${OS}_w${SERV}
}

function arruma_param_(){
	for TYPE in re dk ; do
	#for TYPE in re ; do
	#for TYPE in dk ; do
		#for RELEASE in 8 11 17 19 ; do
		#for RELEASE in 11 17 ; do
		for RELEASE in 17; do
			#for OS in a u ; do
			for OS in a ; do
			#for OS in u ; do
				#for SERV in 17.0.1-final 22.0.1-final 26.1.1-final 27.0.1-final ; do
				#for SERV in 27.0.1-final ; do
				for SERV in 26.1.1-final ; do
				#for SERV in 22.0.1-final ; do
				#for SERV in 17.0.1-final ; do
					case "${SERV}" in
						17*)
							WILD=w17;
							;;
						22*)
							WILD=w22;
							;;
						26*)
							WILD=w26;
							;;
						27*)
							WILD=w27;
							;;
					esac
					arruma_standalone_
					cria_image_param_
					case "${ARGUMENTO}" in 
						-p|--publica|--push)
							tag_image_;
							push_image_;
							;;
					esac
				done
			done
		done
	done
}

case "${ARGUMENTO}" in 
	-h|--help)
		ajuda_;
		;;
	*)
		arruma_param_;
		dockerclean	
		;;
esac

