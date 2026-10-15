8. Documentación para el README.md del Repositorio (Consolidación de TP13C, TP14, TP15, TP16 y TP17)
Añade este bloque al README.md principal de tu proyecto:
## TP18 — Gestión Centralizada de Vulnerabilidades con OWASP DefectDojo

Integración de **OWASP DefectDojo Community Edition** para consolidar, desduplicar y auditar los hallazgos de ciberseguridad provenientes de OWASP ZAP (DAST), Threagile (Threat Modeling), Semgrep (SAST), Trivy (SCA/Container/IaC) y Gitleaks (Secret Scanning).

### Arquitectura de Integración en 4 Fases

Fase;Herramienta;Función;Mecanismo
Fase 1;Docker Buildx;Compilación inmutable;Exporta app-image.tar
Fase 2;OWASP ZAP / Threagile / Semgrep / Trivy / Gitleaks;Auditoría multidominio;Genera reportes JSON/XML estructurados
Fase 3;OWASP DefectDojo;Vulnerability Management;Ingestión vía API v2 y deduplicación
Fase 4;Helm & K8s;Despliegue a producción;Release verificado en Kubernetes

---- Visualizacion en Word como tabla ---
╔══════╦══════════════════════════════════════════════╦══════════════════════════════════╦══════════════════════════════════════╗
║ FASE ║ HERRAMIENTA                                  ║ FUNCIÓN                          ║ MECANISMO                            ║
╠══════╬══════════════════════════════════════════════╬══════════════════════════════════╬══════════════════════════════════════╣
║  01  ║ Docker Buildx                                 ║ Compilación inmutable            ║ Exportación de app-image.tar         ║
╠══════╬══════════════════════════════════════════════╬══════════════════════════════════╬══════════════════════════════════════╣
║  02  ║ OWASP ZAP · Threagile · Semgrep               ║ Auditoría multidominio           ║ Generación de reportes estructurados ║
║     ║ Trivy · Gitleaks                              ║ DAST · Threat Modeling · SAST    ║ JSON / XML                           ║
║      ║                                              ║ SCA · Container · IaC · Secrets  ║                                      ║
╠══════╬══════════════════════════════════════════════╬══════════════════════════════════╬══════════════════════════════════════╣
║  03  ║ OWASP DefectDojo                              ║ Gestión centralizada             ║ API v2 · Ingestión · Deduplicación   ║
║      ║                                              ║ de vulnerabilidades              ║                                      ║
╠══════╬══════════════════════════════════════════════╬══════════════════════════════════╬══════════════════════════════════════╣
║  04  ║ Docker Hub · Helm · Kubernetes               ║ Publicación y despliegue         ║ Versionado de imagen y release      ║
╚══════╩══════════════════════════════════════════════╩══════════════════════════════════╩══════════════════════════════════════╝
