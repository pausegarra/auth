<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false showAnotherWayIfPresent=true>
  <!DOCTYPE html>
  <html class="${properties.kcHtmlClass!}" lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><#nested "title"></title>

      <#if properties.favicon?has_content>
        <link rel="icon" href="${properties.favicon}" />
      </#if>

    <link href="${url.resourcesPath}/css/styles.css" rel="stylesheet" />

      <#if properties.styles?has_content>
          <#list properties.styles?split(' ') as style>
              <#if style?has_content>
                <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
              </#if>
          </#list>
      </#if>

      <#if properties.scripts?has_content>
          <#list properties.scripts?split(' ') as script>
            <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
          </#list>
      </#if>

      <#if scripts??>
          <#list scripts as script>
            <script src="${script}" type="text/javascript"></script>
          </#list>
      </#if>
  </head>
  <body class="custom-body ${properties.kcBodyClass!}">
  <div class="custom-container">
    <div class="custom-logo-container">
      <img src="${url.resourcesPath}/img/${client.clientId}.svg" alt="logo" class="custom-logo">
    </div>
    <div class="custom-card">
        <#if displayMessage && message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
          <div class="alert-${message.type} ${properties.kcAlertClass!}">
            <span class="alert-text">${kcSanitize(message.summary)?no_esc}</span>
          </div>
        </#if>

        <#nested "header">

      <div class="custom-content">

          <#nested "form">

          <#if displayInfo>
              <#nested "info">
          </#if>

          <#nested "socialProviders">
      </div>
    </div>
  </div>
  </body>
  </html>
</#macro>