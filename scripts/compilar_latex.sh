#!/usr/bin/env bash

set -euo pipefail

mostrar_ayuda() {
    cat <<'EOF'
Uso: ./compilar_latex.sh [--sin-limpiar] [archivo.tex]

Compila un documento LaTeX con latexmk y, al terminar,
elimina los archivos auxiliares usando limpiar_latex.sh.

Opciones:
  --sin-limpiar  Compila pero no elimina archivos auxiliares.
  -h, --help     Muestra esta ayuda.

Si no se indica un archivo .tex, el script intenta usar
`../Proyecto_PR3.tex` (relativo a este script).
EOF
}

limpiar_despues=true
archivo_tex=""
directorio_script="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
raiz_proyecto="$(cd "$directorio_script/.." && pwd)"

while (($# > 0)); do
    case "$1" in
        --sin-limpiar)
            limpiar_despues=false
            ;;
        -h|--help)
            mostrar_ayuda
            exit 0
            ;;
        *)
            archivo_tex="$1"
            ;;
    esac
    shift
done

if ! command -v latexmk >/dev/null 2>&1; then
    echo "Error: no se ha encontrado 'latexmk' en el sistema." >&2
    exit 1
fi

if [[ -z "$archivo_tex" ]]; then
    if [[ -f "$raiz_proyecto/Proyecto_PR3.tex" ]]; then
        archivo_tex="$raiz_proyecto/Proyecto_PR3.tex"
    else
        mapfile -t archivos_tex < <(find "$raiz_proyecto" -maxdepth 1 -type f -name '*.tex' | sort)

        if [[ ${#archivos_tex[@]} -eq 0 ]]; then
            echo "Error: no se ha encontrado ningún archivo .tex en la raíz del proyecto." >&2
            exit 1
        fi

        if [[ ${#archivos_tex[@]} -gt 1 ]]; then
            echo "Error: hay varios archivos .tex en la raíz del proyecto. Indica cuál quieres compilar:" >&2
            printf '  %s\n' "${archivos_tex[@]}" >&2
            exit 1
        fi

        archivo_tex="${archivos_tex[0]}"
    fi
fi

if [[ "$archivo_tex" != /* ]]; then
    archivo_tex="$(cd "$PWD" && pwd)/$archivo_tex"
fi

if [[ ! -f "$archivo_tex" ]]; then
    echo "Error: el archivo '$archivo_tex' no existe." >&2
    exit 1
fi

directorio_tex="$(cd "$(dirname "$archivo_tex")" && pwd)"
nombre_tex="$(basename "$archivo_tex")"
nombre_pdf="${nombre_tex%.tex}.pdf"

pushd "$directorio_tex" >/dev/null

echo "Compilando '$nombre_tex'..."
latexmk -cd -pdf -interaction=nonstopmode -halt-on-error "$archivo_tex"

# Renombrar el PDF resultante al nombre deseado
pdf_generado="${nombre_tex%.tex}.pdf"
nombre_pdf="Portafolio_RIN.pdf"
if [[ -f "$directorio_tex/$pdf_generado" ]]; then
    mv "$directorio_tex/$pdf_generado" "$directorio_tex/$nombre_pdf"
fi

if $limpiar_despues; then
    echo "Limpiando archivos auxiliares..."
    "$directorio_script/limpiar_latex.sh" .
fi

popd >/dev/null

echo "PDF generado: $directorio_tex/$nombre_pdf"