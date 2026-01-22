<#import "template.ftl" as layout>
<@layout.emailLayout>
    <p>${msg("emailVerificationBodyHtml", link, linkExpiration, realmName, linkExpirationFormatter(linkExpiration))?no_esc}</p>

    <div class="button-container">
        <a href="${link}" class="button">${msg("emailVerificationLinkText")}</a>
    </div>

    <p style="font-size: 14px; color: #71717a;">${msg("emailVerificationBodyHtmlFooter", link)?no_esc}</p>
</@layout.emailLayout>