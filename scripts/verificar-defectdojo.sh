#!/bin/bash
set -uo pipefail

echo "=========================================================="
echo "  VERIFICACIÓN Y CARGA LOCAL A DEFECTDOJO API v2 (TP18)"
echo "=========================================================="
echo ""

# Parámetros de conexión
DEFECTDOJO_URL="${DEFECTDOJO_URL:-http://localhost:8080}"
API_KEY="${DEFECTDOJO_API_KEY:-tu_api_key_v2_aqui}"
PRODUCT_ID="${PRODUCT_ID:-1}"

# Función para enviar reporte vía cURL a la API v2 de DefectDojo
import_scan() {
  local SCAN_TYPE="$1"
  local FILE_PATH="$2"

  if [ -f "$FILE_PATH" ]; then
    echo "  [+] Enviando $SCAN_TYPE ($FILE_PATH) a DefectDojo..."
    RESPONSE=$(curl -s -X POST "$DEFECTDOJO_URL/api/v2/import-scan/"       -H "Authorization: Token $API_KEY"       -F "product_id=$PRODUCT_ID"       -F "scan_type=$SCAN_TYPE"       -F "engagement_name=Manual Local Scan"       -F "auto_create_context=true"       -F "file=@$FILE_PATH")

    if echo "$RESPONSE" | grep -q "scan_type"; then
      echo "      [OK] Importación exitosa de $SCAN_TYPE"
    else
      echo "      [FAIL] Error en importación: $RESPONSE"
    fi
  else
    echo "  [WARN] Archivo $FILE_PATH no encontrado. Genera el reporte previo."
  fi
}

# Ejecución de importaciones locales (TP13C a TP17)
import_scan "ZAP Scan" "reports-json/zap-results.json"                  # TP13C (OWASP ZAP)
import_scan "Generic CI/CD Audit" "reports-json/threagile-results.json"   # TP14 (Threagile)
import_scan "Semgrep JSON Report" "reports-json/semgrep-results.json"     # TP15 (Semgrep SAST)
import_scan "Trivy Scan" "reports-json/trivy-container-results.json"     # TP16 (Trivy SCA/Container/IaC)
import_scan "Gitleaks Scan" "reports-json/gitleaks-report.json"          # TP17 (Gitleaks Secret Scanning)

echo ""
echo "=== Verificación completada ==="
