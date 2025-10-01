namespace JamesPearson.MonacoAddIn;

page 90103 "File Content"
{
    PageType = Card;
    ApplicationArea = All;
    Caption = 'File Content';
    UsageCategory = None;

    layout
    {
        area(Content)
        {
            usercontrol(FileContentCtrl; FileContentControl)
            {
                ApplicationArea = All;

                trigger ControlReady()
                begin
                    CurrPage.FileContentCtrl.SetContent(Content);
                    CurrPage.FileContentCtrl.SetLanguage(Language);
                end;

                trigger OnContentSubmitted(content: Text)
                begin
                    SetContent(content);
                end;
            }
        }
    }

    var
        Content, Language, FileName : Text;

    procedure SetContent(NewContent: Text)
    begin
        Content := NewContent;
    end;

    procedure SetFileName(NewFileName: Text)
    begin
        FileName := NewFileName;
        SetLanguage();
    end;

    local procedure SetLanguage()
    var
        Extension: Text;
    begin
        Extension := FileName.Substring(FileName.LastIndexOf('.') + 1).ToLower();

        case Extension of
            'al':
                Language := 'al';
            'cs':
                Language := 'csharp';
            'js':
                Language := 'javascript';
            'json':
                Language := 'json';
            'xml':
                Language := 'xml';
            'html', 'htm':
                Language := 'html';
            'css':
                Language := 'css';
            'txt':
                Language := 'plaintext';
            else
                Language := 'plaintext';
        end;
    end;

    procedure GetContent(): Text
    begin
        exit(Content);
    end;
}