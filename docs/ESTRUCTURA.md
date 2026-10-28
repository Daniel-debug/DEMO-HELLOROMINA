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

1. **Menú móvil:** abre y cierra `nav.open`; se cierra al elegir un enlace.
2. **Formulario → WhatsApp:** arma el texto con nombre, marca, tipo y mensaje y lo pone en el enlace `#wa-send`.
3. **Reel de "Sobre mí":**
   - Fuentes en orden: Cloudinary (H.264 **con audio**, ~7.6 MB) → `media/romina-reel.mp4` (H.264 con audio, 18 MB) → `media/romina-reel-540.mp4` (VP9 sin audio). Si una no carga, el navegador pasa a la siguiente.
   - **Sitio real:** el video trae su propio audio. Un solo elemento: activar sonido = quitar el silencio del video. No hay nada que sincronizar.
   - **Visor de Claude:** no carga Cloudinary ni tiene el archivo de 18 MB, así que usa `romina-reel-540` y suena la pista aparte (`#reel-audio`). Se alinea solo con saltos (si se desfasa más de 0.35 s, como máximo uno cada 2 s) y **nunca cambiando la velocidad**, porque en Safari eso distorsiona el sonido. Si el video se detiene a cargar, la pista espera.
   - Entra al cruzar la franja central de la pantalla (35 %–65 %) y **solo sale cuando se aleja bastante** (fuera de 15 %–85 %). Ese margen evita pausar y reanudar repetidamente cerca del borde. Al volver sigue donde iba.
   - Revisa al hacer scroll y cada 500 ms; se pausa si la pestaña se oculta.
   - Regla de navegadores: sin un toque previo no suena. El primer toque en cualquier parte reproduce el video dentro del toque para dejarlo autorizado (iPhone); si sigue bloqueado, el botón dice "Toca para escuchar" con pulso.
   - Una interrupción al cargar (`AbortError`) no se trata como bloqueo; solo `NotAllowedError` apaga el sonido.
   - Si la persona silencia a mano, no se vuelve a activar solo.
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
