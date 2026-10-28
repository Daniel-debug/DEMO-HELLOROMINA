#!/usr/bin/env bash
# Genera index.html (sitio independiente) a partir de hello-romina.html (versión para el artifact de Claude).
# El artifact recibe <head>, charset y viewport del visor; el sitio real los necesita en el archivo.
set -euo pipefail
cd "$(dirname "$0")"

SRC=hello-romina.html
OUT=index.html
SPLIT=$(grep -n '^</style>' "$SRC" | head -1 | cut -d: -f1)

{
cat <<'HEAD'
<!doctype html>
<html lang="es-MX">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
<meta name="description" content="Hello Romina: fotografía, video, reels e historias en tiempo real para marcas y eventos sociales en Cajeme, Sonora.">
<meta property="og:type" content="website">
<meta property="og:locale" content="es_MX">
<meta property="og:title" content="Hello Romina · photography & content">
<meta property="og:description" content="Capturo momentos y creo contenido para marcas y eventos sociales en Cajeme, Sonora. Hagamos tu idea realidad.">
<!-- Cuando haya dominio: <meta property="og:image" content="https://helloromina.mx/og.jpg"> y <link rel="canonical" href="https://helloromina.mx/"> -->
<link rel="icon" href="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 64 64'%3E%3Crect width='64' height='64' rx='14' fill='%23efebe4'/%3E%3Ctext x='50%25' y='54%25' text-anchor='middle' dominant-baseline='middle' font-family='Georgia,serif' font-style='italic' font-size='44' fill='%231c1a17'%3Eh%3C/text%3E%3Ccircle cx='48' cy='18' r='5' fill='%23d46a78'/%3E%3C/svg%3E">
<style>
html{-webkit-text-size-adjust:100%}
:root{padding-top:env(safe-area-inset-top,0px);padding-bottom:env(safe-area-inset-bottom,0px)}
body{margin:0}
img{max-width:100%}
[hidden]{display:none!important}
section[id],header[id]{scroll-margin-top:80px}
</style>
HEAD
sed -n "1,${SPLIT}p" "$SRC" | grep -v -e "claude:viewport-fit-sides" -e "<meta charset" -e "<meta name=\"viewport\""
echo '</head>'
echo '<body>'
sed -n "$((SPLIT+1)),\$p" "$SRC"
echo '</body>'
echo '</html>'
} > "$OUT"

echo "Listo: $OUT ($(wc -c < "$OUT") bytes)"
