# Aprendizajes técnicos (problemas ya resueltos)

Lee esto antes de tocar el reel, el audio, las historias, el scroll o de probar la página.
Cada punto: qué pasó, por qué, y qué hacer. Agrega aquí cualquier problema nuevo que resuelvas.

## Audio y video

**1. Ninguna página puede sonar sin un toque previo.**
Chrome y Safari bloquean el audio hasta que la persona toca, hace clic o presiona una tecla en la página. El scroll **no** cuenta. No hay forma legítima de saltarlo.
→ El código escucha el primer toque en cualquier parte y desbloquea el sonido; si sigue bloqueado, el botón dice "Toca para escuchar" con pulso.

**2. En iPhone, quitar el silencio a un video sin toque lo pausa.**
Por eso, dentro del primer toque se llama a `play()` del video (aunque esté fuera de pantalla): eso deja el elemento autorizado y después puede sonar y pausarse solo al entrar y salir de la sección.

**3. Audio y video separados se traban en iPhone.** (Lo que más tiempo costó.)
- Saltar el audio (`currentTime`) para alinearlo tarda en Safari y genera otro desfase → salto tras salto → audio trabado.
- Cambiar la velocidad del audio (`playbackRate`) para alinearlo **distorsiona el sonido** en Safari.
- Al salir y volver a la sección se acumulaban pausas, reanudaciones y reajustes.
→ Solución: en el sitio real se usa **un solo video con su propio audio** (Cloudinary). La pista aparte solo existe para el visor de Claude, sin cambios de velocidad y con un salto como máximo cada 2 s.

**4. Una promesa de `play()` rechazada no siempre es un bloqueo.**
Si el video se detiene a cargar, `play()` puede rechazar con `AbortError`. Tratarlo como bloqueo apagaba el sonido al volver a la sección.
→ Solo `NotAllowedError` significa "el navegador no deja sonar".

**5. Pausar y reanudar en el borde de la sección.**
Con un solo umbral, el scroll cerca del borde alternaba dentro/fuera muchas veces.
→ Histéresis: entra en la franja 35–65 % del alto de pantalla, sale solo fuera de 15–85 %.

**6. Instagram entrega audio y video por separado.**
La página del post trae `video_versions` (MP4 completo con audio, H.264) y un manifiesto DASH con pistas solo de video (VP9, varias calidades) y una de audio. Para el sitio real se usa Cloudinary con el original.

## Visor de Claude (artifact)

**7. Límites del visor:** archivos de hasta **15 MB**; no acepta `.m4a` (por eso el audio es `.mp4`); **bloquea video e imágenes de otros sitios** (Cloudinary incluido; avisa al publicar, es esperado). Tampoco hay `<head>` propio: lo agrega el visor.
→ El reel tiene respaldos locales después de la fuente de Cloudinary; el navegador pasa a la siguiente fuente si una falla.

**8. Al abrir `hello-romina.html` directo en el navegador** sin `<meta charset>` y `<meta name="viewport">`, los acentos salían rotos y en celular se veía como escritorio. Por eso la fuente conserva esas dos etiquetas al inicio, y `build.sh` las quita para no duplicarlas en `index.html`.

## Diseño y maquetación

**9. Reutilizar `<nav>` hereda estilos del menú.** Las redes del pie se pusieron en un `<nav>` y heredaron el fondo crema fijo del menú superior (texto invisible). → Usar `<div>` para grupos de enlaces que no son el menú.

**10. Elementos posicionados que se salen de su sección** (por ejemplo el difuminado de "Sobre mí", `inset:-56px 0`) se pintan sobre la sección vecina; mantenerlos dentro del relleno (`padding`) de la vecina.

**11. Mezclar colores de texto y fondo al mismo ritmo deja el texto ilegible a la mitad.** → El texto cambia rápido en el punto medio (`--pt`), el fondo despacio (`--p`). Contraste mínimo medido: 3.6:1 en títulos.

**12. Calibrar el inicio en celular con tamaño de letra fijo falla** porque el texto salta de renglón de golpe. → La lista ocupa el sobrante (`grid-auto-rows:1fr`); así la separación es constante en cualquier ancho.

## Contenido

**13. Las historias destacadas de Instagram ("Marcas", "Sociales") piden sesión iniciada**; no se pudieron extraer. El perfil sin sesión muestra solo 12 publicaciones.

**14. El post de agradecimiento** ("Te quiero mucho cliente…") es de Romina hacia sus clientes; **no es una reseña**. No presentarlo como testimonio.

## Pruebas

**15. `python -m http.server` corta la descarga del HTML** cuando el video carga al mismo tiempo (la página queda a medias, sin su `<script>`). → Usar `npx http-server` o un servidor con soporte de rangos.

**16. El HTML pesa ~790 KB:** el navegador puede quedarse con una versión vieja en caché. → Recargar con `?v=N` en la URL o desactivar caché (`-c-1` en http-server).

**17. `scroll-behavior: smooth` en `index.html`** hace que `window.scrollTo(y)` en pruebas automáticas no llegue de inmediato. → En pruebas usar `scrollTo({top:y, behavior:'instant'})`.

**18. En un navegador de pruebas oculto o en segundo plano**, `requestAnimationFrame` e `IntersectionObserver` se pausan. Por eso la sección del reel también se revisa con un intervalo de 500 ms (funciona igual en teléfonos reales).

**19. Medir antes de dar algo por bueno:** los cambios de proporción del inicio, el contraste de la transición y la sincronía del audio se verificaron con mediciones (posiciones, contraste, desfase en segundos), no solo con capturas.
