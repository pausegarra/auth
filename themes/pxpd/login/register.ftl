<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('firstName','lastName','email','username','password','password-confirm'); section>
    <#if section = "header">
        ${msg("registerTitle")}
    <#elseif section = "form">
        <form id="kc-register-form" class="${properties.kcFormClass!}" action="${url.registrationAction}" method="post">
            <div class="form-group">
                <label for="firstName" class="${properties.kcLabelClass!}">${msg("firstName")}<span class="required">*</span></label>
                <input type="text" id="firstName" class="${properties.kcInputClass!}" name="firstName"
                       value="${(register.formData.firstName!'')}"
                       aria-invalid="<#if messagesPerField.existsError('firstName')>true</#if>"
                />

                <#if messagesPerField.existsError('firstName')>
                    <span id="input-error-firstname" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                        ${kcSanitize(messagesPerField.getFirstError('firstName'))?no_esc}
                    </span>
                </#if>
            </div>

            <div class="form-group">
                <label for="lastName" class="${properties.kcLabelClass!}">${msg("lastName")}<span class="required">*</span></label>
                <input type="text" id="lastName" class="${properties.kcInputClass!}" name="lastName"
                       value="${(register.formData.lastName!'')}"
                       aria-invalid="<#if messagesPerField.existsError('lastName')>true</#if>"
                />

                <#if messagesPerField.existsError('lastName')>
                    <span id="input-error-lastname" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                        ${kcSanitize(messagesPerField.getFirstError('lastName'))?no_esc}
                    </span>
                </#if>
            </div>

            <div class="form-group">
                <label for="email" class="${properties.kcLabelClass!}">${msg("email")}<span class="required">*</span></label>
                <input type="text" id="email" class="${properties.kcInputClass!}" name="email"
                       value="${(register.formData.email!'')}" autocomplete="email"
                       aria-invalid="<#if messagesPerField.existsError('email')>true</#if>"
                />

                <#if messagesPerField.existsError('email')>
                    <span id="input-error-email" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                        ${kcSanitize(messagesPerField.getFirstError('email'))?no_esc}
                    </span>
                </#if>
            </div>

            <#if !realm.registrationEmailAsUsername>
                <div class="form-group">
                    <label for="username" class="${properties.kcLabelClass!}">${msg("username")}<span class="required">*</span></label>
                    <input type="text" id="username" class="${properties.kcInputClass!}" name="username"
                           value="${(register.formData.username!'')}" autocomplete="username"
                           aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"
                    />

                    <#if messagesPerField.existsError('username')>
                        <span id="input-error-username" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                            ${kcSanitize(messagesPerField.getFirstError('username'))?no_esc}
                        </span>
                    </#if>
                </div>
            </#if>

            <#if passwordRequired??>
                <div class="form-group">
                    <label for="password" class="${properties.kcLabelClass!}">${msg("password")}<span class="required">*</span></label>
                    <input type="password" id="password" class="${properties.kcInputClass!}" name="password"
                           autocomplete="new-password"
                           aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>"
                    />

                    <#if messagesPerField.existsError('password')>
                        <span id="input-error-password" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                            ${kcSanitize(messagesPerField.getFirstError('password'))?no_esc}
                        </span>
                    </#if>
                </div>

                <div class="form-group">
                    <label for="password-confirm" class="${properties.kcLabelClass!}">${msg("passwordConfirm")}<span class="required">*</span></label>
                    <input type="password" id="password-confirm" class="${properties.kcInputClass!}"
                           name="password-confirm"
                           aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>"
                    />

                    <#if messagesPerField.existsError('password-confirm')>
                        <span id="input-error-password-confirm" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                            ${kcSanitize(messagesPerField.getFirstError('password-confirm'))?no_esc}
                        </span>
                    </#if>
                </div>
            </#if>

            <#if recaptchaRequired??>
                <div class="form-group">
                    <div class="g-recaptcha" data-sitekey="${recaptchaSiteKey}" data-callback="recaptcha_callback"></div>
                </div>
            </#if>

            <div class="${properties.kcFormGroupClass!}">
                <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                    <button class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" type="submit">
                        ${msg("doRegister")}
                    </button>
                </div>
                <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                    <div class="${properties.kcFormOptionsWrapperClass!}">
                        <span class="login-link"><a href="${url.loginUrl}">${kcSanitize(msg("backToLogin"))?no_esc}</a></span>
                    </div>
                </div>
            </div>
        </form>

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
    </#if>
</@layout.registrationLayout>