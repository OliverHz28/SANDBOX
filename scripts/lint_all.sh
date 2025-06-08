#!/usr/bin/env bash

cd "$(dirname "$0")/.." || exit

echo "Ejecutando flake8"
if flake8 src/ --max-line-length=88 --select=E,W,F; then
  echo "No se encontraron errores con flake8"
else
  echo "flake8 encontró errores"
fi

echo "*********************"
echo "Ejecutando shellcheck"
if shellcheck scripts/*.sh; then
  echo "No se encontraron errores con shellcheck"
else
  echo "shellcheck encontró errores"
fi
echo "*********************"
echo "Ejecutando tflint"
if [ -d "iac" ]; then
  if tflint --enable-all iac/; then
    echo "No se encontraron errores con tflint"
  else
    echo "tflint encontró errores"
  fi
else
  echo "No se encontró el directorio de IaC"
fi