# Keycloak com tema personalizado Rede Auto Fácil
FROM quay.io/keycloak/keycloak:26.0

# Copiar tema personalizado
COPY themes/redeautofacil /opt/keycloak/themes/redeautofacil

# Configurações de build
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true
ENV KC_DB=postgres

# Build otimizado
RUN /opt/keycloak/bin/kc.sh build

# Entrypoint
ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start", "--optimized"]
