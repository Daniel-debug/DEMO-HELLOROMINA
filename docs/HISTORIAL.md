# Historial de cambios

Lo más reciente arriba. Cada entrada: qué cambió y por qué. La IA debe agregar una entrada después de cada cambio.

## v1 · 2026-10-28 · Primera versión numerada

- Se agregó el número de versión: **v1** en el pie de página y en `<meta name="version">`. Incluye todo lo de abajo (audio sin saltos, reel desde Cloudinary con audio propio, sonido estable al moverse entre secciones).
- Reglas 25–28 de `CLAUDE.md` para subir la versión en cada publicación.

## 2026-10-28 · Sonido estable al moverse entre secciones

- **Problema:** al ir y venir entre secciones el audio sonaba muy mal. Cerca del borde la sección se pausaba y reanudaba varias veces, cada vez se reacomodaba la pista aparte, y cambiar su velocidad para sincronizarla distorsionaba el sonido en Safari.
- **Solución:** el video de Cloudinary ahora trae su propio audio (`f_auto,q_auto:eco,w_540`, ~7.6 MB): un solo elemento, nada que sincronizar. Margen al salir de la sección (entra en 35–65 %, sale fuera de 15–85 %). La pista aparte queda solo para el visor de Claude, sin cambios de velocidad y con saltos limitados. Una interrupción al cargar ya no apaga el sonido.
- Probado: 8 idas y vueltas en el borde sin pausas; 4 salidas y regresos con sonido estable en el sitio real y en el respaldo (desfase 0.06–0.09 s); el aviso "Toca para escuchar" sigue funcionando. Falta confirmarlo en iPhone real.

## 2026-10-28 · Reel desde Cloudinary

- El reel se sirve primero desde Cloudinary (`f_auto,q_auto:eco,w_540,ac_none`): H.264 sin audio, ~6.6 MB en lugar de 12–18 MB, desde una CDN de video. Motivo: el video tardaba en cargar en iPhone y eso trababa el audio.
- Se dejaron los archivos locales como respaldo (el visor de Claude no carga video de otros sitios). El audio sigue aparte en `media/romina-reel-audio.mp4`.
- Probado: se reproduce desde Cloudinary con el audio alineado (0.05 s) y, si Cloudinary falla, usa el archivo local.

## 2026-10-28 · Audio trabado en iPhone

- **Problema:** en iPhone (GitHub Pages) el audio del reel se trababa. El video se detenía a cargar mientras el audio seguía; al desfasarse, el código hacía saltar el audio, cada salto en Safari tardaba y generaba otro desfase.
- **Solución:** el audio se pausa mientras el video carga y retoma alineado; los desfases chicos se corrigen cambiando la velocidad del audio (±8 %) en vez de saltar; solo salta si el desfase pasa de 1 s.
- Probado en Chrome simulando desfase de 0.5 s (se corrigió en 5 s sin saltos) y pausa por carga. Falta confirmarlo en un iPhone real.

## 2026-10-28 · Flujo de ramas

- Se creó la rama `development`; todo el trabajo continúa ahí y `main` solo recibe merges de versiones revisadas.
- Reglas 19–24 de `CLAUDE.md` (Git y ramas). Motivo: mantener `main` estable y no subir datos privados a un repositorio público.
- Se retiró el correo de Romina de `docs/CONTEXTO-MARCA.md` y del historial de Git.

## 2026-10-27 · Propuesta inicial hasta versión 21 del artifact

- **Paquetes destacados:** fondo rosa propio, paquete "Siempre al aire" elevado con cinta "★ Recomendado", franja "¿No sabes cuál elegir?" con WhatsApp, enlace "Paquetes" en el menú. Motivo: que sea el punto de decisión de la página.
- **Contacto:** se quitaron WhatsApp y correo como texto (decisión del cliente). En celular, Instagram, Facebook y Portafolio pasan al pie.
- **Sobre mí:** fondo que pasa de crema a olivo profundo según el scroll (lento, ~90 % de pantalla), texto que cambia rápido a la mitad para mantener contraste, halo rosa en el video, botón "Ver paquetes".
- **Reel:** marco 9:16 para ver el video completo; se reproduce con sonido al entrar a la sección y se pausa al salir; botón de sonido; "Ver en Instagram" debajo del video.
- **Historias del inicio:** 5 fotos reales que avanzan solas cada 4 s.
- **Inicio en celular:** texto y teléfono lado a lado, texto en la serif de la marca, lista Fotografía · Video · Diseño tocable, ubicación en la etiqueta, botón "Cotizar por WhatsApp", línea "Han confiado en mí".
- **Versión móvil:** carruseles, línea de tiempo, barra de WhatsApp, menú móvil, áreas táctiles de 44–48 px.
- **Técnico:** `meta charset` y `viewport` en la fuente; `build.sh` genera `index.html` con metas, favicon y descripción.
- **Base:** mezcla de las propuestas "Al aire" (energía en vivo) y "Estudio" (editorial), con tipografía, colores, contenido y fotos reales de la marca.
