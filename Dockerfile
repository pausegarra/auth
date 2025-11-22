FROM quay.io/keycloak/keycloak:26.4.1
ENV KC_DB=postgres
COPY ./themes/ /opt/keycloak/themes/
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start"]

KC_DB_PASSWORD 6s7@xCy12
KC_DB_URL jdbc:postgresql://host.docker.internal:5432/my_keycloak