# wf_t1r

A partir dos releases oficiais do imagem container docker do Eclipse Temurin OpenJDK (https://adoptium.net/temurin/releases/), ajustei combinações de condições e versões para avaliar o uso e comportamento em algumas aplicações java (WAR) modificando parâmetros:

* Imagem base do OS: Ubuntu e Alpine
* Versões do openJDK: 8, 11 LTS, 17 e 19
* Edição do openJDK: JRE (mais portátil) e JDK (mais completo, necessário em caso de compilação e para uso de algumas bibliotecas)
* Wildfly: 17.0.1, 22.0.1, 26.1.1, 27.0.1 (experientando níveis de compatibilidade com Jakarta e JavaEE 8, 9 e 10 para comparação de comportamento com JBoss EAP - http://www.mastertheboss.com/jbossas/jboss-eap/what-is-the-difference-between-jboss-eap-wildfly-and-jboss-as/)

Atualmente configurado para utilização dos drivers de JDBC do Oracle DBMS versão 6

Como resultado deste repositorio é criar imagens comitadas para o Docker Hub que poderiam ser baixadas, o ideal é tentar utilizar diretamente os resultados em: 
"docker pull fabioleitao/wildfly_t1r:et-ojdk17-a_w26.1.1-final" (exemplo de imagem montada com openJDK17 rodando Wildfly 26.1.1 em AlpineLinux)

https://hub.docker.com/repository/docker/fabioleitao/wildfly_t1r/general
