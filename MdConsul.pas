{-------------------------------------------------------------------------------
 Nome da Unit: MdLancam

 Empresa:      Consystec
 Sistema:      Sistema Contabil
 Versão:       0.1 Beta
 Autor:        Itarci José Possamai
 Descrição:    Modelo de lançamentos
 Data Início:  07/07/2005
-------------------------------------------------------------------------------}


unit MdConsul;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Menus, ActnList, Clipbrd, StdCtrls,
  ExtCtrls, cxData, cxEdit, DB, cxGridLevel, cxGridCustomView, cxGridTableView,
  cxGridDBTableView, cxGrid, StrUtils, cxDropDownEdit, cxDBEdit, cxDataStorage,
  cxDBLookupComboBox, DBCtrls, cxStyles, cxCustomData, cxGraphics, cxClasses,
  cxControls, cxFilter, cxDBData, OracleData, cxGridCustomTableView, Oracle,
  Buttons, DBGrids;

type
  TFMdConsul = class(TForm)
    srcConsul: TDataSource;
    OraDsConsul: TOracleDataSet;
    procedure actGravExecute(Sender: TObject);
    procedure ActLanSairExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GanhaFocu(Sender: TObject);
    procedure PerdeFocu(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actAtuaExecute(Sender: TObject);
    procedure actCancExecute(Sender: TObject);
    procedure actExclExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actAdicExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
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
    function VerifDup(Codig, Campo, Tabela: String): Boolean;
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
  FMdConsul: TFMdConsul;
implementation

uses DmConBas, UnFunPro, UnConsts;

{$R *.dfm}

function TFMdConsul.VerifDup(Codig, Campo, Tabela: String): Boolean;
var
  qSQL : TOracleQuery;
  VlCodi : Integer;
  VlCamp, VlRslt : String;
begin
  VerifDup := False;
  VlCodi := OraDsConsul.FieldByName(Codig).AsInteger;
  VlCamp := OraDsConsul.FieldByName(Campo).AsString;
  qSQL := TOracleQuery.Create(Self);
  with qSQL do
    try
      Session := OraDsConsul.Session;
      SQL.Text := 'Select ' + Codig + ' from ' + Tabela + ' where ' + Codig +
        ' <> :VlCodi and ' + Campo + ' = :VlCamp';
      DeclareVariable('VlCodi', otInteger);
      DeclareVariable('VlCamp', otString);
      SetVariable('VlCodi', VlCodi);
      SetVariable('VlCamp', VlCamp);
      Execute;
      if RowCount > 0 then begin
        VlRslt := Field(0);
        MessageDlg('Já existe um registro lançado com este número de ' +
          OraDsConsul.FieldByName(Campo).DisplayLabel + ' com o código '+
            VlRslt, mtError, [mbOk],0);
        VerifDup := True;
      end;
    finally
      Close;
      Free;
    end;
end;

procedure TFMdConsul.AdicFiltro(const Campo: String; const Inteiro: Integer;
  const ZeroVazio: Boolean);
begin
  if (Inteiro <> 0) or (not ZeroVazio) then
    Filtros.Add(Campo + ' = ' + IntToStr(Inteiro));
end;

procedure TFMdConsul.AdicFiltro(const Campo: String; const Valor: Double;
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

procedure TFMdConsul.AdicFiltro(const Campo: String; Str: String);
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

procedure TFMdConsul.AdicFiltro(const Campo: String; const Dat: TDateTime;
  Data: Boolean);
begin
  if (Dat <> 0) then
    Filtros.Add(Campo + ' = ' + QuotedStr(FormatDateTime('DD.MM.YYYY', Dat)));
end;

procedure TFMdConsul.AdicFiltro(const Condicao: String);
begin
  if Condicao <> '' then
    Filtros.Add(Condicao);
end;

procedure TFMdConsul.AdicFiltro(const Campo: String; const D1, D2: TDateTime);
var
  S : string;
begin
  if (D1 <> 0) and (D2 <> 0) then begin
    S := Campo + ' between ' + QuotedStr(FormatDateTime('DD.MM.YYYY', d1)) +
      ' and ' + QuotedStr(FormatDateTime('DD.MM.YYYY', d2));
    Filtros.Add(S);
  end;
end;

procedure TFMdConsul.AplicarFiltro;
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

procedure TFMdConsul.LanUsarFiltr(const Value: String);
begin
  FLanFiltr := Value;
  if Value <> '' then
    FLanStSQL[4] := 'and '+ Value;
  OraDsConsul.Close;
  OraDsConsul.SQL.Text := FLanStSQL.Text;
  OraDsConsul.Open;
end;

procedure TFMdConsul.LanUsarOrdem(const Value: String);
begin
  FLanOrdem := Value;
  FLanStSQL[6] := 'order by '+ Value;
  ReAbrir;
end;

procedure TFMdConsul.ReAbrir;
var
  Bkm : TBookMark;
begin
  with OraDsConsul do
    try
      DisableControls;
      Bkm := Bookmark;
      Close;
      SQL.Text := FLanStSQL.Text;
      Open;
      Bookmark := Bkm;
    finally
      EnableControls;
    end;
end;

procedure TFMdConsul.TentaApagar(Dataset: TOracleDataset;
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

procedure TFMdConsul.FormCreate(Sender: TObject);
begin
  Filtros := TStringList.Create;
  FLanStSQL := TStringList.Create;
  FLanStSQL.Text := OraDsConsul.SQL.Text;
  FLanStSQL.Add(' ');
  FLanStSQL.Add(' ');
  FLanStSQL.Add(' ');
  OraDsConsul.SQL.Text := FLanStSQL.Text;
  OraDsConsul.Open;
end;

procedure TFMdConsul.FormDestroy(Sender: TObject);
begin
  FreeAndNil(Filtros);
  FreeAndNil(FLanStSQL);
end;

procedure TFMdConsul.ProxControle(Direcao: Integer; var Tecla: Word);
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

procedure TFMdConsul.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Screen.ActiveControl is TcxDBCalcEdit) then
    if TcxDBCalcEdit(Screen.ActiveControl).DroppedDown then
      Exit;
  if ApagaChar and (Key = #13) then
    key := #0;
  ApagaChar := False;
end;

procedure TFMdConsul.FormKeyDown(Sender: TObject; var Key: Word;
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



procedure TFMdConsul.FormClose(Sender: TObject; var Action: TCloseAction);
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

procedure TFMdConsul.ActLanSairExecute(Sender: TObject);
begin
  if ActiveControl.ClassType <> TDBGrid then
    Close;
end;

procedure TFMdConsul.GanhaFocu(Sender: TObject);
begin
  ComponenteEnter(Sender);
end;

procedure TFMdConsul.PerdeFocu(Sender: TObject);
begin
  ComponenteExit(Sender, TComponent(Sender).Tag);
end;

procedure TFMdConsul.actAdicExecute(Sender: TObject);
begin
  OraDsConsul.Insert;
end;

procedure TFMdConsul.actEditExecute(Sender: TObject);
begin
  OraDsConsul.Edit;
end;

procedure TFMdConsul.actExclExecute(Sender: TObject);
begin
  if OraDsConsul.IsEmpty then
    MessageBox(GetActiveWindow, PChar(MSG_NENHMREG), PChar(Application.Title),
      MB_ICONWARNING)
  else
    if (MessageBox(GetActiveWindow,PChar(MSG_DELETREG),PChar(Application.Title),
      MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYes)
        and (not OraDsConsul.IsEmpty) then
          TentaApagar(OraDsConsul, True);
end;

procedure TFMdConsul.actCancExecute(Sender: TObject);
begin
  OraDsConsul.Cancel;
  OraDsConsul.CancelUpdates;
end;

procedure TFMdConsul.actAtuaExecute(Sender: TObject);
begin
  OraDsConsul.Refresh;
end;

procedure TFMdConsul.actGravExecute(Sender: TObject);
begin
  {}
end;

procedure TFMdConsul.actConsExecute(Sender: TObject);
begin
  {}
end;

procedure TFMdConsul.actFiltExecute(Sender: TObject);
begin
  {}
end;

procedure TFMdConsul.actImprExecute(Sender: TObject);
begin
  {}
end;

end.
