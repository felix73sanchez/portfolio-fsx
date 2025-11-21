#!/usr/bin/env node

/**
 * Script para crear nuevos posts del blog fácilmente
 * Uso: node create-post.js "Título del Post"
 */

import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __dirname = path.dirname(fileURLToPath(import.meta.url));

// Obtener título del argumento
const title = process.argv[2];

if (!title) {
  console.error('❌ Error: Debes proporcionar un título');
  console.log('Uso: node create-post.js "Título del Post"');
  process.exit(1);
}

// Crear slug (nombre del archivo)
const slug = title
  .toLowerCase()
  .normalize('NFD')
  .replace(/[\u0300-\u036f]/g, '') // Eliminar acentos
  .replace(/[^a-z0-9]+/g, '-')
  .replace(/^-+|-+$/g, '');

// Fecha actual en formato ISO
const now = new Date();
const pubDate = now.toISOString();
const dateFormatted = now.toISOString().split('T')[0];

// Contenido del post
const content = `---
title: "${title}"
description: "Descripción breve de ${title}"
pubDate: ${pubDate}
tags: ["tecnología"]
---

## Introducción

Escribe aquí la introducción de tu post...

## Desarrollo

Desarrolla tu contenido aquí...

## Conclusión

Conclusiones finales...
`;

// Ruta del archivo
const filePath = path.join(__dirname, 'src', 'content', 'blog', `${slug}.md`);

// Verificar si ya existe
if (fs.existsSync(filePath)) {
  console.error(`❌ Error: Ya existe un post con el slug "${slug}"`);
  process.exit(1);
}

// Crear el archivo
fs.writeFileSync(filePath, content, 'utf8');

console.log('✅ Post creado exitosamente!');
console.log(`📝 Archivo: src/content/blog/${slug}.md`);
console.log(`🔗 URL: /blog/${slug}`);
console.log(`\nEdita el archivo y reinicia el servidor de desarrollo.`);
