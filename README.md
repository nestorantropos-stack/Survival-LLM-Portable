# Survival LLM Portable

Una versión **portable** para Windows de [Survival LLM](https://github.com/anonnerdfrenzy/survival-llm): un asistente
de IA con una biblioteca de supervivencia que funciona sin internet. Se lleva en un disco externo y se usa en cualquier
PC con Windows 10/11 de 64 bits, sin instalar nada.

## Créditos

**Todo el mérito de Survival LLM es de su autor original, Ronny Fernandez**
([anonnerdfrenzy/survival-llm](https://github.com/anonnerdfrenzy/survival-llm)), que lo publicó con licencia MIT.
Él hizo la app, eligió y probó los modelos, y armó la biblioteca offline. Gracias por publicarlo como código abierto.

Esta repo **no copia ni modifica su código**. Solo añade un lanzador que guarda todo dentro de la carpeta portable y
un script que descarga su versión oficial y comprueba que no haya sido alterada. Si te sirve, dale una estrella y apoya
[el proyecto original](https://github.com/anonnerdfrenzy/survival-llm).

El contenido de la biblioteca conserva la licencia de cada fuente original (ver
[SOURCES.md](https://github.com/anonnerdfrenzy/survival-llm/blob/main/SOURCES.md) en la repo original).
El motor de IA es [Ollama](https://github.com/ollama/ollama) (licencia MIT), y el modelo recomendado es
[IBM Granite 4.2](https://ollama.com/library/granite4.2) (Apache 2.0).

## Cómo usarlo

1. Descarga esta repo (botón **Code > Download ZIP**) y descomprímela en tu disco externo.
   Para el disco, usa **NTFS o exFAT**: FAT32 no admite archivos de más de 4 GB, y el modelo ocupa más que eso.
2. Haz doble clic en **`Iniciar Survival LLM.bat`**. Si Windows dice que protegió el equipo, pulsa **Más información >
   Ejecutar de todas formas**.
3. La primera vez:
   - descarga la app oficial (27 MB) y comprueba su SHA-256;
   - la app te guía para descargar el motor de IA (Ollama, 1,6 GB), el modelo y la biblioteca:
     **Everything** (8,8 GB de descarga, 21 GB instalada) o **Essentials** (1,3 GB de descarga, unos 4,5 GB instalada).

   Haz este primer arranque con internet. Después funciona sin conexión.

## Qué modelo usar

Para un PC con **16 GB de RAM**: **IBM Granite 4.2 8B** (`granite4.2:8b`, unos 6 GB). Es el que la repo original
recomienda para ese tamaño: en sus pruebas fue el único modelo pequeño que no dio respuestas peligrosas. Acierta menos
que los modelos grandes, así que revisa la fuente que cita. Con una gráfica NVIDIA responde más rápido.

Con 32 GB o más, la app sugiere un modelo mayor y más preciso.

## Qué se guarda y dónde

Todo queda dentro de la carpeta, nada en el PC donde lo conectes:

```
Iniciar Survival LLM.bat   lanzador portable
preparar.ps1               descarga y verifica la app oficial
programa\                  la app oficial (Python portable + código), se crea al primer arranque
datos\ajustes\             ajustes, memoria e instrucciones
datos\local\               motor de IA (Ollama) y datos de la ventana
datos\modelos\             los modelos de IA
datos\biblioteca\          la biblioteca offline
datos\mis-archivos\        tus PDFs y documentos
```

El lanzador redirige las carpetas de la app con sus propias variables de entorno (`SURVIVAL_LLM_APP_DIR`,
`SURVIVAL_LLM_LIBRARY`, `SURVIVAL_LLM_FILES`, `OLLAMA_MODELS`) y usa el puerto 11435, para no mezclarse con un Ollama
que ya esté instalado en ese PC.

`programa\` y `datos\` están en `.gitignore`: tus notas, archivos y ajustes nunca se suben si haces un fork.

## Notas

- Desde un disco mecánico por USB la primera carga del modelo es lenta. Un SSD externo USB 3 va bien.
- Cierra la ventana de la app antes de desconectar el disco.
- La app trae su propio botón de actualizaciones. Para cambiar de versión desde aquí, edita `$Version` y `$Sha256` en
  `preparar.ps1` (el SHA-256 se publica en el
  [update.json](https://anonnerdfrenzy.github.io/survival-llm/update.json) del proyecto original).
- Survival LLM es una ayuda, no un sustituto de los servicios de emergencia ni de un médico.

## Licencia

Los scripts de esta repo: MIT ([LICENSE](LICENSE)). Survival LLM: MIT, © 2026 Ronny Fernandez
([LICENSE-original-survival-llm](LICENSE-original-survival-llm)).
