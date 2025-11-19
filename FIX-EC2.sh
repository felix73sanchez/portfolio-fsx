#!/bin/bash
# Script para arreglar el deployment en EC2

echo "🔧 Arreglando portfolio en EC2..."

cd ~/portfolio || exit 1

# 1. Detener todos los contenedores
echo "📦 Deteniendo contenedores..."
docker-compose down

# 2. Limpiar contenedores e imágenes antiguas
echo "🧹 Limpiando recursos antiguos..."
docker system prune -af --volumes

# 3. Clonar o actualizar el repositorio
echo "📥 Actualizando código..."
if [ -d ".git" ]; then
    git pull origin master
else
    cd ~
    rm -rf portfolio
    git clone https://github.com/felix73sanchez/portfolio-fsx.git portfolio
    cd portfolio
fi

# 4. Construir imagen localmente con el fix
echo "🏗️ Construyendo nueva imagen..."
docker build -t ghcr.io/felix73sanchez/portfolio-fsx:latest .

# 5. Iniciar servicios
echo "🚀 Iniciando servicios..."
docker-compose up -d

# 6. Esperar 15 segundos
echo "⏳ Esperando a que los contenedores estén listos..."
sleep 15

# 7. Verificar estado
echo ""
echo "📊 Estado de los contenedores:"
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"

echo ""
echo "🔍 Verificando healthcheck..."
sleep 30
docker ps --format "table {{.Names}}\t{{.Status}}"

echo ""
echo "🌐 Probando acceso local..."
curl -I http://localhost

echo ""
echo "🔒 Verificando certificados SSL..."
docker logs --tail 20 letsencrypt

echo ""
echo "✅ Proceso completado!"
echo "🌐 Verifica tu sitio en: https://fsxsys.dpdns.org"
