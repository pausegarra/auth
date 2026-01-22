<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "header">
        ${msg("deleteAccountTitle")}
    <#elseif section = "form">
        <form action="${url.loginAction}" class="${properties.kcFormClass!}" method="post">
            <div class="alert alert-warning" style="margin-bottom: 20px;">
                <span class="pficon pficon-warning-triangle-o"></span>
                ${msg("deleteAccountWarning")}
            </div>

            <p>${msg("deleteAccountConfirm")}</p>

            <div class="${properties.kcFormGroupClass!}">
                <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                    <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" style="background-color: var(--color-destructive); border-color: var(--color-destructive);" type="submit" value="${msg("doConfirmDelete")}" />
                    <#if isAppInitiatedAction??>
                        <button class="${properties.kcButtonClass!} ${properties.kcButtonDefaultClass!} ${properties.kcButtonLargeClass!}" type="submit" name="cancel-aia" value="true" />${msg("doCancel")}</button>
                    </#if>
                </div>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>