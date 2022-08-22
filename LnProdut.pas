unit LnProdut;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.Buttons,
  Data.Win.ADODB, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TFLnProdut = class(TForm)
    panMsg: TPanel;
    panTitulo: TPanel;
    panCampo: TPanel;
    PlnBotao: TPanel;
    srcLancam: TDataSource;
    Panel1: TPanel;
    SpeedButton4: TSpeedButton;
    ADOQueryEst: TADOQuery;
    Label3: TLabel;
    DBFornec: TDBEdit;
    GridProdutos: TDBGrid;
    ADOQueryEstCH_PRODUT: TWideStringField;
    ADOQueryEstVL_QTD: TIntegerField;
    ADOQueryEstVl_QTDVEND: TIntegerField;
    EdtFornec: TEdit;
    srcFornec: TDataSource;
    ADOQueryFornec: TADOQuery;
    ADOQueryFornecCD_FORNEC: TIntegerField;
    ADOQueryFornecDS_FORNEC: TWideStringField;
    ADOQueryEstVL_TRANS: TFloatField;
    ADOQueryProdut: TADOQuery;
    ADOQueryProdutDS_PRODUT: TWideStringField;
    ADOQueryEstVL_PERCPREC: TFloatField;
    ADOQueryEstVL_PRECOM: TFloatField;
    ADOQueryEstVL_PREVEND: TFloatField;
    ADOQueryEstVL_TOTAL: TFloatField;
    ADOQueryEstDT_ENTRADA: TDateTimeField;
    ADOQueryEstDT_SAIDA: TDateTimeField;
    ADOQueryEstDS_PRODUT: TWideStringField;
    ADOQueryEstCD_FORNEC: TIntegerField;
    QueryPesquisaEsPrin: TADOQuery;
    QueryPesquisaEsPrinExpr1000: TIntegerField;
    ADOQueryPrin: TADOQuery;
    Panel2: TPanel;
    ADOQueryEstNR_SEQUEN: TAutoIncField;
    ADOQueryEstCD_CLIENT: TIntegerField;
    ADOQueryEstVL_TOTALEST: TFloatField;
    ADOQueryEstInsert: TADOQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBFornecKeyPress(Sender: TObject; var Key: Char);
    procedure DBFornecExit(Sender: TObject);
    procedure GridProdutosColExit(Sender: TObject);
    procedure ADOQueryEstNewRecord(DataSet: TDataSet);
    procedure ADOQueryEstBeforePost(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure DBFornecEnter(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    Var nNomeFornec : Integer;
    { Public declarations }
  end;

var
  FLnProdut: TFLnProdut;

implementation

{$R *.dfm}

uses RDmComBas, LnEst;

procedure TFLnProdut.ADOQueryEstBeforePost(DataSet: TDataSet);
begin
  ADOQueryEstCD_FORNEC.Value := nNomeFornec;
  ADOQueryEstCH_PRODUT.Value;
  ADOQueryEstDS_PRODUT.Value;
end;

procedure TFLnProdut.ADOQueryEstNewRecord(DataSet: TDataSet);
begin
  ADOQueryEstDT_ENTRADA.Text := DateToStr(Date);
end;

procedure TFLnProdut.DBFornecEnter(Sender: TObject);
begin
  if (ADOQueryEst.IsEmpty) then begin
    ADOQueryEst.Close;
    ADOQueryEst.Open;
    ADOQueryEst.Append;
  end;
end;

procedure TFLnProdut.DBFornecExit(Sender: TObject);
begin
  ADOQueryFornec.Close;
  ADOQueryFornec.Parameters.ParamByName('PR_FORNEC').Value := DBFornec.Text;
  ADOQueryFornec.Open;
  //ADOQueryFornec.Locate('PR_FORNEC',DBFornec.Text,[loPartialKey]);

  if (ADOQueryFornecCD_FORNEC.Text = NullAsStringValue) then begin
    ShowMessage('Informe um fornecedor existente!');
    DBFornec.SetFocus;
    Abort;
  end;
  EdtFornec.Text := ADOQueryFornecDS_FORNEC.Text;
  ADOQueryEst.Open;
  ADOQueryEst.Edit;
  nNomeFornec := StrToInt(DBFornec.Text);
end;

procedure TFLnProdut.DBFornecKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in['0' .. '9',chr(8)]) then Key := #0;
end;

procedure TFLnProdut.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FLnEst.BtnFiltrar.OnClick(Sender);
  FLnProdut := nil;
end;

procedure TFLnProdut.FormShow(Sender: TObject);
begin
  DBFornec.SetFocus;
end;

procedure TFLnProdut.GridProdutosColExit(Sender: TObject);
begin

  if (GridProdutos.SelectedIndex = 0) then begin
    ADOQueryProdut.Close;
    ADOQueryProdut.Parameters.ParamByName('PR_PRODUT').Value := ADOQueryEstCH_PRODUT.Text;
    ADOQueryProdut.Open;

    if (ADOQueryProdutDS_PRODUT.Text = NullAsStringValue) then begin
      ShowMessage('Informe um produto existente!');
      ADOQueryEstCH_PRODUT.FocusControl;
      Abort;
    end;
    ADOQueryEst.Edit;
    ADOQueryEstDS_PRODUT.Text := ADOQueryProdutDS_PRODUT.Text;
  end;

  if (GridProdutos.SelectedIndex = 4) then begin
    ADOQueryEstVL_PREVEND.Value := ADOQueryEstVL_PRECOM.Value + ((ADOQueryEstVL_PRECOM.Value * ADOQueryEstVL_PERCPREC.Value) / 100);
    //O valor da venda do produto é igual a percentagem de lucro que o usuário quer
  end;
  if (GridProdutos.SelectedIndex = 6) then begin
    ADOQueryEstVL_TOTAL.Value := (ADOQueryEstVL_PREVEND.Value * ADOQueryEstVL_QTD.Value) + ADOQueryEstVL_TRANS.Value;
    //O valor total é a multiplicação do valor do produto segundo o lucro que o usuário quer, pela quantidade de produto somada
    //com o valor do transporte
    if (ADOQueryEst.State = dsEdit) then ADOQueryEst.Post;
  end;
end;

procedure TFLnProdut.SpeedButton4Click(Sender: TObject);
var nSomaDosItens : Double;
begin
  nSomaDosItens := 0;
  ADOQueryEst.First;
  while not(ADOQueryEst.Eof) do begin
    nSomaDosItens := nSomaDosItens + ADOQueryEstVL_TOTAL.Value;
    ADOQueryEst.Next;
  end;
  ADOQueryEst.Edit;
  ADOQueryEstVL_TOTALEST.Value := nSomaDosItens;

  ADOQueryPrin.Parameters.ParamByName('pr_totalest').Value := nSomaDosItens;
  ADOQueryPrin.Parameters.ParamByName('pr_fornec').Value := ADOQueryEstCD_FORNEC.Value;
  ADOQueryPrin.Parameters.ParamByName('pr_entrada').Value := ADOQueryEstDT_ENTRADA.Value;
  ADOQueryPrin.ExecSQL;

  QueryPesquisaEsPrin.Close;
  QueryPesquisaEsPrin.Open;

  ADOQueryEstInsert.Parameters.ParamByName('PR_EST').Value := QueryPesquisaEsPrinExpr1000.Text;
  ADOQueryEstInsert.ExecSQL;

  Close;
end;

end.

