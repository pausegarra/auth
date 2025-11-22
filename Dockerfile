FROM quay.io/keycloak/keycloak:26.0.0 as builder

ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true

WORKDIR /opt/keycloak

RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:26.0.0

COPY --from=builder /opt/keycloak/ /opt/keycloak/
COPY ./themes/ /opt/keycloak/themes/

ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", "--optimized", "--hostname=https://auth.pausegarra.es", "--http-enabled=true"]
