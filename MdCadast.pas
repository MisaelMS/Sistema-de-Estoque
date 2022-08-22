{-------------------------------------------------------------------------------
 Nome da Unit: MdCadast

 Empresa:      Consystec
 Sistema:      Sistema Contabil
 Versão:       0.1 Beta
 Autor:        Itarci José Possamai
 Descrição:    Modelo de cadastro
 Data Início:  16/06/2005
-------------------------------------------------------------------------------}


unit MdCadast;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Menus, ActnList, Clipbrd, StdCtrls,
  ExtCtrls, cxData, cxEdit, DB, cxGridLevel, cxGridCustomView, cxGridTableView,
  cxGridDBTableView, cxGrid, StrUtils, cxDropDownEdit, cxDBEdit, cxDataStorage,
  cxDBLookupComboBox, DBCtrls, cxStyles, cxCustomData, cxGraphics, cxClasses,
  cxControls, cxFilter, cxDBData, OracleData, cxGridCustomTableView, Oracle,
  Buttons, cxLookAndFeels, cxLookAndFeelPainters, cxNavigator, System.ImageList,
  System.Actions, cxDataControllerConditionalFormattingRulesManagerDialog,
  cxImageList, cxButtons;

type
  TFMdCadast = class(TForm)
    actLista: TActionList;
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
    panTitulo: TPanel;
    srcCadastro: TDataSource;
    OraDsCadast: TOracleDataSet;
    panCadastro: TPanel;
    Splitter: TSplitter;
    ActSair: TAction;
    panCampo: TPanel;
    panMsg: TPanel;
    grdCadastro: TcxGrid;
    grdCadastroTbv: TcxGridDBTableView;
    grdCadastroLvl: TcxGridLevel;
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
    procedure srcCadastroDataChange(Sender: TObject; Field: TField);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ActSairExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grdCadastroEnter(Sender: TObject);
    procedure OraDsCadastAfterScroll(DataSet: TDataSet);
    procedure OraDsCadastAfterPost(DataSet: TDataSet);
    procedure OraDsCadastAfterOpen(DataSet: TDataSet);
    procedure OraDsCadastAfterInsert(DataSet: TDataSet);
    procedure OraDsCadastAfterEdit(DataSet: TDataSet);
    procedure OraDsCadastAfterDelete(DataSet: TDataSet);
    procedure OraDsCadastAfterCancel(DataSet: TDataSet);
    procedure GanhaFocu(Sender: TObject);
    procedure PerdeFocu(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actAtuaExecute(Sender: TObject);
    procedure actCancExecute(Sender: TObject);
    procedure actExclExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure actAdicExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actConsExecute(Sender: TObject);
    procedure actGravExecute(Sender: TObject);
    procedure actFiltExecute(Sender: TObject);
    procedure actImprExecute(Sender: TObject);
  private
    { Private declarations }
    ApagaChar : Boolean;
    FCadStSQL : TStrings;
    FCadFiltr, FCadOrdem : String;
    procedure CadUsarFiltr(const Value: String);
    procedure CadUsarOrdem(const Value: String);
    procedure TentaApagar(Dataset: TOracleDataset; FazCommit: Boolean = False;
      Confirmar: Boolean = False);
    procedure ReAbrir;
    procedure ProxControle(Direcao: Integer; var Tecla: Word);
    procedure AtualizaAcoes(Editando: Boolean);

  protected
    { protected declarations }
    Filtros : TStrings;
    function VerifDup(Codig, Campo, Tabela: String): Boolean;
    property CadFiltr : String read FCadFiltr write CadUsarFiltr;
    property CadOrdem : String read FCadOrdem write CadUsarOrdem;
    procedure AdicFiltro(const Campo: String; Str, Tipo: String); overload;
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
    var bDelete : Boolean;
  end;

var
  FMdCadast: TFMdCadast;

implementation

uses DmConBas, UnConsts, UnFunPro;

{$R *.dfm}

procedure tbSetCapsLock(State: boolean);
begin
  if (State and ((GetKeyState(VK_CAPITAL) and 1) = 0)) or
  ((not State) and ((GetKeyState(VK_CAPITAL) and 1) = 1)) then
  begin
  keybd_event(VK_CAPITAL, $45, KEYEVENTF_EXTENDEDKEY or 0, 0);
  keybd_event(VK_CAPITAL, $45, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
  end;
end;


function TFMdCadast.VerifDup(Codig, Campo, Tabela: String): Boolean;
var
  qSQL : TOracleQuery;
  VlCodi : Integer;
  VlCamp, VlRslt : String;
begin
  VerifDup := False;
  VlCodi := OraDsCadast.FieldByName(Codig).AsInteger;
  VlCamp := OraDsCadast.FieldByName(Campo).AsString;
  qSQL := TOracleQuery.Create(Self);
  with qSQL do
    try
      Session := OraDsCadast.Session;
      SQL.Text := 'Select ' + Codig + ' from ' + Tabela + ' where ' + Codig +
        ' <> :VlCodi and ' + Campo + ' = :VlCamp';
      DeclareVariable('VlCodi', otInteger);
      DeclareVariable('VlCamp', otString);
      SetVariable('VlCodi', VlCodi);
      SetVariable('VlCamp', VlCamp);
      Execute;
      if RowCount > 0 then begin
        VlRslt := Field(0);
        MessageDlg('Já existe um registro cadastrado com este número de ' +
          OraDsCadast.FieldByName(Campo).DisplayLabel + ' com o código '+
            VlRslt, mtError, [mbOk],0);
        VerifDup := True;
      end;
    finally
      Close;
      Free;
    end;
end;

procedure TFMdCadast.AdicFiltro(const Campo: String; const Inteiro: Integer;
  const ZeroVazio: Boolean);
begin
  if (Inteiro <> 0) or (not ZeroVazio) then
    Filtros.Add(Campo + ' = ' + IntToStr(Inteiro));
end;

procedure TFMdCadast.AdicFiltro(const Campo: String; const Valor: Double;
  const ZeroVazio: Boolean);
var
  DS : char;
begin
  if (Valor <> 0) or (not ZeroVazio) then begin
    DS := FormatSettings.decimalSeparator;
    FormatSettings.decimalSeparator := '.';
    try
      Filtros.Add(Campo + ' = ' + FloatToStr(Valor));
    finally
      FormatSettings.DecimalSeparator := DS;
    end;
  end;
end;

procedure TFMdCadast.AdicFiltro(const Campo: String; Str, Tipo : String);
begin
  if Str <> '' then begin
    Str := Trim(Str);
    if (Pos('*', Str) > 0) or (Pos('%', Str) > 0) then begin
      Str := AnsiReplaceText(Str, '*', '%');
      Str := ' like '+ QuotedStr(Str);
    end else begin
      if Tipo = '%' then begin
        Str := ' like ' + QuotedStr('%' + Str + '%');
      end else begin
        if Tipo = '$' then
           Str := ' = ' + QuotedStr(Str)
        else Str := ' like ' + QuotedStr(Str + '%');
      end;
    end;
    Filtros.Add(Campo + Str);
  end;
end;

procedure TFMdCadast.AdicFiltro(const Campo: String; const Dat: TDateTime;
  Data: Boolean);
begin
  if (Dat <> 0) then
    Filtros.Add(Campo + ' = ' + QuotedStr(FormatDateTime('DD.MM.YYYY', Dat)));
end;

procedure TFMdCadast.AdicFiltro(const Condicao: String);
begin
  if Condicao <> '' then
    Filtros.Add(Condicao);
end;

procedure TFMdCadast.AdicFiltro(const Campo: String; const D1, D2: TDateTime);
var
  S : string;
begin
  if (D1 <> 0) and (D2 <> 0) then begin
    S := Campo + ' between ' + QuotedStr(FormatDateTime('DD.MM.YYYY', d1)) +
      ' and ' + QuotedStr(FormatDateTime('DD.MM.YYYY', d2));
    Filtros.Add(S);
  end;
end;

procedure TFMdCadast.AplicarFiltro;
var
  Str : string;
  K : Integer;
begin
  if Filtros.Count = 0 then
    Str := '1 = 2'
  else begin
    Str := Filtros[0];
    if Filtros.Count > 1 then
      for K := 1 to Filtros.Count - 1 do
        Str := Str + ' and ' + Filtros[K];
    end;
  CadFiltr := ' '+Str;
end;

procedure TFMdCadast.CadUsarFiltr(const Value: String);
var
  lStr: TStrings;
  Cont : Integer;
begin
  lStr := TStringList.Create;
  lStr.Text := OraDsCadast.SQL.Text;
  FCadFiltr := Value;
  OraDsCadast.SQL.Clear;
  for Cont := 0 to lStr.Count - 1 do begin
    if UpperCase(Copy(lStr[Cont], 1, 5))= 'WHERE' then
      Break;
     OraDsCadast.SQL.Add(lStr[Cont]);
  end;
  OraDsCadast.SQL.Add('WHERE '+ Value);
  OraDsCadast.Close;
  OraDsCadast.SQL.Text;
  OraDsCadast.Open
end;

procedure TFMdCadast.CadUsarOrdem(const Value: String);
begin
  FCadOrdem := Value;
  FCadStSQL[6] := 'order by '+ Value;
  ReAbrir;
end;

procedure TFMdCadast.ReAbrir;
var
  Bkm : TBookMark;
begin
  with OraDsCadast do
    try
      DisableControls;
      Bkm := Bookmark;
      Close;
      SQL.Text := FCadStSQL.Text;
      Open;
      Bookmark := Bkm;
    finally
      EnableControls;
    end;
end;

procedure TFMdCadast.TentaApagar(Dataset: TOracleDataset;
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
  Except
    on E: Exception do begin
      if FazCommit then begin
        Dataset.Session.Rollback;
//        if bDelete then begin
           MessageDlg('Não é possível excluir um ítem  usado em outro processo!', mtWarning, [mbOK], 0);
           panTitulo.Caption := 'Modo de Consulta';
           Abort;
//        end;
      end;
    end;
  end;
end;


procedure TFMdCadast.FormCreate(Sender: TObject);
begin
  tbSetCapsLock(false);
  Application.HintColor := clSkyBlue;
  //--> Verifica se o usuário esta logado no sistema
  if Parametro.CD_USUARI = Null then begin
     MessageDlg('Erro: Usuário não logado no sistema, favor'+
                ' logar novamente.', mtWarning, [mbOK], 0);
     close;
  end;
  //-->
  panTitulo.Caption := '  ' + Caption;
  grdCadastroTbv.RestoreFromIniFile(RDmConBas.CamPro + 'Objetos.ini');
  Filtros := TStringList.Create;
  FCadStSQL := TStringList.Create;
  FCadStSQL.Text := OraDsCadast.SQL.Text;
  FCadStSQL.Add(' ');
  FCadStSQL.Add(' ');
  FCadStSQL.Add(' ');
  OraDsCadast.SQL.Text := FCadStSQL.Text;
  OraDsCadast.Open;
  //-->
  if (FileExists('C:\Sistemas\Gerencial\Objetos.ini')) then
     DeleteFile('C:\Sistemas\Gerencial\Objetos.ini');

  Self.Top := 0;
  Self.Left := 0;

end;

procedure TFMdCadast.ProxControle(Direcao: Integer; var Tecla: Word);
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

procedure TFMdCadast.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Screen.ActiveControl is TcxDBCalcEdit) then
    if TcxDBCalcEdit(Screen.ActiveControl).DroppedDown then
      Exit;
  if ApagaChar and (Key = #13) then
    key := #0;
  ApagaChar := False;
end;

procedure TFMdCadast.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFMdCadast.AtualizaAcoes(Editando: Boolean);
var
  TemRegistro: Boolean;
begin
  TemRegistro := not OraDsCadast.IsEmpty;
  actCanc.Enabled := Editando;
  actGrav.Enabled := Editando;
  actAdic.Enabled := not Editando;
  actExcl.Enabled := actAdic.Enabled and TemRegistro;
  actFilt.Enabled := actAdic.Enabled;
  actAtua.Enabled := actAdic.Enabled;
  actEdit.Enabled := actAdic.Enabled and TemRegistro;
  actCons.Enabled := actEdit.Enabled;
end;

procedure TFMdCadast.OraDsCadastAfterScroll(DataSet: TDataSet);
begin
  actExcl.Enabled := not(DataSet.IsEmpty or (DataSet.State in dsEditModes));
  AtualizaAcoes(OraDsCadast.State in dsEditModes);
end;

procedure TFMdCadast.grdCadastroEnter(Sender: TObject);
begin
  if OraDsCadast.State in dsEditModes then
    Case MessageBox(Handle, PChar(MSG_SALVAREG), 'Confirmação', MB_YESNOCANCEL +
      MB_ICONQUESTION) of
        IDYES : actGrav.Execute;
        IDNO : actCanc.Execute;
        IDCANCEL : SelectNext(panCadastro, True, True);
    end;
end;

procedure TFMdCadast.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if actCanc.Enabled then
    Case MessageBox(GetActiveWindow, PChar(MSG_SALVCANC),
      PChar(Application.Title), MB_ICONQUESTION + MB_YESNOCANCEL) of
        IDYES : actGrav.Execute;
        IDNO :  actCanc.Execute;
        IDCANCEL : CanClose := False;
    end;
end;

procedure TFMdCadast.GanhaFocu(Sender: TObject);
begin
  ComponenteEnter(Sender);
end;

procedure TFMdCadast.PerdeFocu(Sender: TObject);
begin
  ComponenteExit(Sender, TComponent(Sender).Tag);
end;

procedure TFMdCadast.actAdicExecute(Sender: TObject);
begin
  SelectNext(panCadastro, True, True);
  OraDsCadast.Insert;
  panTitulo.Caption := 'Modo de Inserção';
end;

procedure TFMdCadast.actEditExecute(Sender: TObject);
begin
  SelectNext(panCadastro, True, True);
  OraDsCadast.Edit;
  panTitulo.Caption := 'Modo de Edição';
end;

procedure TFMdCadast.actGravExecute(Sender: TObject);
begin
  panTitulo.Caption := 'Modo de Gravação';
  SelectNext(panCadastro, True, True);

end;

procedure TFMdCadast.actExclExecute(Sender: TObject);
begin
  panTitulo.Caption := 'Modo de Exclusão';
  if OraDsCadast.IsEmpty then
    MessageBox(GetActiveWindow, PChar(MSG_NENHMREG), PChar(Application.Title),
      MB_ICONWARNING)
  else
    if (MessageBox(GetActiveWindow,PChar(MSG_DELETREG),PChar(Application.Title),
      MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYes)
        and (not OraDsCadast.IsEmpty) then
          TentaApagar(OraDsCadast, True);
  panTitulo.Caption := 'Modo de Consulta';
end;

procedure TFMdCadast.actCancExecute(Sender: TObject);
begin
  with OraDsCadast do begin
    Cancel;
    CancelUpdates;
  end;
  panTitulo.Caption := 'Modo de Consulta';
end;

procedure TFMdCadast.actAtuaExecute(Sender: TObject);
begin
  OraDsCadast.Refresh;
  panTitulo.Caption := 'Modo de Consulta';
end;

procedure TFMdCadast.actConsExecute(Sender: TObject);
begin
  {}
end;

procedure TFMdCadast.actFiltExecute(Sender: TObject);
begin
  {}
end;

procedure TFMdCadast.actImprExecute(Sender: TObject);
begin
  if OraDsCadast.IsEmpty then
  begin
    MessageDlg('Não existem registros a serem impressos!', mtError, [mbOk], 0);
    Abort;
  end;
  panTitulo.Caption := 'Modo de Impressão';
end;

procedure TFMdCadast.OraDsCadastAfterCancel(DataSet: TDataSet);
begin
  AtualizaAcoes(False);
end;

procedure TFMdCadast.OraDsCadastAfterDelete(DataSet: TDataSet);
begin
  AtualizaAcoes(False);
end;

procedure TFMdCadast.OraDsCadastAfterEdit(DataSet: TDataSet);
begin
  AtualizaAcoes(True);
end;

procedure TFMdCadast.OraDsCadastAfterInsert(DataSet: TDataSet);
begin
  AtualizaAcoes(True);
end;

procedure TFMdCadast.OraDsCadastAfterOpen(DataSet: TDataSet);
begin
  AtualizaAcoes(False);
end;

procedure TFMdCadast.OraDsCadastAfterPost(DataSet: TDataSet);
begin
  AtualizaAcoes(False);
end;

procedure TFMdCadast.ActSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TFMdCadast.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tbSetCapsLock(false);
  Action := caFree;
end;

procedure TFMdCadast.FormDestroy(Sender: TObject);
begin
  FreeAndNil(Filtros);
  FreeAndNil(FCadStSQL);
  grdCadastroTbv.StoreToIniFile(RDmConBas.CamPro + 'Objetos.ini', False);
end;

procedure TFMdCadast.srcCadastroDataChange(Sender: TObject; Field: TField);
begin
    if(OraDsCadast.State = dsEdit)then
    begin
         panTitulo.Caption := 'Modo de Edição';
    end else
    if(OraDsCadast.State = dsInsert)then
    begin
         panTitulo.Caption := 'Modo de Inserção';
    end else
    if(OraDsCadast.State = dsBrowse)then
    begin
         panTitulo.Caption := 'Modo de Consulta';
    end;
end;

procedure TFMdCadast.FormShow(Sender: TObject);
begin
   {tbnAdic.Caption := '';
   tbnEdit.Caption := '';
   tbnExcl.Caption := '';
   tbnGrav.Caption := '';
   tbnCanc.Caption := '';
   tbnAtua.Caption := '';
   tbnFilt.Caption := '';
   tbnImpr.Caption := '';}
end;

end.

