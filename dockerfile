# Indicar cuál versión de Node.js y Linux se utilizará
FROM node:24-slim

# Indicar la carpeta de trabajo en la imagen Docker
WORKDIR /app

# Copiar los archivos de configuración del proyecto package.json y package-lock.json
COPY package*.json .

#Obtener los módulos (dependencias) del proyecto
RUN npm install && npm cache clean --force && rm -rf /tmp/ /root/.npm/_cacahe

# copiar el resto de los archivos del proyecto
COPY . .

# Exponer el  puerto de salida (interno del contenedor)
EXPOSE 8000

# Arrancar la aplicación en el contenedor
# CMD ["node", "app.js"]
CMD ["npm", "start"]

