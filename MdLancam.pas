{-------------------------------------------------------------------------------
 Nome da Unit: MdLancam

 Empresa:      Consystec
 Sistema:      Sistema Contabil
 Versão:       0.1 Beta
 Autor:        Itarci José Possamai
 Descrição:    Modelo de lançamentos
 Data Início:  07/07/2005
-------------------------------------------------------------------------------}


unit MdLancam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Menus, ActnList, Clipbrd, StdCtrls,
  ExtCtrls, cxData, cxEdit, DB, cxGridLevel, cxGridCustomView, cxGridTableView,
  cxGridDBTableView, cxGrid, StrUtils, cxDropDownEdit, cxDBEdit, cxDataStorage,
  cxDBLookupComboBox, DBCtrls, cxStyles, cxCustomData, cxGraphics, cxClasses,
  cxControls, cxFilter, cxDBData, OracleData, cxGridCustomTableView, Oracle,
  Buttons, DBGrids, cxLookAndFeelPainters, cxButtons, cxLookAndFeels,
  System.ImageList, System.Actions, cxImageList;

type
  TFMdLancam = class(TForm)
    actLista: TActionList;
    actDesfaz: TAction;
    actRecort: TAction;
    actCopiar: TAction;
    actColar: TAction;
    actAdic: TAction;
    actExcl: TAction;
    actEdit: TAction;
    actCons: TAction;
    actGrav: TAction;
    actCanc: TAction;
    actAtua: TAction;
    actFilt: TAction;
    actImpr: TAction;
    actFiltro1: TAction;
    actFiltro2: TAction;
    actFiltro3: TAction;
    actFiltro4: TAction;
    actFiltro5: TAction;
    actFiltro6: TAction;
    actFiltro7: TAction;
    actFiltro8: TAction;
    srcLancam: TDataSource;
    OraDsLancam: TOracleDataSet;
    ActLanSair: TAction;
    panTitulo: TPanel;
    panCampo: TPanel;
    panMsg: TPanel;
    PlnBotao: TPanel;
    panBotoes: TPanel;
    btnConfir: TcxButton;
    btnCancel: TcxButton;
    cxImageList: TcxImageList;
    CoolBar: TPanel;
    ToolBar: TFlowPanel;
    tbnAdic: TcxButton;
    tbnEdit: TcxButton;
    tbnExcl: TcxButton;
    tbnGrav: TcxButton;
    tbnCanc: TcxButton;
    tbnAtua: TcxButton;
    tbnFilt: TcxButton;
    tbnImpr: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure actGravExecute(Sender: TObject);
    procedure ActLanSairExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OraDsLancamAfterScroll(DataSet: TDataSet);
    procedure OraDsLancamAfterPost(DataSet: TDataSet);
    procedure OraDsLancamAfterOpen(DataSet: TDataSet);
    procedure OraDsLancamAfterInsert(DataSet: TDataSet);
    procedure OraDsLancamAfterEdit(DataSet: TDataSet);
    procedure OraDsLancamAfterDelete(DataSet: TDataSet);
    procedure OraDsLancamAfterCancel(DataSet: TDataSet);
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
    procedure AtualizaAcoes(Editando: Boolean);
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
  FMdLancam: TFMdLancam;
implementation

uses DmConBas, UnFunPro, UnConsts, LnPepe;

{$R *.dfm}

function TFMdLancam.VerifDup(Codig, Campo, Tabela: String): Boolean;
var
  qSQL : TOracleQuery;
  VlCodi : Integer;
  VlCamp, VlRslt : String;
begin
  VerifDup := False;
  VlCodi := OraDsLancam.FieldByName(Codig).AsInteger;
  VlCamp := OraDsLancam.FieldByName(Campo).AsString;
  qSQL := TOracleQuery.Create(Self);
  with qSQL do
    try
      Session := OraDsLancam.Session;
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
          OraDsLancam.FieldByName(Campo).DisplayLabel + ' com o código '+
            VlRslt, mtError, [mbOk],0);
        VerifDup := True;
      end;
    finally
      Close;
      Free;
    end;
