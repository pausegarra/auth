<#macro emailLayout>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            font-family: system-ui, -apple-system, sans-serif;
            background-color: #f4f4f5; /* zinc-100 */
            margin: 0;
            padding: 0;
            color: #18181b; /* zinc-900 */
        }
        .container {
            max-width: 600px;
            margin: 40px auto;
            background-color: #ffffff;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
        }
        .header {
            background-color: #ea580c; /* orange-600 (primary color) */
            padding: 30px;
            text-align: center;
        }
        .header h1 {
            color: #ffffff;
            margin: 0;
            font-size: 24px;
            font-weight: 600;
        }
        .content {
            padding: 40px 30px;
            line-height: 1.6;
            color: #3f3f46; /* zinc-700 */
        }
        .content p {
            margin-bottom: 20px;
        }
        .button-container {
            text-align: center;
            margin: 30px 0;
        }
        .button {
            display: inline-block;
            background-color: #ea580c; /* orange-600 */
            color: #ffffff;
            text-decoration: none;
            padding: 12px 24px;
            border-radius: 8px;
            font-weight: 600;
            font-size: 16px;
        }
        .button:hover {
            background-color: #c2410c; /* orange-700 */
        }
        .footer {
            background-color: #f4f4f5; /* zinc-100 */
            padding: 20px;
            text-align: center;
            font-size: 12px;
            color: #71717a; /* zinc-500 */
            border-top: 1px solid #e4e4e7; /* zinc-200 */
        }
        .footer a {
            color: #ea580c;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>${realmName!''}</h1>
        </div>
        <div class="content">
            <#nested>
        </div>
        <div class="footer">
            <p>&copy; ${.now?string('yyyy')} ${realmName!''}. All rights reserved.</p>
        </div>
    </div>
</body>
</html>
</#macro>