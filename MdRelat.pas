{-------------------------------------------------------------------------------
 Nome da Unit: MdLancam

 Empresa:      Consystec
 Sistema:      Sistema Contabil
 Versão:       0.1 Beta
 Autor:        Itarci José Possamai
 Descrição:    Modelo de lançamentos
 Data Início:  07/07/2005
-------------------------------------------------------------------------------}


unit MdRelat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Menus, ActnList, Clipbrd, StdCtrls,
  ExtCtrls, cxData, cxEdit, DB, cxGridLevel, cxGridCustomView, cxGridTableView,
  cxGridDBTableView, cxGrid, StrUtils, cxDropDownEdit, cxDBEdit, cxDataStorage,
  cxDBLookupComboBox, DBCtrls, cxStyles, cxCustomData, cxGraphics, cxClasses,
  cxControls, cxFilter, cxDBData, OracleData, cxGridCustomTableView, Oracle,
  Buttons, DBGrids, cxLookAndFeelPainters, cxButtons,
  cxContainer, cxImage, cxLookAndFeels;

type
  TFMdRelat = class(TForm)
    panTitulo: TPanel;
    panCampo: TPanel;
    panMsg: TPanel;
    PlnDados: TPanel;
    btnImprimir: TcxButton;
    btnCancelar: TcxButton;
    Progres: TPanel;
    Animate: TAnimate;
    procedure FormCreate(Sender: TObject);
    procedure PlnDadosMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PlnDadosMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PlnDadosMouseActivate(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y, HitTest: Integer;
      var MouseActivate: TMouseActivate);
    procedure PlnDadosEnter(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure actGravExecute(Sender: TObject);
    procedure ActLanSairExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GanhaFocu(Sender: TObject);
    procedure PerdeFocu(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actConsExecute(Sender: TObject);
    procedure actFiltExecute(Sender: TObject);
    procedure actImprExecute(Sender: TObject);
  private
    { Private declarations }
    ApagaChar : Boolean;
    FLanStSQL : TStrings;
    FLanFiltr, FLanOrdem : String;
    procedure LanUsarFiltr(const Value: String);
    procedure LanUsarOrdem(const Value: String);
    procedure TentaApagar(Dataset: TOracleDataset; FazCommit: Boolean = False;
      Confirmar: Boolean = False);
    procedure ReAbrir;
    procedure ProxControle(Direcao: Integer; var Tecla: Word);
  protected
    { protected declarations }
    Filtros : TStrings;
    property LanFiltr : String read FLanFiltr write LanUsarFiltr;
    property LanOrdem : String read FLanOrdem write LanUsarOrdem;
    procedure AdicFiltro(const Campo: String; Str: String); overload;
    procedure AdicFiltro(const Campo: String; const Valor: Double;
      const ZeroVazio: Boolean = True); overload;
    procedure AdicFiltro(const Campo: String; const Inteiro: Integer;
      const ZeroVazio: Boolean = True); overload;
    procedure AdicFiltro(const Campo: String; const Dat: TDateTime;
      Data: Boolean); overload;
    procedure AdicFiltro(const Campo: String; const D1,D2: TDateTime); overload;
    procedure AdicFiltro(const Condicao: String); overload;
    procedure AplicarFiltro;
  public
    { Public declarations }
  end;

var
  FMdRelat: TFMdRelat;
implementation

uses UnFunPro, UnConsts, DmConBas;

{$R *.dfm}



procedure TFMdRelat.AdicFiltro(const Campo: String; const Inteiro: Integer;
  const ZeroVazio: Boolean);
begin
  if (Inteiro <> 0) or (not ZeroVazio) then
    Filtros.Add(Campo + ' = ' + IntToStr(Inteiro));
end;

procedure TFMdRelat.AdicFiltro(const Campo: String; const Valor: Double;
  const ZeroVazio: Boolean);
var
  DS : char;
begin
   
  if (Valor <> 0) or (not ZeroVazio) then begin
    DS := FormatSettings.DecimalSeparator;
    FormatSettings.DecimalSeparator := '.';
    try
      Filtros.Add(Campo + ' = ' + FloatToStr(Valor));
    finally
      FormatSettings.DecimalSeparator := DS;
    end;
  end;
end;

procedure TFMdRelat.AdicFiltro(const Campo: String; Str: String);
begin
  if Str <> '' then begin
    Str := Trim(Str);
    if (Pos('*', Str) > 0) or (Pos('%', Str) > 0) then begin
      Str := AnsiReplaceText(Str, '*', '%');
      Str := ' like '+ QuotedStr(Str);
    end else
      Str := ' like ' + QuotedStr(Str + '%');
    Filtros.Add(Campo + Str);
  end;
end;

procedure TFMdRelat.AdicFiltro(const Campo: String; const Dat: TDateTime;
  Data: Boolean);
begin
  if (Dat <> 0) then
    Filtros.Add(Campo + ' = ' + QuotedStr(FormatDateTime('DD.MM.YYYY', Dat)));
end;

procedure TFMdRelat.AdicFiltro(const Condicao: String);
begin
  if Condicao <> '' then
    Filtros.Add(Condicao);
end;

procedure TFMdRelat.AdicFiltro(const Campo: String; const D1, D2: TDateTime);
var
  S : string;
begin
  if (D1 <> 0) and (D2 <> 0) then begin
    S := Campo + ' between ' + QuotedStr(FormatDateTime('DD.MM.YYYY', d1)) +
      ' and ' + QuotedStr(FormatDateTime('DD.MM.YYYY', d2));
    Filtros.Add(S);
  end;
end;

procedure TFMdRelat.AplicarFiltro;
var
  Str : string;
  K : Integer;
begin
  if Filtros.Count <> 0 then begin
    Str := Filtros[0];
    if Filtros.Count > 1 then
      for K := 1 to Filtros.Count - 1 do
        Str := Str + ' and ' + Filtros[K];
  end;
  LanFiltr := Str;
end;

procedure TFMdRelat.LanUsarFiltr(const Value: String);
begin

end;

procedure TFMdRelat.LanUsarOrdem(const Value: String);
begin
  FLanOrdem := Value;
  FLanStSQL[6] := 'order by '+ Value;
  ReAbrir;
end;

procedure TFMdRelat.ReAbrir;
begin

end;

procedure TFMdRelat.TentaApagar(Dataset: TOracleDataset;
  FazCommit: Boolean = False; Confirmar: Boolean = False);
begin
  if Confirmar then
    if MessageBox(GetActiveWindow, PChar(MSG_DELETREG),PChar(Application.Title),
      MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON1) <> mrYes then
        Exit;
  try
    Dataset.Delete;
    if FazCommit then
      Dataset.Session.Commit;
  finally
    if FazCommit then
      Dataset.Session.Rollback;
  end;
end;

procedure TFMdRelat.FormDestroy(Sender: TObject);
begin
  FreeAndNil(Filtros);
  FreeAndNil(FLanStSQL);
end;

procedure TFMdRelat.ProxControle(Direcao: Integer; var Tecla: Word);
begin
  if (Screen.ActiveControl is TcxDBCalcEdit) then
    if TcxDBCalcEdit(Screen.ActiveControl).DroppedDown then
      Exit;

  if not (Screen.ActiveControl is TCustomMemo) and
    not (Screen.ActiveControl is TcxGridSite) then begin

    if (Screen.ActiveControl is TcxDBDateEdit) then begin
      if not (Screen.ActiveControl as TcxDBDateEdit).DroppedDown then begin
        SelectNext(Screen.ActiveControl, Direcao = 0, True);
        Tecla := 0;
      end;
    end else

    if (Screen.ActiveControl is TcxDbLookupComboBox) then begin
      if not (Screen.ActiveControl as TcxDbLookupComboBox).DroppedDown then begin
        SelectNext(Screen.ActiveControl, Direcao = 0, True);
        Tecla := 0;
      end;
    end else

    if (Screen.ActiveControl is TDbComboBox) then begin
      if not (Screen.ActiveControl as TDbComboBox).DroppedDown then begin
        SelectNext(Screen.ActiveControl, Direcao = 0, True);
        Tecla := 0;
      end;

    end else begin
      SelectNext(Screen.ActiveControl, Direcao = 0, True);
      Tecla := 0;
    end;
  end;
end;

procedure TFMdRelat.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Screen.ActiveControl is TcxDBCalcEdit) then
    if TcxDBCalcEdit(Screen.ActiveControl).DroppedDown then
      Exit;
  if ApagaChar and (Key = #13) then
    key := #0;
  ApagaChar := False;
end;

procedure TFMdRelat.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
const
  Dir_Prox = 0;
  Dir_Ante = 1;
begin
  if Screen.ActiveControl is TcxCustomComboBoxInnerEdit then
    if TcxDBLookupComboBox(Screen.ActiveControl.Parent).DroppedDown then
      Exit;
  if (Screen.ActiveControl is TcxDBCalcEdit) then
    if TcxDBCalcEdit(Screen.ActiveControl).DroppedDown then
      Exit;
  if (Screen.ActiveControl is TCustomMemo) then
    Exit;
  if Shift = [] then
    Case key of
      VK_RETURN:
        begin
          ApagaChar := (Screen.ActiveControl is TCustomEdit) and
            not (Screen.ActiveControl is TcxDBDateEdit);
          SelectNext(Screen.ActiveControl, True, True);
          key := 0;
        end;
      VK_DOWN : ProxControle(Dir_Prox, key);
      VK_UP : ProxControle(Dir_Ante, key);
    end;
end;



procedure TFMdRelat.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  {if actCanc.Enabled then
    Case MessageBox(GetActiveWindow, PChar(MSG_SALVCANC),
      PChar(Application.Title), MB_ICONQUESTION + MB_YESNOCANCEL) of
        IDYES: tbnGrav.Click;
        IDNO:  tbnCanc.Click;
        IDCANCEL: Action := caNone;
    end;}
  Action := caFree;
end;

procedure TFMdRelat.ActLanSairExecute(Sender: TObject);
begin
  if ActiveControl.ClassType <> TDBGrid then
    Close;
end;

procedure TFMdRelat.GanhaFocu(Sender: TObject);
begin
  ComponenteEnter(Sender);
end;

procedure TFMdRelat.PerdeFocu(Sender: TObject);
begin
  ComponenteExit(Sender, TComponent(Sender).Tag);
end;

procedure TFMdRelat.actGravExecute(Sender: TObject);
begin
  {}
end;

procedure TFMdRelat.actConsExecute(Sender: TObject);
begin
  {}
end;

procedure TFMdRelat.actFiltExecute(Sender: TObject);
begin
  {}
end;

procedure TFMdRelat.actImprExecute(Sender: TObject);
begin
  {}
end;

procedure TFMdRelat.btnImprimirClick(Sender: TObject);
begin
  panTitulo.Caption := 'Modo de Impressão';
  Progres.Visible := true;
  Animate.Visible := True;
  Animate.Active := True;
  Refresh;
end;

procedure TFMdRelat.btnCancelarClick(Sender: TObject);
begin
  panTitulo.Caption := 'Cancelado!'
end;

procedure TFMdRelat.PlnDadosEnter(Sender: TObject);
begin
  panTitulo.Caption := 'Modo de Seleção';
end;

procedure TFMdRelat.PlnDadosMouseActivate(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y, HitTest: Integer;
  var MouseActivate: TMouseActivate);
begin
  panTitulo.Caption := 'Modo de Seleção'
end;

procedure TFMdRelat.PlnDadosMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  panTitulo.Caption := 'Modo de Seleção';
end;

procedure TFMdRelat.PlnDadosMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  panTitulo.Caption := 'Modo de Seleção';
end;

procedure TFMdRelat.FormCreate(Sender: TObject);
begin
  //C:\Sistemas\Gerencial\Relatorios\Aguardar.avi
  Animate.FileName := Parametro.DS_CAMREL+'Relatorios\Aguardar.avi';
end;

end.
