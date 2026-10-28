# Historial de cambios

Lo más reciente arriba. Cada entrada: qué cambió y por qué. La IA debe agregar una entrada después de cada cambio.

## 2026-10-28 · Versión 36

- Se reorganiza la cabecera de historias: cuenta arriba, «ahora» y «En vivo» alineados en una segunda fila, junto al avatar. La cuenta aprovecha todo el ancho disponible para que no quede comprimida junto a la etiqueta.

## 2026-10-28 · Versión 35

- Se acelera el fundido entre fotos de las historias de 0.5 a 0.25 segundos; se conserva el tiempo de lectura de cada historia.

## 2026-10-28 · Versión 34

- Cabecera de historias con columnas definidas para avatar, cuenta y etiqueta «En vivo». La etiqueta no se divide en líneas y los nombres largos se recortan con puntos suspensivos para no desplazarla en celular.

## 2026-10-28 · Versión 33

- Nuevo título: «Tu marca en movimiento. Tu historia al momento.».
- Se conserva el 2 % extra ganado al bajar. Al salir de la sección inicial y regresar se retira suavemente el 6 % de la entrada, manteniendo el extra.
- Balanceo leve del teléfono al crecer; se respeta movimiento reducido.

## 2026-10-28 · Versión 32

- El teléfono crece automáticamente un 6 % durante 2.4 segundos desde la carga. Al bajar añade hasta dos puntos porcentuales (8 % total); al regresar al inicio retira solo ese extra y conserva el 6 % inicial.
- Se respeta movimiento reducido. El fondo inferior y la lógica del audio no cambian.

## 2026-10-28 · Versión 31

- Borde inferior fijo con el tono de la sección visible al pie de la pantalla, incluyendo la transición olivo de Sobre mí y el degradado rosa de Paquetes. Permite que Safari extienda ese fondo hacia su barra; WhatsApp sigue verde.
- El teléfono de historias crece suavemente hasta un 6 % conforme comienza el desplazamiento. Se conserva su rotación y se respeta movimiento reducido.
- El efecto de la barra nativa necesita comprobarse en Safari real.

## 2026-10-28 · Versión 30

- El botón fijo de WhatsApp mantiene su verde y dimensiones. Se aplica `backdrop-filter: blur(1px)` (también con prefijo WebKit) para que WebKit clasifique su borde como multicolor en lugar de extender el verde sólido hacia los controles del navegador.
- Fundamento: `LocalFrameView::fixedContainerEdges` de WebKit, rama `foundBackdropFilter` → `PredominantColorType::Multiple`.
- El fondo opaco del botón oculta el filtro, por lo que no debe cambiar su apariencia. Pendiente comprobar el tinte de los controles en Safari de un dispositivo real.
- Commit autorizado por el usuario; pendiente publicar y comprobar en Safari real.

## 2026-10-28 · Versión 29

- Menú móvil sin retrasos escalonados ni animación de altura: panel y enlaces aparecen juntos con transición de 220 ms mediante opacidad y desplazamiento.
- Barra superior de progreso de lectura, rosa del token de marca con brillo sutil. Se actualiza al hacer scroll y llega a 100 % al final del footer.

## 2026-10-28 · Versión 28

- Indicador de progreso y tiempo reproducido / duración total al pie del reel. Se actualiza desde el mismo video y vuelve al inicio en cada repetición.
- Se eleva el botón de sonido para no tapar el indicador; no cambia la lógica del audio.

## 2026-10-28 · Versión 27

- Entradas progresivas al desplazarse para títulos, tarjetas y bloques de todas las secciones; sin ocultar contenido cuando JavaScript o las animaciones no están disponibles.
- «Del brief al post»: línea de tiempo vinculada al scroll, avance vertical en celular y horizontal en escritorio, con activación progresiva de cada paso.
- Menú móvil con apertura y cierre animados, enlaces escalonados, cierre con Escape y bloqueo de foco cuando está cerrado.
- Se restaura el verde de WhatsApp en la barra «Escríbeme», a petición del usuario. La lógica del reel no cambia.
- Validación en navegador a 360, 390, 430 y 1280 px y preferencia de movimiento reducido.

## 2026-10-28 · Versión 26

- La barra flotante de WhatsApp en celular pasa de verde sólido a un fondo crema translúcido con desenfoque y texto oscuro. Se elimina la capa verde que seguía influyendo en el tinte inferior de Safari.
- La lógica del audio de la versión 25 se conserva sin cambios, confirmada por el usuario.
- El aspecto de los controles propios de Safari requiere comprobación en el dispositivo.

## 2026-10-28 · Versión 25

- Se elimina la preparación mediante volumen cero: iOS no permite controlar ese volumen y podía sonar fuera de la sección.
- El toque previo solicita reproducción y la pausa de inmediato en el mismo gesto, sin esperar la promesa; el video queda silenciado. Los eventos de reproducción también lo detienen si la sección no está activa.
- Al entrar se intenta reproducir con sonido; si Safari lo rechaza, se mantiene la alternativa del botón. Pendiente confirmar autorización automática en Safari real.

## 2026-10-28 · Versión 24

- El primer toque en cualquier parte prepara el mismo video con audio integrado para reproducirlo con sonido al llegar a la sección. Al entrar se intenta reproducir con sonido; si Safari lo bloquea, continúa silenciado y pide un toque.
- Se elimina el color de tema forzado y se deja transparente el fondo del enlace fijo de WhatsApp en celular; el verde se dibuja en una capa interior para reducir el tinte de la barra de Safari.
- Pendiente comprobar autorización de audio y transparencia de la barra en Safari real.

## 2026-10-28 · Versión 23

- El reel usa el MP4 existente con audio integrado. Se elimina el reproductor de audio separado y las correcciones de posición que podían causar cortes. El sonido se activa con un toque y se conserva la pausa al salir de la sección.
- Pendiente confirmar reproducción continua en Safari de un dispositivo real.

## 2026-10-28 · Versión 22

- Se agrega «Versión 22» al footer para identificar la revisión publicada. La revisión anterior estaba documentada como versión 21, pero no mostraba su número en la página.

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
