#!/bin/bash

# Este script crea un archivo .env con valores por defecto si no existe ya, 
# para evitar sobrescribir configuraciones existentes:

# Detener la ejecución si ocurre un error
set -e

# Nombre del archivo .env
ENV_FILE=".env"

# Verificar si el archivo .env ya existe
if [ -f "$ENV_FILE" ]; then
  echo "El archivo $ENV_FILE ya existe. No se realizaron cambios."
else
  echo "Creando archivo $ENV_FILE con valores por defecto..."

  # Crear el archivo .env con las variables de entorno por defecto
  cat <<EOL > $ENV_FILE
# Configuración por defecto
PORT_BACKEND=3032
DATABASE_HOST=postgresdb
DATABASE_USER=postgres
DATABASE_PASSWORD=mysecretpassword
DATABASE_NAME=postgres
DATABASE_ESQUEMA=public
DATABASE_PORT=5432
DATABASE_TYPE=postgress

JWT_SECRET=RDsEdssdtQ09UMUM8329dsjdtYzNudHIwc3Vsy
SECURITY_KEY=Q2VudHJvIsdssdsdFN1ciAstIFBPUlRBTCBDSVVEQUsRdsdsdBTk8gLSdsdAyMDIz

ADMIN_NAME=Juan Pablo Hurtado
ADMIN_PASSWORD=123456
ADMIN_EMAIL=juanpablo.jpho@gmail.com

#nginx
NUM_CONNECTIONS=5000

# app
LOGO_URL=assets/logos/logo-empresa.png
FAVICON_URL=assets/favicons/favicon.png
MINISTERIO_URL=assets/imagenes/logo-ministerio.png
MAX_HEIGHT_TABLE=600
MAX_ROW_IN_TABLE=20
ALIMENTADORES_INDUSTRIALES=["0421/CABECERA", "0426/CABECERA"]
TITLE=Programación de cortes
DESCRIPTION=Encuentra aquí los cortes programados
EOL

  echo "Archivo $ENV_FILE creado correctamente."
fi