FROM quay.io/keycloak/keycloak:26.4.1 AS builder

ENV KC_DB=postgres

COPY ./themes/ /opt/keycloak/themes/

RUN /opt/keycloak/bin/kc.sh build


FROM quay.io/keycloak/keycloak:26.4.1

COPY --from=builder /opt/keycloak/ /opt/keycloak/

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start", "--optimized"]