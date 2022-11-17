# Aplicacion de ejemplo para curso de Docker.

# fundamentos docker

Fuente : Canal Hola Mundo

# Comandos

## Imagenes 

* **Listar las imagenes** : docker images
* **Descargar una imagen** : docker pull <nombre_imagen:versión>
    * ejemplo : docker pull node:18
    * ejemplo : docker pull node
    * ejemplo : docker pull mongo

* **Eliminar una imagen en concreto** : docker image rm <nombre_imagen:versión>
    * ejemplo : docker image rm node:18

* **Crear imagen con base en un fichero 'Dockerfile'** : docker **build** **-t** <nombre_asignación:versión> <ruta_proyecto>
    * ejemplo : docker build -t **miapp:1.0** .  

## Contenedores
#### Se puede crear contenedores de varias formas 
* **Crear un contenedor** : docker create <nombre_imagen> 
* **Crear un contenedor** : docker container create <nombre_imagen> 
    * ejemplo : docker create mongo 
* **Ejecutar contenedor** : docker start <id_contenedor>
* **Ejecutar contenedor** : docker start <nombre_contenedor>
    * ejemplo : docker start mongous
    * ejemplo : docker start 74yr807y43r087fyh03847r3407
* **Detender contenedor** : docker stop <nombre_contenedor>
    * ejemplo : docker stop mongous
* **Listar contenedores en ejecución** : docker ps
* **Listar contenedores en general** : docker ps -a
* **Eliminar contenedor** : docker rm <nombre_contenedor>
* **Crear contenedor con nombre específico** : docker create --name <nombre_contenedor> <nombre_imagen>
    * ejemplo : docker create --name mongous mongo  
* **mapear puerto de docker a SO** : docker create -p<puerto_maquina:puerto_docker> --name <nombre_contenedor> <nombre_imagen>
    * ejemplo : docker create -p27017:27017 -p27017:27017  mongo 

* **Generar logs del contenedor** : docker logs <nombre_contenedor>
    * ejemplo : docker logs mongous

* **Generar logs de manera persistente del contenedor** : docker logs --follow <nombre_contenedor>
* **Combinación de pull, create y start** : docker run <nombre_imagen>
* **run en modo detached** (sin mostrar logs) : docker run -d <nombre_imagen>
* **Docker run con parámetros** : docker run --name <nombre_contenedor> -p<puerto_maquina:puerto_docker> -d <nombre_imagen>
    * ejemplo : docker run --name **mongous** **-p27017:27017** -d **mongo**
* **Crear contenedor con variables de entorno** :  docker create -p<puerto_maquina:puerto_docker> --name <nombre_contenedor> **-e** <variable_entorno=valor> **-e** <variable_entorno=valor> -p<puerto_maquina:puerto_docker> <nombre_imagen>
    * ejemplo : docker create -p27017:27017 --name mongous **-e** **MONGO_INITDB_ROOT_USERNAME**=Jofre **-e** **MONGO_INITDB_ROOT_PASSWORD**=password mongo
* **Listar redes 'network' de docker** : docker **network** ls 
* **Crear red** : docker network create <nombre_red>
    * ejemplo : docker **network** create **mired**
* **Crear contenedor enlazado a una red especifica** : docker create -p<puerto_maquina:puerto_docker>  --name <nombre_contenedor> --network <nombre_red> **-e** <variable_entorno=valor> **-e** <variable_entorno=valor> -p<puerto_maquina:puerto_docker> <nombre_imagen>
    * ejemplo : docker create -p27017:27017 --name mongous --network mired **-e** **MONGO_INITDB_ROOT_USERNAME**=Jofre **-e** **MONGO_INITDB_ROOT_PASSWORD**=password mongo

## Docker Compose
* **Ejecutar el fichero docker-compose.yml** : docker compose up 
* **Remover los contenedores** : docker compose down 

## Docker Compose Dev
* **Ejecutar docker-compose-dev** : docker compose -f <nombre_fichero> up
    * ejemplo : docker compose -f **docker-compose-dev.yml** up