end;

procedure TFMdLancam.AdicFiltro(const Campo: String; const Inteiro: Integer;
  const ZeroVazio: Boolean);
begin
  if (Inteiro <> 0) or (not ZeroVazio) then
    Filtros.Add(Campo + ' = ' + IntToStr(Inteiro));
end;

procedure TFMdLancam.AdicFiltro(const Campo: String; const Valor: Double;
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

procedure TFMdLancam.AdicFiltro(const Campo: String; Str: String);
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

procedure TFMdLancam.AdicFiltro(const Campo: String; const Dat: TDateTime;
  Data: Boolean);
begin
  if (Dat <> 0) then
    Filtros.Add(Campo + ' = ' + QuotedStr(FormatDateTime('DD.MM.YYYY', Dat)));
end;

procedure TFMdLancam.AdicFiltro(const Condicao: String);
begin
  if Condicao <> '' then
    Filtros.Add(Condicao);
end;

procedure TFMdLancam.AdicFiltro(const Campo: String; const D1, D2: TDateTime);
var
  S : string;
begin
  if (D1 <> 0) and (D2 <> 0) then begin
    S := Campo + ' between ' + QuotedStr(FormatDateTime('DD.MM.YYYY', d1)) +
      ' and ' + QuotedStr(FormatDateTime('DD.MM.YYYY', d2));
    Filtros.Add(S);
  end;
end;

procedure TFMdLancam.AplicarFiltro;
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

procedure TFMdLancam.LanUsarFiltr(const Value: String);
begin
  FLanFiltr := Value;
  if Value <> '' then
    FLanStSQL[4] := 'and '+ Value;
  OraDsLancam.Close;
  OraDsLancam.SQL.Text := FLanStSQL.Text;
  OraDsLancam.Open;
end;

procedure TFMdLancam.LanUsarOrdem(const Value: String);
begin
  FLanOrdem := Value;
  FLanStSQL[6] := 'order by '+ Value;
  ReAbrir;
end;

procedure TFMdLancam.ReAbrir;
var
  Bkm : TBookMark;
begin
  with OraDsLancam do
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

procedure TFMdLancam.TentaApagar(Dataset: TOracleDataset;
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

procedure TFMdLancam.FormCreate(Sender: TObject);
begin
  Cascade;
  Application.HintColor := clSkyBlue;
  Filtros := TStringList.Create;
  FLanStSQL := TStringList.Create;
  FLanStSQL.Text := OraDsLancam.SQL.Text;
  FLanStSQL.Add(' ');
  FLanStSQL.Add(' ');
  FLanStSQL.Add(' ');
  OraDsLancam.SQL.Text := FLanStSQL.Text;
  OraDsLancam.Open;
end;

procedure TFMdLancam.FormDestroy(Sender: TObject);
begin
  FreeAndNil(Filtros);
  FreeAndNil(FLanStSQL);
end;

procedure TFMdLancam.ProxControle(Direcao: Integer; var Tecla: Word);
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

procedure TFMdLancam.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Screen.ActiveControl is TcxDBCalcEdit) then
    if TcxDBCalcEdit(Screen.ActiveControl).DroppedDown then
      Exit;
  if ApagaChar and (Key = #13) then
    key := #0;
  ApagaChar := False;
end;

procedure TFMdLancam.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFMdLancam.AtualizaAcoes(Editando: Boolean);
var
  TemRegistro: Boolean;
begin
  TemRegistro := not OraDsLancam.IsEmpty;
  actCanc.Enabled := Editando;
  actGrav.Enabled := Editando;
  actAdic.Enabled := not Editando;
  actExcl.Enabled := actAdic.Enabled and TemRegistro;
  actFilt.Enabled := actAdic.Enabled;
  actAtua.Enabled := actAdic.Enabled;
  actEdit.Enabled := actAdic.Enabled and TemRegistro;
  actCons.Enabled := actEdit.Enabled;
end;

procedure TFMdLancam.OraDsLancamAfterScroll(DataSet: TDataSet);
begin
  actExcl.Enabled := not(DataSet.IsEmpty or (DataSet.State in dsEditModes));
  AtualizaAcoes(OraDsLancam.State in dsEditModes);
end;

procedure TFMdLancam.FormClose(Sender: TObject; var Action: TCloseAction);
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

procedure TFMdLancam.ActLanSairExecute(Sender: TObject);
begin
  if ActiveControl.ClassType <> TDBGrid then
    Close;
end;

procedure TFMdLancam.GanhaFocu(Sender: TObject);
begin
  ComponenteEnter(Sender);
end;

procedure TFMdLancam.PerdeFocu(Sender: TObject);
begin
  ComponenteExit(Sender, TComponent(Sender).Tag);
end;

procedure TFMdLancam.actAdicExecute(Sender: TObject);
begin                     
  OraDsLancam.Insert;
end;

procedure TFMdLancam.actEditExecute(Sender: TObject);
begin
  OraDsLancam.Edit;
end;

procedure TFMdLancam.actExclExecute(Sender: TObject);
begin
  if OraDsLancam.IsEmpty then
    MessageBox(GetActiveWindow, PChar(MSG_NENHMREG), PChar(Application.Title),
      MB_ICONWARNING)
  else
    if (MessageBox(GetActiveWindow,PChar(MSG_DELETREG),PChar(Application.Title),
      MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYes)
        and (not OraDsLancam.IsEmpty) then
          TentaApagar(OraDsLancam, True);
end;

procedure TFMdLancam.actCancExecute(Sender: TObject);
begin
  OraDsLancam.Cancel;
  OraDsLancam.CancelUpdates;
end;

procedure TFMdLancam.actAtuaExecute(Sender: TObject);
begin
  OraDsLancam.Refresh;
end;

procedure TFMdLancam.actGravExecute(Sender: TObject);
begin
  {}
end;

procedure TFMdLancam.actConsExecute(Sender: TObject);
begin
  {}
end;

procedure TFMdLancam.actFiltExecute(Sender: TObject);
begin
  {}
end;

procedure TFMdLancam.actImprExecute(Sender: TObject);
begin
  {}
end;

procedure TFMdLancam.OraDsLancamAfterCancel(DataSet: TDataSet);
begin
  AtualizaAcoes(False);
end;

procedure TFMdLancam.OraDsLancamAfterDelete(DataSet: TDataSet);
begin
  AtualizaAcoes(False);
end;

procedure TFMdLancam.OraDsLancamAfterEdit(DataSet: TDataSet);
begin
  AtualizaAcoes(True);
end;

procedure TFMdLancam.OraDsLancamAfterInsert(DataSet: TDataSet);
begin
  AtualizaAcoes(True);
end;

procedure TFMdLancam.OraDsLancamAfterOpen(DataSet: TDataSet);
begin
  AtualizaAcoes(False);
end;

procedure TFMdLancam.OraDsLancamAfterPost(DataSet: TDataSet);
begin
  AtualizaAcoes(False);
end;

procedure TFMdLancam.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if actCanc.Enabled then
    Case MessageBox(GetActiveWindow, PChar(MSG_SALVCANC),
      PChar(Application.Title), MB_ICONQUESTION + MB_YESNOCANCEL) of
        IDYES: tbnGrav.Click;
        IDNO:  tbnCanc.Click;
        IDCANCEL: CanClose := False;
    end;
end;

procedure TFMdLancam.FormShow(Sender: TObject);
begin
  tbnAdic.Caption := '';
  tbnEdit.Caption := '';
  tbnExcl.Caption := '';
  tbnGrav.Caption := '';
  tbnCanc.Caption := '';
  tbnAtua.Caption := '';
  tbnFilt.Caption := '';
  tbnImpr.Caption := '';
end;

end.
