#!/usr/bin/env bash

set -euo pipefail

mostrar_ayuda() {
    cat <<'EOF'
Uso: ./limpiar_latex.sh [--dry-run] [ruta]

Elimina archivos auxiliares generados por compilaciones de LaTeX,
manteniendo los archivos fuente y los PDF.

Opciones:
  --dry-run   Muestra qué se eliminaría, sin borrar nada.
  -h, --help  Muestra esta ayuda.

Si no se indica una ruta, se usa el directorio actual.
EOF
}

modo_simulacion=false
directorio_objetivo="."

while (($# > 0)); do
    case "$1" in
        --dry-run)
            modo_simulacion=true
            ;;
        -h|--help)
            mostrar_ayuda
            exit 0
            ;;
        *)
            directorio_objetivo="$1"
            ;;
    esac
    shift
done

if [[ ! -d "$directorio_objetivo" ]]; then
    echo "Error: la ruta '$directorio_objetivo' no es un directorio válido." >&2
    exit 1
fi

patrones=(
    '*.aux'
    '*.acn'
    '*.acr'
    '*.alg'
    '*.bbl'
    '*.bcf'
    '*.blg'
    '*.fdb_latexmk'
    '*.fls'
    '*.glg'
    '*.glo'
    '*.gls'
    '*.idx'
    '*.ilg'
    '*.ind'
    '*.ist'
    '*.loa'
    '*.lof'
    '*.log'
    '*.lot'
    '*.nav'
    '*.out'
    '*.run.xml'
    '*.snm'
    '*.synctex.gz'
    '*.toc'
    '*.xdv'
)

directorios_patron=(
    '_minted*'
)

construir_argumentos_find() {
    local tipo="$1"
    shift
    local patrones_locales=("$@")
    local args=("$directorio_objetivo" "-type" "$tipo" "(")
    local patron

    for patron in "${patrones_locales[@]}"; do
        args+=("-name" "$patron" "-o")
    done

    unset 'args[${#args[@]}-1]'
    args+=(")" "-print0")

    printf '%s\0' "${args[@]}"
}

mapfile -d '' argumentos_find_archivos < <(construir_argumentos_find f "${patrones[@]}")
mapfile -d '' argumentos_find_directorios < <(construir_argumentos_find d "${directorios_patron[@]}")

mapfile -d '' archivos_a_borrar < <(
    find "${argumentos_find_archivos[@]}"
)

mapfile -d '' directorios_a_borrar < <(
    find "${argumentos_find_directorios[@]}"
)

if [[ ${#archivos_a_borrar[@]} -eq 0 && ${#directorios_a_borrar[@]} -eq 0 ]]; then
    echo "No se han encontrado archivos auxiliares de LaTeX en '$directorio_objetivo'."
    exit 0
fi

echo "Directorio objetivo: $directorio_objetivo"

if $modo_simulacion; then
    echo "Modo simulación: no se eliminará nada."
    for archivo in "${archivos_a_borrar[@]}"; do
        printf '  [archivo] %s\n' "$archivo"
    done
    for directorio in "${directorios_a_borrar[@]}"; do
        printf '  [directorio] %s\n' "$directorio"
    done
    exit 0
fi

for archivo in "${archivos_a_borrar[@]}"; do
    rm -f -- "$archivo"
    printf 'Eliminado: %s\n' "$archivo"
done

for directorio in "${directorios_a_borrar[@]}"; do
    rm -rf -- "$directorio"
    printf 'Eliminado: %s\n' "$directorio"
done

echo "Limpieza completada."