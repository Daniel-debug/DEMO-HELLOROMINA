# Historial de cambios

Lo más reciente arriba. Cada entrada: qué cambió y por qué. La IA debe agregar una entrada después de cada cambio.

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
