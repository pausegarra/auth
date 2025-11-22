<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
      <div class="custom-header">
        <div class="custom-logo-placeholder">🔐</div>
        <h1 class="custom-title">${msg("loginTitle", (realm.displayName!''))}</h1>
      </div>
    <#elseif section = "form">
      <div class="custom-form-container">
        <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
            <#if realm.password>
              <div class="form-group">
                <label for="username" class="custom-label">
                    <#if !realm.loginWithEmailAllowed>${msg("username")}
                    <#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}
                    <#else>${msg("email")}
                    </#if>
                </label>
                <input tabindex="1" id="username" class="custom-input" name="username" value="${(login.username!'')}" type="text" autofocus autocomplete="off"
                       aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"/>

                  <#if messagesPerField.existsError('username','password')>
                    <span id="input-error" class="custom-error" aria-live="polite">
                                ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                            </span>
                  </#if>
              </div>

              <div class="form-group">
                <label for="password" class="custom-label">${msg("password")}</label>
                <input tabindex="2" id="password" class="custom-input" name="password" type="password" autocomplete="off"
                       aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"/>
              </div>

              <div class="form-options">
                  <#if realm.rememberMe && !usernameEditDisabled??>
                    <div class="checkbox">
                      <label class="custom-checkbox">
                          <#if login.rememberMe??>
                            <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" checked> ${msg("rememberMe")}
                          <#else>
                            <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox"> ${msg("rememberMe")}
                          </#if>
                      </label>
                    </div>
                  </#if>
              </div>

              <div class="form-actions">
                <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                <button tabindex="4" type="submit" class="custom-button primary" name="login" id="kc-login">
                    ${msg("doLogIn")}
                </button>
              </div>
            </#if>
        </form>
      </div>
    <#elseif section = "info">
        <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
          <div class="custom-registration">
            <p>${msg("noAccount")} <a tabindex="6" href="${url.registrationUrl}" class="custom-link">${msg("doRegister")}</a></p>
          </div>
        </#if>
    <#elseif section = "socialProviders">
        <#if realm.password && social.providers??>
          <div class="social-providers">
            <hr/>
            <p class="social-title">${msg("identity-provider-login-label")}</p>
            <div class="social-buttons">
                <#list social.providers as p>
                  <a href="${p.loginUrl}" id="zocial-${p.alias}" class="social-button ${p.providerId}">
                      ${msg("loginWith")} ${p.displayName!p.alias}
                  </a>
                </#list>
            </div>
          </div>
        </#if>
    </#if>
</@layout.registrationLayout>