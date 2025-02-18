# Utiliza la imagen base de Node.js
FROM node:18-alpine
# Agrega la documentación acerca del autor
LABEL authors="ivan.ramos@axity.com"
# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app
COPY app/package.json app/yarn.lock ./
# Instala las dependencias de la aplicación
RUN npm install --omit=dev
# Copia el resto de los archivos de la aplicación al directorio de trabajo
COPY app/spec ./spec
COPY app/src ./src
# Utiliza la imagen base de Node.js
CMD ["node", "src/index.js"]
# Expone el puerto en el que se ejecutará la aplicación
EXPOSE 3000
# Define el volumen para persistir los datos
VOLUME /workspaces