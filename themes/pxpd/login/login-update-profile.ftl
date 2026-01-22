<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','email','firstName','lastName'); section>
    <#if section = "header">
        ${msg("loginProfileTitle")}
    <#elseif section = "form">
        <form id="kc-update-profile-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
            <#if user.editUsernameAllowed>
                <div class="form-group" style="display: none">
                    <label for="username" class="${properties.kcLabelClass!}">${msg("username")}</label>
                    <input type="text" id="username" name="username" value="${(user.username!'')}" class="${properties.kcInputClass!}"
                           aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"
                    />

                    <#if messagesPerField.existsError('username')>
                        <span id="input-error-username" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                            ${kcSanitize(messagesPerField.getFirstError('username'))?no_esc}
                        </span>
                    </#if>
                </div>
            </#if>
            <div class="form-group">
                <label for="email" class="${properties.kcLabelClass!}">${msg("email")}</label>
                <#if (user.attributes['source']?first!'') == "external">
                    <input type="text" id="email" name="email" value="${(user.email!'')}" class="${properties.kcInputClass!}" readonly="readonly"
                           aria-invalid="<#if messagesPerField.existsError('email')>true</#if>"
                    />
                    <span class="text-muted" style="font-size: 0.8em; color: #6c757d;">${msg("externalAccountLinked")}</span>
                <#else>
                    <input type="text" id="email" name="email" value="${(user.email!'')}" class="${properties.kcInputClass!}"
                           aria-invalid="<#if messagesPerField.existsError('email')>true</#if>"
                    />
                </#if>

                <#if messagesPerField.existsError('email')>
                    <span id="input-error-email" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                        ${kcSanitize(messagesPerField.getFirstError('email'))?no_esc}
                    </span>
                </#if>
            </div>

            <div class="form-group">
                <label for="firstName" class="${properties.kcLabelClass!}">${msg("firstName")}</label>
                <input type="text" id="firstName" name="firstName" value="${(user.firstName!'')}" class="${properties.kcInputClass!}"
                       aria-invalid="<#if messagesPerField.existsError('firstName')>true</#if>"
                />

                <#if messagesPerField.existsError('firstName')>
                    <span id="input-error-firstname" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                        ${kcSanitize(messagesPerField.getFirstError('firstName'))?no_esc}
                    </span>
                </#if>
            </div>

            <div class="form-group">
                <label for="lastName" class="${properties.kcLabelClass!}">${msg("lastName")}</label>
                <input type="text" id="lastName" name="lastName" value="${(user.lastName!'')}" class="${properties.kcInputClass!}"
                       aria-invalid="<#if messagesPerField.existsError('lastName')>true</#if>"
                />

                <#if messagesPerField.existsError('lastName')>
                    <span id="input-error-lastname" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                        ${kcSanitize(messagesPerField.getFirstError('lastName'))?no_esc}
                    </span>
                </#if>
            </div>

            <div class="${properties.kcFormGroupClass!}">
                <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                    <div class="${properties.kcFormOptionsWrapperClass!}">
                    </div>
                </div>

                <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                    <#if isAppInitiatedAction??>
                        <button class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doSubmit")}" >${msg("doSubmit")}</button>
                        <button class="${properties.kcButtonClass!} ${properties.kcButtonDefaultClass!} ${properties.kcButtonLargeClass!}" type="submit" name="cancel-aia" value="true" >${msg("doCancel")}</button>
                    <#else>
                        <button class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doSubmit")}" >${msg("doSubmit")}</button>
                    </#if>
                </div>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>