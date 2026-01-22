<#import "template.ftl" as layout>
<@layout.emailLayout>
    <p>${msg("passwordResetBodyHtml", link, linkExpiration, realmName, linkExpirationFormatter(linkExpiration))?no_esc}</p>

    <div class="button-container">
        <a href="${link}" class="button">${msg("passwordResetLinkText")}</a>
    </div>

    <p style="font-size: 14px; color: #71717a;">${msg("passwordResetBodyHtmlFooter", link)?no_esc}</p>
</@layout.emailLayout>