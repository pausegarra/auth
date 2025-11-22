FROM quay.io/keycloak/keycloak:26.4.1
ENV KC_DB=postgres
COPY ./themes/ /opt/keycloak/themes/
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start"]