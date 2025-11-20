# 💼 Portfolio - Felix Sánchez

Portfolio profesional de Felix Sánchez, Ingeniero de Software especializado en desarrollo backend con .NET/C# y Java/Spring Boot.

🌐 **[Ver en Vivo](https://tu-portfolio.vercel.app)**

## 🚀 Tecnologías

- **Framework:** Astro 4.0
- **Lenguaje:** TypeScript
- **Contenido:** MDX (Markdown + React)
- **CMS:** Decap CMS (panel de administración)
- **Estilos:** CSS Vanilla con Custom Properties
- **Deploy:** Vercel
- **Git:** GitHub

## 📁 Estructura del Proyecto

```text
portfolio-fsx/
├── src/
│   ├── layouts/
│   │   └── Layout.astro          # Layout principal con header y footer
│   ├── pages/
│   │   ├── index.astro           # Página principal con experiencia y skills
│   │   ├── proyectos.astro       # Proyectos destacados
│   │   └── blog/
│   │       ├── index.astro       # Listado de artículos
│   │       └── [slug].astro      # Plantilla para posts individuales
│   └── content/
│       ├── config.ts             # Configuración de colecciones
│       └── blog/                 # Artículos en Markdown
├── public/
│   └── favicon.svg               # Favicon del sitio
├── Dockerfile                    # Multi-stage build optimizado
├── docker-compose.yml            # Orquestación de contenedores
├── nginx.conf                    # Configuración del servidor web
└── .github/workflows/
    └── ci-cd.yml                 # Pipeline de despliegue continuo
```

## 🛠️ Comandos

```bash
# Instalar dependencias
npm install

# Desarrollo local con hot reload
npm run dev

# Compilar para producción
npm run build

# Previsualizar build
npm run preview
```

## 🐳 Docker

### Desarrollo Local
```bash
# Build de la imagen
docker build -t portfolio-fsx .

# Ejecutar contenedor simple (sin SSL)
docker run -d -p 8080:80 --name portfolio portfolio-fsx
```

### Producción con HTTPS
```bash
# Deploy completo con SSL automático
docker-compose up -d

# Ver logs
docker-compose logs -f

# Ver estado de Let's Encrypt
docker logs letsencrypt

# Ver certificados generados
docker exec nginx-proxy ls -la /etc/nginx/certs/
```

**Características:**
- ✅ SSL/TLS automático con Let's Encrypt
- ✅ Renovación automática cada 60 días
- ✅ Redirección HTTP → HTTPS
- ✅ HSTS y headers de seguridad

📖 **[Ver guía completa de HTTPS](./HTTPS-SETUP.md)**

## 📝 Contenido del Portfolio

- **Experiencia:** Asociación La Nacional, Banco BDI
- **Skills:** Java, C#, .NET, Spring Boot, Oracle Database, Node.js
- **Proyectos:** Factus, Decade Shop, Microservices Architecture
- **Blog:** Artículos sobre Clean Architecture y Microservicios

## 🚢 Despliegue

El proyecto incluye un pipeline de CI/CD completo con **HTTPS automático**:

1. **Lint & Test** - Validación de código
2. **Build** - Compilación de la aplicación
3. **Docker Build** - Construcción de imagen optimizada
4. **Security Scan** - Análisis de vulnerabilidades con Trivy
5. **Deploy** - Despliegue automático con:
   - Nginx Proxy reverso
   - Let's Encrypt SSL/TLS automático
   - Renovación automática de certificados

### Arquitectura de Producción

```
Internet (HTTPS) → Nginx Proxy (puerto 443) 
                    ↓
                  Let's Encrypt (gestión SSL)
                    ↓
                  Portfolio Container (puerto 80)
```

📖 **[Guía de configuración AWS + HTTPS](./HTTPS-SETUP.md)**

## 📧 Contacto

- **Email:** felixsanchez73@outlook.com
- **LinkedIn:** [felixrsanchez](https://www.linkedin.com/in/felixrsanchez/)
- **GitHub:** [felix73sanchez](https://github.com/felix73sanchez)

---

Desarrollado con ❤️ por Felix Sánchez | Santo Domingo, RD
