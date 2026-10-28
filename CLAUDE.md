# Hello Romina · Contexto general y reglas para la IA

Este archivo es lo primero que debe leer cualquier IA (Claude u otra) antes de tocar el proyecto.
Resume qué es, cómo está armado y qué reglas seguir. Los detalles están en `docs/`.

## Qué es

Landing page de **Hello Romina** (marca personal de Romina Vega, Cajeme / Ciudad Obregón, Sonora, México):
fotografía, video, historias en tiempo real, reels y diseño para marcas y eventos sociales.
Es una **propuesta de diseño**: una sola página HTML, sin frameworks, con todo el CSS y JS en el mismo archivo.

- Sitio publicado (GitHub Pages, desde `main`): https://daniel-debug.github.io/DEMO-HELLOROMINA/
- Repositorio (público): https://github.com/Daniel-debug/DEMO-HELLOROMINA
- Vista previa privada en Claude (artifact): https://claude.ai/artifact/WpJELHnkbP97Aa9YshKjpJ
- Instagram: https://www.instagram.com/helloromina.mx/
- Facebook: https://www.facebook.com/p/Hello-Romina-61572056252705/
- Portafolio de Romina: https://rominavegaportafolio.framer.website/

## Estado actual (actualizar al terminar cada sesión)

- **Versión:** v1 (etiqueta Git `v1`, commit "Agregar número de versión v1").
- **Rama de trabajo:** `development`. Al 2026-10-28, `development` tiene v1 con las correcciones del audio; **`main` (lo publicado en GitHub Pages) todavía tiene la versión inicial** hasta que el dueño haga push de `development`, merge a `main` y push de `main`.
- **Pendiente inmediato:** confirmar en un iPhone real que el reel suena estable al salir y volver a "Hello, soy Romina".
- **Qué leer según la tarea:**
  - Cambiar textos o datos → `docs/CONTEXTO-MARCA.md` y `docs/DECISIONES.md`.
  - Cambiar diseño o una sección → `docs/DISENO.md` y `docs/ESTRUCTURA.md`.
  - Tocar el reel, el audio, las historias o el scroll → **`docs/APRENDIZAJES.md` primero**: ahí están los errores que ya se resolvieron.
  - Saber qué falta → `docs/PENDIENTES.md`. Qué se hizo → `docs/HISTORIAL.md`.

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
| `docs/CONTEXTO-MARCA.md` | Datos reales de Romina, clientes, frases y origen de cada foto. |
| `docs/DECISIONES.md` | Lo que pidió el cliente y por qué (no deshacer sin preguntar). |
| `docs/ESTRUCTURA.md` | Secciones, ids y cómo funciona cada comportamiento del JavaScript. |
| `docs/DISENO.md` | Tokens de color y tipografía, componentes, tamaños de pantalla. |
| `docs/APRENDIZAJES.md` | Problemas técnicos ya resueltos y trampas conocidas (audio, iPhone, visor de Claude, pruebas). |
| `docs/PENDIENTES.md` | Lista de lo que falta confirmar, conseguir o publicar. |
| `docs/HISTORIAL.md` | Registro de cambios por versión. |
| `README.md` | Resumen corto para personas. |
| `.gitignore` / `.gitattributes` | Ignora `.claude/` (configuración local); marca los `.mp4` como binarios y `build.sh` con fin de línea LF. |

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
17. **Después de cada cambio**, actualizar `docs/HISTORIAL.md` (qué se cambió y por qué) y, si aplica, `docs/ESTRUCTURA.md`, `docs/DISENO.md`, `docs/PENDIENTES.md`, `docs/DECISIONES.md` (si el cliente pidió algo) o `docs/APRENDIZAJES.md` (si se resolvió un problema técnico nuevo).
18. Si una regla de este archivo deja de ser cierta, corregirla aquí mismo. Al terminar una sesión, actualizar la sección **Estado actual**.

### Git y ramas
19. Repositorio: https://github.com/Daniel-debug/DEMO-HELLOROMINA (**público**).
20. **Todo el trabajo se hace en la rama `development`.** No hacer commits directos en `main`.
21. `main` solo recibe cambios con un **merge desde `development`**, cuando la versión está revisada y lista para publicar.
22. Antes de empezar, confirmar que estás en `development` (`git status`) y traer lo último (`git pull`).
23. Un commit por cambio con sentido propio, mensaje en español que diga qué cambió y por qué. Incluir `index.html` regenerado y el `.md` actualizado en el mismo commit.
24. No subir datos privados (correos, teléfonos personales, contraseñas, llaves). El repositorio es público y lo que entra al historial queda visible.

### Versiones
25. Versión actual: **v1**. Se muestra en el pie de página (`<span class="version">`) y en `<meta name="version">` al inicio de `hello-romina.html`.
26. Cada vez que se pasa `development` a `main` para publicar, subir la versión (v2, v3…) en **los dos lugares**, regenerar `index.html` y crear la etiqueta de Git con el mismo nombre (`git tag v2`).
27. En `docs/HISTORIAL.md`, cada publicación lleva su versión en el título.
28. Para saber qué versión está publicada: ver el pie de la página o buscar `meta name="version"` en el código de GitHub Pages.

## Cómo probar y publicar

### Probar
```bash
bash build.sh
```

Para ver la página con video y audio hace falta un servidor que soporte rangos (video):

```bash
npx http-server -p 5518 -c-1
```

Luego abrir `http://localhost:5518/index.html`. En Chrome: F12 → Ctrl+Shift+M para modo celular.
**No usar `python -m http.server`**: corta la descarga del HTML cuando el video carga al mismo tiempo (ver `docs/APRENDIZAJES.md`).

### Publicar una versión (GitHub Pages)
1. En `development`: subir la versión (regla 26), `bash build.sh`, anotar en `docs/HISTORIAL.md`, commit y `git tag vN`.
2. Push de `development` con etiquetas (`git push --tags origin development`).
3. Merge de `development` en `main` y push de `main`. GitHub Pages se actualiza en 1–2 minutos (pestaña Actions).
4. Comprobar la versión en el pie de https://daniel-debug.github.io/DEMO-HELLOROMINA/.

En sesiones de Claude Code el push puede estar bloqueado por permisos (repositorio público); en ese caso lo hace el dueño desde SourceTree.

### Vista previa en Claude (artifact)
Publicar `hello-romina.html` con `url` = el link del artifact y, si cambian, los archivos de `media/` en `files`. El visor bloquea Cloudinary (avisa al publicar; es esperado) y usa los respaldos locales.
