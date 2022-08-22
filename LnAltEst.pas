unit LnAltEst;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Buttons;

type
  TFLnAltEst = class(TForm)
    Panel1: TPanel;
    SpeedButton4: TSpeedButton;
    panTitulo: TPanel;
    panCampo: TPanel;
    PlnBotao: TPanel;
    panMsg: TPanel;
    ADTabEst: TADOTable;
    ADTabEstCH_PRODUT: TWideStringField;
    ADTabEstVL_QTD: TIntegerField;
    ADTabEstVl_QTDVEND: TIntegerField;
    ADTabEstDT_ENTRADA: TDateTimeField;
    ADTabEstDT_SAIDA: TDateTimeField;
    ADTabEstCD_FORNEC: TIntegerField;
    ADTabEstCD_CLIENT: TIntegerField;
    ADTabEstCD_EST: TIntegerField;
    ADTabEstVL_PRECOM: TFloatField;
    ADTabEstVL_PREVEND: TFloatField;
    ADTabEstVL_TRANS: TFloatField;
    ADTabEstVL_PERCPREC: TFloatField;
    ADTabEstVL_TOTAL: TFloatField;
    srcLancam: TDataSource;
    ADOQueryEst: TADOQuery;
    ADOQueryEstCH_PRODUT: TWideStringField;
    ADOQueryEstVL_QTD: TIntegerField;
    ADOQueryEstVl_QTDVEND: TIntegerField;
    ADOQueryEstCD_EST: TIntegerField;
    ADOQueryEstVL_TRANS: TFloatField;
    ADOQueryEstVL_PERCPREC: TFloatField;
    ADOQueryEstVL_PRECOM: TFloatField;
    ADOQueryEstVL_PREVEND: TFloatField;
    ADOQueryEstVL_TOTAL: TFloatField;
    ADOQueryEstDT_ENTRADA: TDateTimeField;
    ADOQueryEstDT_SAIDA: TDateTimeField;
    ADOQueryEstDS_PRODUT: TWideStringField;
    ADOQueryEstCD_FORNEC: TIntegerField;
    ADOQueryFornec: TADOQuery;
    ADOQueryFornecCD_FORNEC: TIntegerField;
    ADOQueryFornecDS_FORNEC: TWideStringField;
    srcFornec: TDataSource;
    ADOQueryProdut: TADOQuery;
    ADOQueryProdutDS_PRODUT: TWideStringField;
    Label3: TLabel;
    DBFornec: TDBEdit;
    EdtFornec: TEdit;
    GridProdutos: TDBGrid;
    ADOQueryUpdatePrin: TADOQuery;
    procedure GridProdutosEnter(Sender: TObject);
    procedure GridProdutosColExit(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ADOQueryEstNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    var sParam : string;
  end;

var
  FLnAltEst: TFLnAltEst;

implementation

{$R *.dfm}

uses LnEst;

procedure TFLnAltEst.ADOQueryEstNewRecord(DataSet: TDataSet);
begin
  ADOQueryEstDT_ENTRADA.Value := Date;
end;

procedure TFLnAltEst.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FLnEst.BtnFiltrar.OnClick(Sender);
  FLnAltest := nil;
end;

procedure TFLnAltEst.GridProdutosColExit(Sender: TObject);
var nSoma : Double;
begin
  ADOQueryEst.Edit;
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
  end;
end;

procedure TFLnAltEst.GridProdutosEnter(Sender: TObject);
begin

  ADOQueryEst.Close;
  ADOQueryEst.Parameters.ParamByName('PR_EST').Value := sParam;
  ADOQueryEst.Open;

  ADOQueryFornec.Close;
  ADOQueryFornec.Parameters.ParamByName('PR_FORNEC').Value := ADOQueryEstCD_FORNEC.Text;
  ADOQueryFornec.Open;
  EdtFornec.Text := ADOQueryFornecDS_FORNEC.Text;

end;

procedure TFLnAltEst.SpeedButton4Click(Sender: TObject);
var nSomaDosItens : Double;
begin
  if (ADOQueryEst.State = dsEdit) then begin
    ADOQueryEst.Post;
  end;

  nSomaDosItens := 0;
  ADOQueryEst.First;
  while not(ADOQueryEst.Eof) do begin
    nSomaDosItens := nSomaDosItens + ADOQueryEstVL_TOTAL.Value;
    ADOQueryEst.Next;
  end;
  ADOQueryUpdatePrin.Parameters.ParamByName('PR_VALOR').Value := nSomaDosItens;
  ADOQueryUpdatePrin.Parameters.ParamByName('PR_EST').Value := ADOQueryEstCD_EST.Text;
  ADOQueryUpdatePrin.ExecSQL;
  Close;
end;

end.
