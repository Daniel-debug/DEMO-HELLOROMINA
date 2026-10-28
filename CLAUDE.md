# Hello Romina · Contexto general y reglas para la IA

Este archivo es lo primero que debe leer cualquier IA (Claude u otra) antes de tocar el proyecto.
Resume qué es, cómo está armado y qué reglas seguir. Los detalles están en `docs/`.

## Qué es

Landing page de **Hello Romina** (marca personal de Romina Vega, Cajeme / Ciudad Obregón, Sonora, México):
fotografía, video, historias en tiempo real, reels y diseño para marcas y eventos sociales.
Es una **propuesta de diseño**: una sola página HTML, sin frameworks, con todo el CSS y JS en el mismo archivo.

- Página publicada (vista previa privada en Claude): https://claude.ai/artifact/WpJELHnkbP97Aa9YshKjpJ
- Instagram: https://www.instagram.com/helloromina.mx/
- Facebook: https://www.facebook.com/p/Hello-Romina-61572056252705/
- Portafolio de Romina: https://rominavegaportafolio.framer.website/

## Archivos

| Archivo | Para qué |
|---|---|
| `hello-romina.html` | **Fuente única.** Aquí se edita todo. Es también lo que se publica como artifact de Claude. |
| `index.html` | **Generado** por `build.sh`. Versión independiente para el dominio real (con `<head>`, metas, favicon). No editar a mano. |
| `build.sh` | Envuelve `hello-romina.html` en un documento completo y genera `index.html`. |
| Cloudinary | **Fuente principal del reel** en el sitio real: `res.cloudinary.com/dui0ludm/video/upload/f_auto,q_auto:eco,w_540/v1793167878/romina-reel_ms0btj.mp4` (H.264 **con audio**, ~7.6 MB). Cuenta `dui0ludm`. |
| `media/romina-reel-540.mp4` | Respaldo local sin audio, 540p VP9 (12 MB). Lo usa el visor de Claude, que no carga videos de otros sitios; ahí suena la pista aparte. |
| `media/romina-reel.mp4` | Mismo reel, 720p H.264 **con audio** (18 MB). Respaldo para iPhone viejos en el sitio real. |
| `media/romina-reel-audio.mp4` | Solo la pista de audio del reel (500 KB). Suena con el botón / al entrar a la sección. |
| `docs/` | Contexto detallado: marca, estructura, diseño, pendientes e historial. |
| `.claude/launch.json` | Configuración para la vista previa local de Claude Code (opcional). |

Las fotos están **incrustadas** en el HTML como `data:` URIs (por eso el archivo pesa ~780 KB).

## Reglas

### Contenido
1. **No inventar datos.** Precios, testimonios, cifras, clientes o promesas ("publicado en 15 min", "el más pedido") solo si Romina los confirma. Lo pendiente se marca en `docs/PENDIENTES.md`.
2. Todo el texto visible va en **español de México**, tono cercano y directo, en primera persona de Romina ("Llego a tu evento…", "Escríbeme").
3. Usar los datos reales que están en `docs/CONTEXTO-MARCA.md`. Si cambian, actualizar ese archivo primero.
4. El WhatsApp y el correo **no se muestran como texto** en contacto (decisión del cliente). WhatsApp sigue en botones y en el formulario.

### Diseño
5. Respetar los **tokens** del `:root` (colores y fuentes) descritos en `docs/DISENO.md`. No meter colores sueltos nuevos sin agregarlos como token.
6. Tipografía de la marca: **Instrument Serif** (itálica para "hello" y énfasis) + **Poppins** (texto y "romina"). DM Mono solo para etiquetas pequeñas.
7. **Celular primero.** Todo cambio se revisa al menos en 360, 390 y 430 px de ancho, y en 1280 px. Nada debe desbordar a lo ancho.
8. Áreas táctiles de al menos 44 px de alto en celular.
9. El inicio en celular está calibrado: texto + lista "Fotografía · Video · Diseño" miden lo mismo que el teléfono. Si cambias el texto del inicio, vuelve a revisar que no quede hueco (ver `docs/ESTRUCTURA.md`).

### Código
10. Editar **solo** `hello-romina.html` y luego correr `bash build.sh` para regenerar `index.html`.
11. No escribir `<!doctype>`, `<html>`, `<head>` ni `<body>` en `hello-romina.html` (el visor de Claude los agrega). Sí debe conservar al inicio `<meta charset>` y `<meta name="viewport">`.
12. Scripts y estilos en línea. Fuentes solo de Google Fonts. Sin librerías externas.
13. Comentarios del código en español, cortos, explicando el porqué.
14. Respetar `prefers-reduced-motion` en animaciones nuevas.

### Video y audio
15. Los navegadores **no dejan sonar una página sin un toque previo** del usuario (el scroll no cuenta). No intentar saltarse esa regla; el código ya desbloquea el audio con el primer toque y muestra "Toca para escuchar".
16. El artifact de Claude acepta archivos de hasta **15 MB** y no acepta `.m4a`; por eso el audio va en `.mp4`. Tampoco carga video de otros sitios (Cloudinary), por eso el reel tiene respaldos locales después de la fuente de Cloudinary.
16b. Si se cambia el reel: subir el original a Cloudinary y usar la URL con `f_auto,q_auto:eco,w_540` (con audio: un solo elemento, sin sincronizar). Dejar los archivos locales como respaldo.

### Mantener este contexto
17. **Después de cada cambio**, actualizar `docs/HISTORIAL.md` (qué se cambió y por qué) y, si aplica, `docs/ESTRUCTURA.md`, `docs/DISENO.md` o `docs/PENDIENTES.md`.
18. Si una regla de este archivo deja de ser cierta, corregirla aquí mismo.

### Git y ramas
19. Repositorio: https://github.com/Daniel-debug/DEMO-HELLOROMINA (**público**).
20. **Todo el trabajo se hace en la rama `development`.** No hacer commits directos en `main`.
21. `main` solo recibe cambios con un **merge desde `development`**, cuando la versión está revisada y lista para publicar.
22. Antes de empezar, confirmar que estás en `development` (`git status`) y traer lo último (`git pull`).
23. Un commit por cambio con sentido propio, mensaje en español que diga qué cambió y por qué. Incluir `index.html` regenerado y el `.md` actualizado en el mismo commit.
24. No subir datos privados (correos, teléfonos personales, contraseñas, llaves). El repositorio es público y lo que entra al historial queda visible.

## Cómo probar y publicar

```bash
bash build.sh
```

Para ver la página con video y audio hace falta un servidor (abrir el archivo con doble clic sirve, pero el video puede no cargar):

```bash
npx http-server -p 5518 -c-1
```

Luego abrir `http://localhost:5518/index.html`. En Chrome: F12 → Ctrl+Shift+M para modo celular.

Publicar el artifact (desde Claude Code): publicar `hello-romina.html` con `url` = el link de arriba y, si cambian, los archivos de `media/` en `files`.
