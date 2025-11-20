# 📝 Guía de Deployment en Vercel

## 🚀 Deploy en Vercel

### 1. Crear cuenta en Vercel
- Ve a [vercel.com](https://vercel.com)
- Inicia sesión con tu cuenta de GitHub

### 2. Importar proyecto
1. Click en **"Add New Project"**
2. Selecciona tu repositorio `portfolio-fsx`
3. Vercel detectará automáticamente que es un proyecto Astro
4. Click en **"Deploy"**

¡Listo! Tu portfolio estará en línea en menos de 2 minutos.

---

## 🎨 Panel de Administración (CMS)

### Acceder al Panel
Una vez deployado, accede a:
```
https://tu-portfolio.vercel.app/admin
```

### Configurar Autenticación

#### 1. Habilitar Identity en Netlify (gratis)
Aunque el sitio esté en Vercel, usaremos Netlify solo para autenticación:

1. Ve a [netlify.com](https://netlify.com) y crea cuenta
2. Click **"Add new site"** → **"Import existing project"**
3. Conecta tu repo GitHub `portfolio-fsx`
4. En **Build settings**:
   - Build command: (dejar vacío)
   - Publish directory: `dist`
5. Click **"Deploy site"**

#### 2. Activar Netlify Identity
1. En tu sitio de Netlify, ve a **Site settings** → **Identity**
2. Click **"Enable Identity"**
3. En **Registration preferences**, selecciona **"Invite only"**
4. En **External providers**, habilita **GitHub** (opcional)
5. En **Services** → **Git Gateway**, click **"Enable Git Gateway"**

#### 3. Invitarte como usuario
1. Ve a **Identity** tab
2. Click **"Invite users"**
3. Ingresa tu email: `felix73sanchez@gmail.com`
4. Recibirás un email de invitación
5. Click en el link y crea tu contraseña

#### 4. Actualizar configuración del CMS
En `public/admin/config.yml`, ya está configurado con:
```yaml
backend:
  name: git-gateway
  branch: master
```

---

## ✍️ Crear Posts desde el Panel

### 1. Acceder al Admin
```
https://tu-portfolio.vercel.app/admin
```

### 2. Iniciar sesión
- Email: `felix73sanchez@gmail.com`
- Contraseña: (la que creaste)

### 3. Crear nuevo post
1. Click en **"Blog Posts"**
2. Click en **"New Blog Posts"**
3. Completa los campos:
   - **Título**: El título de tu artículo
   - **Descripción**: Breve resumen
   - **Fecha de Publicación**: Selecciona fecha
   - **Etiquetas**: `["java", "spring", "arquitectura"]`
   - **Contenido**: Escribe en Markdown con el editor visual
4. Click **"Publish"** → **"Publish now"**

### 4. El post se publica automáticamente
- El CMS hace commit a GitHub
- Vercel detecta el cambio
- Redeploy automático
- Tu post está en vivo en ~1 minuto

---

## 🎯 Ventajas de este Setup

✅ **Sin servidor**: Todo estático, súper rápido  
✅ **Gratis**: Vercel + Netlify Identity son gratuitos  
✅ **Editor visual**: No necesitas editar archivos .md  
✅ **Deploy automático**: Push → Deploy instantáneo  
✅ **HTTPS gratis**: Vercel incluye SSL automático  
✅ **Sin mantenimiento**: Vercel se encarga de todo  

---

## 📱 Workflow Completo

```
Escribes post en /admin
       ↓
CMS hace commit a GitHub
       ↓
Vercel detecta cambio
       ↓
Build automático
       ↓
Deploy en CDN global
       ↓
✅ Post publicado
```

---

## 🔧 Comandos Útiles

```bash
# Desarrollo local
npm run dev

# Build para producción
npm run build

# Preview del build
npm run preview

# Acceder al CMS localmente
# http://localhost:4321/admin
```

---

## 🌐 URLs Importantes

- **Portfolio en vivo**: `https://tu-portfolio.vercel.app`
- **Panel de admin**: `https://tu-portfolio.vercel.app/admin`
- **Netlify Identity**: Solo para autenticación del CMS
- **GitHub**: Almacena tu código y posts

---

## 🆘 Troubleshooting

### No puedo acceder a /admin
- Verifica que hayas deployado en Vercel
- Asegúrate de haber habilitado Netlify Identity
- Revisa que Git Gateway esté activo

### Los posts no se publican
- Verifica que tu usuario tenga permisos en Netlify Identity
- Revisa que Git Gateway tenga acceso al repo
- Chequea los logs en Vercel

### Error al guardar post
- Asegúrate de estar autenticado
- Verifica conexión a internet
- Revisa permisos del repo en GitHub

---

¡Listo! Ahora puedes administrar tu blog desde cualquier lugar. 🎉
