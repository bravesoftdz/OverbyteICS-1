unit OverbyteIcsPemtool2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, IniFiles;

type
  TfrmPemTool2 = class(TForm)
    Memo1: TMemo;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FInitialized : Boolean;
  public
    { Public-Deklarationen }
  end;

var
  frmPemTool2: TfrmPemTool2;

implementation

{$R *.DFM}

uses
   OverbyteIcsPemTool1;

const
    SectionDisplayWindow = 'DisplayWindow';
    KeyTop               = 'Top';
    KeyLeft              = 'Left';
    KeyWidth             = 'Width';
    KeyHeight            = 'Height';

procedure TfrmPemTool2.FormShow(Sender: TObject);
var
    IniFile : TIniFile;
begin
    if not FInitialized then begin
        FInitialized := TRUE;
        IniFile := TIniFile.Create(frmPemTool1.FIniFileName);
        Width   := IniFile.ReadInteger(SectionDisplayWindow, KeyWidth,  Width);
        Height  := IniFile.ReadInteger(SectionDisplayWindow, KeyHeight, Height);
        Top     := IniFile.ReadInteger(SectionDisplayWindow, KeyTop,
                                      (Screen.Height - Height) div 2); 
    end;
end;

procedure TfrmPemTool2.FormClose(Sender: TObject; var Action: TCloseAction);
    var
    IniFile : TIniFile;
begin
    IniFile := TIniFile.Create(frmPemTool1.FIniFileName);
    IniFile.WriteInteger(SectionDisplayWindow, KeyTop,         Top);
    IniFile.WriteInteger(SectionDisplayWindow, KeyLeft,        Left);
    IniFile.WriteInteger(SectionDisplayWindow, KeyWidth,       Width);
    IniFile.WriteInteger(SectionDisplayWindow, KeyHeight,      Height);
end;

end.