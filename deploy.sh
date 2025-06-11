#!/bin/bash
# filepath: deploy.sh

set -e

echo "Aplicando todos los manifiestos válidos en la carpeta k8s/ y sus subcarpetas..."

find k8s/ -type f \( -name "*.yaml" -o -name "*.yml" -o -name "*.json" \) -exec kubectl apply -f {} \;

echo "Despliegue completado."
