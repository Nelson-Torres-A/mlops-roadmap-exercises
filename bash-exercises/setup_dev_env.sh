#!/bin/bash
versiones(){
if [[ -z $(command -v git) ]];then
	echo "no hay versión de git instalada"
fi
if [[ -z $(command -v docker) ]];then
	echo "no hay versión de docker instalada"
fi
}
clonar_repo(){
for i in "$@";do
	git clone $i
done
}
iniciar_contenedores(){
for i in "$@";do
	docker run $i
done
}

versiones
clonar_repo "https://github.com/octocat/Hello-World"
iniciar_contenedores "hello-world"
