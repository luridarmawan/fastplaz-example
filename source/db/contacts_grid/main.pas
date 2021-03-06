unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcgi, HTTPDefs, fastplaz_handler, html_lib, database_lib;

type
  TMainModule = class(TMyCustomWebModule)
    procedure RequestHandler(Sender: TObject; ARequest: TRequest;
      AResponse: TResponse; var Handled: boolean);
  private
    function Tag_MainContent_Handler(const TagName: string; Params: TStringList): string;
  public
    constructor CreateNew(AOwner: TComponent; CreateMode: integer); override;
    destructor Destroy; override;
  end;

implementation

uses theme_controller, common;

constructor TMainModule.CreateNew(AOwner: TComponent; CreateMode: integer);
begin
  inherited CreateNew(AOwner, CreateMode);
  OnRequest := @RequestHandler;
end;

destructor TMainModule.Destroy;
begin
  inherited Destroy;
end;

procedure TMainModule.RequestHandler(Sender: TObject; ARequest: TRequest;
  AResponse: TResponse; var Handled: boolean);
begin
  Tags['$maincontent'] := @Tag_MainContent_Handler; //<<-- tag $maincontent handler

  ThemeUtil.isCleanTag := True;
  Response.Content := ThemeUtil.Render();
  Handled := True;
end;

function TMainModule.Tag_MainContent_Handler(const TagName: string;
  Params: TStringList): string;
begin

  // your code here
  Result := h3('Contact Grid - example how to use database model and json.');
  Result := Result + '';
end;


end.
