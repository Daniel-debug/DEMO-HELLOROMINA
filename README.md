# Hello Romina · Landing

Propuesta de sitio web para **Hello Romina** (fotografía, video y contenido en tiempo real para marcas · Cajeme, Sonora).

- Sitio: https://daniel-debug.github.io/DEMO-HELLOROMINA/ (se publica desde `main`)
- Vista previa privada en Claude: https://claude.ai/artifact/WpJELHnkbP97Aa9YshKjpJ
- Versión actual: **v1** (se ve en el pie de la página)

## Contenido del proyecto

```
hello-romina.html   ← fuente: aquí se edita todo
index.html          ← generado para el sitio real (no editar)
build.sh            ← genera index.html
media/              ← respaldos locales del reel (video y audio)
CLAUDE.md           ← contexto general, estado actual y reglas para la IA
docs/
  CONTEXTO-MARCA.md ← datos reales de Romina y de dónde salió cada foto
  DECISIONES.md     ← lo que pidió el cliente y por qué
  ESTRUCTURA.md     ← secciones y comportamientos
  DISENO.md         ← colores, tipografía, componentes
  APRENDIZAJES.md   ← problemas técnicos ya resueltos
  PENDIENTES.md     ← lo que falta
  HISTORIAL.md      ← cambios por versión
```

El reel de "Hello, soy Romina" se sirve desde Cloudinary; los archivos de `media/` son respaldo.

## Flujo de trabajo

1. Trabajar en la rama `development` (nunca directo en `main`).
2. Editar `hello-romina.html` y regenerar el sitio:
   ```bash
   bash build.sh
   ```
3. Revisar en un servidor local (necesario para el video):
   ```bash
   npx http-server -p 5518 -c-1
   ```
   Abrir `http://localhost:5518/index.html` y probar en modo celular (F12 → Ctrl+Shift+M) a 360, 390 y 430 px.
4. Anotar el cambio en `docs/HISTORIAL.md` y hacer commit.
5. Para publicar: subir la versión (v2, v3…), etiqueta `git tag vN`, merge de `development` a `main` y push.

## Trabajar con IA

Pídele a la IA que lea primero `CLAUDE.md`: tiene el estado actual, las reglas y qué documento leer según la tarea.
