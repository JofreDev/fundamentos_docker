### Queremos que se base en nodeJS y por lo tanto pasamos el nombre de la img
FROM node:18

## Donde va a contener la app (ruta en el contenedor !!!!)
RUN mkdir -p /home/app

### Dirección del codigo fuente en el SO (Accede a los archivos del SO)
### (ruta donde está el codigo fuente '.' y despues el destino '/home/app')
COPY  . /home/app

### Puerto de ejecución de la app

EXPOSE 3000

CMD ["node","/home/app/index.js"]