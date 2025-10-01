namespace JamesPearson.MonacoAddIn;

controladdin FileContentControl
{
    RequestedHeight = 400;
    RequestedWidth = 600;
    MinimumHeight = 300;
    MinimumWidth = 400;
    VerticalStretch = true;
    VerticalShrink = true;
    HorizontalStretch = true;
    HorizontalShrink = true;

    StartupScript = './startup.js';
    Scripts = './functions.js', 'https://cdnjs.cloudflare.com/ajax/libs/monaco-editor/0.52.2/min/vs/loader.min.js';
    StyleSheets = './FileContentControl.css';

    event ControlReady();
    event OnContentSubmitted(content: Text);

    procedure SetContent(content: Text);
    procedure SetLanguage(language: Text);
}