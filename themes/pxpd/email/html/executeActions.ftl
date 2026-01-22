<#import "template.ftl" as layout>
<@layout.emailLayout>
    <p>${msg("executeActionsBodyHtml", link, linkExpiration, realmName, linkExpirationFormatter(linkExpiration))?no_esc}</p>

    <div class="button-container">
        <a href="${link}" class="button">${msg("executeActionsLinkText")}</a>
    </div>

    <p style="font-size: 14px; color: #71717a;">${msg("executeActionsBodyHtmlFooter", link)?no_esc}</p>
</@layout.emailLayout>