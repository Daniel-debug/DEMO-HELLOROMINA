# Hello Romina · Landing

Propuesta de sitio web para **Hello Romina** (fotografía, video y contenido en tiempo real para marcas · Cajeme, Sonora).

- Vista previa: https://claude.ai/artifact/WpJELHnkbP97Aa9YshKjpJ (privada; se comparte desde el menú Compartir)

## Contenido del proyecto

```
hello-romina.html   ← fuente: aquí se edita todo
index.html          ← generado para el sitio real (no editar)
build.sh            ← genera index.html
media/              ← reel (video y audio)
CLAUDE.md           ← contexto general y reglas para la IA
docs/               ← marca, estructura, diseño, pendientes, historial
```

## Flujo de trabajo

1. Editar `hello-romina.html`.
2. Regenerar el sitio:
   ```bash
   bash build.sh
   ```
3. Revisar en un servidor local (necesario para el video):
   ```bash
   npx http-server -p 5518 -c-1
   ```
   Abrir `http://localhost:5518/index.html` y probar en modo celular (F12 → Ctrl+Shift+M) a 360, 390 y 430 px.
4. Anotar el cambio en `docs/HISTORIAL.md`.

## Trabajar con IA

Pídele a la IA que lea primero `CLAUDE.md`. Ahí están las reglas (no inventar datos, usar los tokens de diseño, revisar celular, regenerar `index.html`, actualizar los `.md`).
