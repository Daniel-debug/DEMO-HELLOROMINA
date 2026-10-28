# Sistema de diseño

Los tokens viven en el primer bloque `:root` de `hello-romina.html`. Úsalos siempre; si necesitas un color nuevo, agrégalo ahí como token y anótalo aquí.

## Colores

| Token | Valor | Uso |
|---|---|---|
| `--bg` | `#efebe4` | Crema de sus publicaciones. Fondo general. |
| `--paper` | `#f8f6f1` | Tarjetas y secciones claras alternas. |
| `--ink` | `#1c1a17` | Texto principal. |
| `--muted` | `#5f5a51` | Texto secundario. |
| `--olive` | `#5d6a3a` | Verde de marca (títulos, paquete recomendado). |
| `--rose` | `#d46a78` | Rosa de marca (acentos, botón principal, cinta). |
| `--night` | `#22231c` | Bandas oscuras (cinta, proceso, contacto, pie). |
| `--night-ink` | `#f3efe7` | Texto sobre fondos oscuros. |
| `--olive-deep` | `#262c17` | Fondo de "Sobre mí" cuando la transición llega a 1. |
| `--olive-light` | `#c5cf94` | Título de "Sobre mí" sobre olivo. |
| `--blush` | `#f4e0df` | Fondo rosa de Paquetes. |
| WhatsApp | `#1fa855` | Solo en botones de WhatsApp. |

La página es de un solo tema (claro con bandas oscuras); no cambia con el modo oscuro del sistema.

## Tipografía

| Token | Fuente | Uso |
|---|---|---|
| `--serif` | Instrument Serif | Títulos, "hello", texto del inicio en celular, frases. Itálica para énfasis. |
| `--sans` | Poppins (300–600) | Texto, botones, "romina". |
| `--mono` | DM Mono | Etiquetas pequeñas en mayúsculas (eyebrows, precios, captions). |

Títulos con `text-wrap: balance`. Etiquetas en mayúsculas con `letter-spacing` de .12–.16em.

## Componentes

- **Botones** (`.btn`): píldora. Variantes: `.rose` (principal), `.ghost` (borde), `.wa` (verde WhatsApp). Botones con ícono SVG en línea.
- **Enlace secundario** (`.more`): texto subrayado con flecha.
- **Carpetas** (`.folder`): tarjetas con pestaña (`data-tab`) inspiradas en su post de servicios.
- **Teléfono** (`.phone`): marco negro con historias de Instagram (barras, cuenta, "● EN VIVO").
- **Arco** (`.portrait`): marco del reel, proporción 9:16, esquinas superiores redondas; halo rosa sobre olivo.
- **Cinta** (`.ribbon`): etiqueta rosa "★ Recomendado".
- **Pastillas** (`.tags span`, `.ig-link`, `.foot-social a`): borde fino, radio completo.

## Puntos de quiebre

| Ancho | Cambios |
|---|---|
| ≤ 980 px | Servicios a 2 columnas. |
| ≤ 860 px | Inicio, Sobre mí, Clientes y Contacto a una columna. |
| ≤ 760 px | Menú se vuelve botón "Menú". |
| ≤ 640 px | Diseño de celular completo: inicio en 2 columnas calibradas, carruseles, línea de tiempo, barra de WhatsApp, redes al pie. |
| 400–640 px | Celulares grandes: teléfono e inicio un poco más grandes. |
| ≤ 540 px | Ajustes finos (botón flotante, reseñas a 1 columna). |

## Barra flotante de WhatsApp en celular

Fondo verde WhatsApp y texto blanco, restaurados a petición del usuario. El color de los controles propios de Safari depende del navegador.

## Movimiento

- Punto rosa que late (en vivo), cinta en movimiento, historias con fundido, transición de color por scroll, pulso del botón "Toca para escuchar".
- Entradas de elementos al entrar en pantalla, menú móvil desplegable con enlaces escalonados y línea de tiempo que avanza con el scroll.
- Todo se desactiva con `prefers-reduced-motion: reduce`.
