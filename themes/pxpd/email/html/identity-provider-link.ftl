<#import "template.ftl" as layout>
<@layout.emailLayout>
    <p>${msg("identityProviderLinkBodyHtml", identityProviderAlias, realmName, identityProviderContext.username, link, linkExpiration, linkExpirationFormatter(linkExpiration))?no_esc}</p>

    <div class="button-container">
        <a href="${link}" class="button">${msg("identityProviderLinkLinkText")}</a>
    </div>

    <p style="font-size: 14px; color: #71717a;">${msg("identityProviderLinkBodyHtmlFooter", link)?no_esc}</p>
</@layout.emailLayout>