# Estructura de la página

Orden de las secciones en `hello-romina.html`, con su `id`, qué contienen y cómo se comportan.
Actualiza este archivo si agregas, quitas o reordenas secciones.

| # | Sección | id / clase | Fondo | Contenido |
|---|---|---|---|---|
| 1 | Menú | `nav` | crema translúcido, fijo arriba | Logo, enlaces (Servicios, Sobre mí, Trabajo, Cómo trabajo, Paquetes), botón "Agenda abierta". En celular: botón "Menú" que despliega la lista. |
| 2 | Inicio | `header.hero#top` | crema | Etiqueta "En vivo desde Cajeme, Sonora", título, texto, teléfono con historias, botón "Cotizar por WhatsApp", enlace "Ver servicios", línea "Han confiado en mí", lista Fotografía · Video · Diseño. |
| 3 | Cinta | `.ticker` | oscuro | Texto en movimiento con los servicios. |
| 4 | Servicios | `#servicios` | crema | 4 carpetas: Historias en tiempo real (En vivo), Reels (`#srv-video`), Fotografía (`#srv-foto`), Branding y diseño (`#srv-diseno`). |
| 5 | Sobre mí | `#romina.about` | crema → **olivo profundo según el scroll** | Reel en arco 9:16, botón de sonido, "Ver en Instagram", texto de Romina, frase, etiquetas, botón "Ver paquetes". |
| 6 | Trabajo | `#trabajo` | crema | 6 tarjetas con fotos reales + lista de marcas. |
| 7 | Clientes | `#clientes` | papel | Post de agradecimiento + 2 espacios para reseñas reales. |
| 8 | Proceso | `#proceso` | oscuro | Brief → Grabo → Edito → Publico. En celular: línea de tiempo vertical. |
| 9 | Paquetes | `#paquetes.pkg` | **rosa suave** | Cobertura, Siempre al aire (recomendado, con cinta), Campaña + franja "¿No sabes cuál elegir?". |
| 10 | Contacto | `#contacto` | oscuro | Texto, enlaces a redes (en celular se ocultan y pasan al pie), formulario que arma un mensaje de WhatsApp. |
| 11 | Pie | `footer` | oscuro | Logo, redes (solo celular), créditos. |
| — | Botón flotante | `.wa-float` | verde WhatsApp | En celular es barra inferior: aparece al pasar el inicio y se oculta en contacto. |

## Comportamientos (JavaScript, al final del archivo)

Todo está en un solo `<script>` dentro de una función. Bloques en orden:

1. **Menú móvil:** abre y cierra `nav.open` con transición breve y enlaces simultáneos; se cierra al elegir un enlace, tocar fuera o presionar Escape. Los enlaces cerrados no reciben foco en móvil.
2. **Formulario → WhatsApp:** arma el texto con nombre, marca, tipo y mensaje y lo pone en el enlace `#wa-send`.
3. **Reel de "Sobre mí":**
   - Se reproduce cuando la sección cruza la franja central de la pantalla (35 %–65 %) y se pausa al salir; al volver sigue donde iba.
   - Revisa al hacer scroll y cada 500 ms; se pausa si la pestaña se oculta.
   - Un solo `<video>` reproduce `media/romina-reel.mp4` con su audio integrado; no hay audio separado ni saltos de sincronización.
   - Regla de navegadores: sin un toque previo no suena. El primer toque solicita reproducción y pausa de inmediato el video integrado dentro del mismo gesto, dejándolo silenciado fuera de la sección. Al llegar se intenta reproducir con sonido; el botón también lo activa. Si Safari bloquea la reproducción con sonido al volver, continúa silenciado y muestra "Toca para escuchar".
   - Si la persona silencia a mano, no se vuelve a activar solo.
   - Al pie del video se muestran una barra de progreso y el tiempo reproducido / duración total; solo leen el estado del video.
4. **Transición de color de "Sobre mí":** calcula `--p` (0 = crema, 1 = olivo) según la posición; el cambio ocupa ~90 % del alto de pantalla al entrar y al salir. `--pt` cambia el texto de oscuro a claro rápido (entre p 0.45 y 0.6) para que siempre contraste. Si el navegador no soporta `color-mix`, se queda en olivo fijo.
5. **Historias del teléfono:** 5 fotos que avanzan cada 4 s con barras de progreso; el nombre de la cuenta cambia (`data-who`). Tocar el teléfono pasa a la siguiente. Con movimiento reducido no avanzan solas.
6. **Lista del inicio → Servicios:** Fotografía, Video y Diseño llevan a su carpeta (también dentro del carrusel).
7. **Carruseles en celular:** Servicios, Trabajo y Paquetes se vuelven deslizables (`.snap`) con puntos de avance; el paquete recomendado se muestra primero.
8. **Barra de WhatsApp en celular:** visible después del inicio, oculta cuando se ve contacto.

## Calibración del inicio en celular (≤ 640 px)

- Rejilla de 2 columnas: texto + lista a la izquierda, teléfono a la derecha (`zoom: .58`, o `.68` desde 400 px).
- El texto usa la serif de la marca a 25 px (27–30 px desde 400 px).
- La lista ocupa el alto sobrante (`grid-auto-rows: 1fr`), así no queda hueco entre el texto y "Fotografía".
- Medido: separación de 18 px y la lista termina a ≤ 3 px del final del teléfono en 360, 390 y 412 px.

## Entradas y proceso

Los bloques de cada sección aparecen con fundido y desplazamiento suave al entrar en pantalla. La línea de tiempo de `#proceso` avanza según el scroll y activa los pasos; es vertical hasta 640 px y horizontal en escritorio. Con movimiento reducido todo permanece visible sin estas animaciones.

La barra rosa fija superior indica el progreso de lectura de la página, de 0 % al inicio a 100 % al final del footer.

El teléfono de historias crece automáticamente un 6 % al cargar y añade hasta dos puntos porcentuales al bajar; el extra se conserva. Al salir y regresar a la sección inicial retira el 6 % de entrada, con un balanceo leve durante el crecimiento. Un borde fijo inferior sigue el fondo de la sección al pie de la pantalla para extender visualmente la landing en Safari.
