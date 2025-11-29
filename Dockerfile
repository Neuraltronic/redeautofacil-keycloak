# Keycloak com tema personalizado Rede Auto Fácil
FROM quay.io/keycloak/keycloak:26.0

# Copiar tema personalizado
COPY themes/redeautofacil /opt/keycloak/themes/redeautofacil

# Entrypoint - usar start sem --optimized para aceitar variáveis em runtime
ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start", "--http-enabled=true", "--health-enabled=true", "--metrics-enabled=true"]
