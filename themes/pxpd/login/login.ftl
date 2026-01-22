<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=false; section>
    <#if section = "header">
        ${msg("loginTitle")}
    <#elseif section = "form">
        <div id="kc-form">
            <div id="kc-form-wrapper">
                <#if realm.password>
                    <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                        <div class="form-group">
                            <label for="username" class="${properties.kcLabelClass!}"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>

                            <#if usernameEditDisabled??>
                                <input tabindex="1" id="username" class="${properties.kcInputClass!}" name="username" value="${(login.username!'')}" type="text" disabled />
                            <#else>
                                <input tabindex="1" id="username" class="${properties.kcInputClass!}" name="username" value="${(login.username!'')}"  type="text" autofocus autocomplete="off" />
                            </#if>
                        </div>

                        <div class="form-group">
                            <label for="password" class="${properties.kcLabelClass!}">${msg("password")}</label>
                            <input tabindex="2" id="password" class="${properties.kcInputClass!}" name="password" type="password" autocomplete="off" />
                        </div>

                        <div class="form-group login-pf-settings">
                            <div class="form-options-row">
                                <div id="kc-form-options">
                                    <#if realm.rememberMe && !usernameEditDisabled??>
                                        <div class="checkbox">
                                            <label>
                                                <#if login.rememberMe??>
                                                    <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" checked> ${msg("rememberMe")}
                                                <#else>
                                                    <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox"> ${msg("rememberMe")}
                                                </#if>
                                            </label>
                                        </div>
                                    </#if>
                                </div>
                                <div class="${properties.kcFormOptionsWrapperClass!}">
                                    <#if realm.resetPasswordAllowed>
                                        <span class="forgot-password"><a tabindex="5" href="${url.loginResetCredentialsUrl}">${msg("forgotPassword")}</a></span>
                                    </#if>
                                </div>
                            </div>
                        </div>

                        <div id="kc-form-buttons" class="${properties.kcFormGroupClass!}">
                            <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                            <button tabindex="4" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" name="login" id="kc-login" type="submit">${msg("login")}</button>
                        </div>
                    </form>
                </#if>
            </div>
        </div>

        <#if realm.password && social.providers??>
            <div id="kc-social-providers" class="social-providers">
                <ul class="social-providers-list">
                    <#list social.providers as p>
                        <li>
                            <a id="social-${p.alias}" class="social-link" href="${p.loginUrl}">
                                <#if p.iconClasses?has_content>
                                    <i class="${properties.kcCommonLogoIdP!} ${p.iconClasses!}" aria-hidden="true"></i>
                                    <span class="${properties.kcFormSocialProviderNameClass!}">${msg("socialLogin", p.displayName!)}</span>
                                <#else>
                                    <span class="${properties.kcFormSocialProviderNameClass!}">${msg("socialLogin", p.displayName!)}</span>
                                </#if>
                            </a>
                        </li>
                    </#list>
                </ul>
            </div>
        </#if>

        <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
            <div id="kc-registration-container">
                <div id="kc-registration" class="register-link">
                    <span>${msg("noAccount")} <a tabindex="6" href="${url.registrationUrl}">${msg("register")}</a></span>
                </div>
            </div>
        </#if>
    </#if>
</@layout.registrationLayout>