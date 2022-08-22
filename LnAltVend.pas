unit LnAltVend;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Data.Win.ADODB;

type
  TFLnAltVend = class(TForm)
    Panel1: TPanel;
    SpeedButton4: TSpeedButton;
    panMsg: TPanel;
    panTitulo: TPanel;
    panCampo: TPanel;
    PlnBotao: TPanel;
    srcLancam: TDataSource;
    ADOQueryVend: TADOQuery;
    ADOQueryVendCD_EST: TIntegerField;
    ADOQueryVendCH_PRODUT: TWideStringField;
    ADOQueryVendNR_QTD: TIntegerField;
    ADOQueryVendVL_DESCONT: TFloatField;
    ADOQueryVendDT_VEND: TDateTimeField;
    ADOQueryVendVL_VEND: TFloatField;
    ADOQueryVendDS_PRODUT: TWideStringField;
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
    ADOQueryProdut: TADOQuery;
    ADOQueryProdutDS_PRODUT: TWideStringField;
    ADOQueryClient: TADOQuery;
    ADOQueryClientCD_CLIENT: TAutoIncField;
    ADOQueryClientDS_CLIENT: TWideStringField;
    ADOQueryClientCH_ATIVO: TWideStringField;
    srcClient: TDataSource;
    ADOQueryPag: TADOQuery;
    ADOQueryPagCD_PAG: TIntegerField;
    ADOQueryPagDS_PAG: TWideStringField;
    ADOQueryPagNR_PARC: TIntegerField;
    ADOQueryPagCH_ATIVO: TWideStringField;
    ADOQueryPagVL_TAXA: TFloatField;
    ADOQueryPagDS_FORMPAG: TWideStringField;
    GridVenda: TDBGrid;
    Label3: TLabel;
    EdtClient: TEdit;
    EditDescPag: TEdit;
    EditPagamento: TEdit;
    EditTaxa: TEdit;
    EditParcelas: TEdit;
    Label1: TLabel;
    ADOQueryVendVL_VENDTOTAL: TFloatField;
    ADOQueryVendCD_VEND: TIntegerField;
    ADOQueryVendNR_ITEM: TAutoIncField;
    QueryPesquisaVendPrin: TADOQuery;
    QueryPesquisaVendPrinCD_VEND: TAutoIncField;
    QueryPesquisaVendPrinCD_CLIENT: TIntegerField;
    QueryPesquisaVendPrinCD_PAG: TIntegerField;
    QueryPesquisaVendPrinVL_VENDA: TFloatField;
    QueryPesquisaVendPrinDT_CADAST: TDateTimeField;
    QueryPesquisaVendPrinVL_PARCELAS: TFloatField;
    EditClient: TEdit;
    EditPag: TEdit;
    ADOQueryUpdateEst: TADOQuery;
    WideStringField1: TWideStringField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    WideStringField2: TWideStringField;
    IntegerField4: TIntegerField;
    ADOQueryVendCalc: TADOQuery;
    ADOQueryVendCalcCD_VEND: TIntegerField;
    ADOQueryVendCalcNR_ITEM: TAutoIncField;
    ADOQueryVendCalcCD_EST: TIntegerField;
    ADOQueryVendCalcCH_PRODUT: TWideStringField;
    ADOQueryVendCalcNR_QTD: TIntegerField;
    ADOQueryVendCalcVL_VEND: TFloatField;
    ADOQueryVendCalcVL_VENDTOTAL: TFloatField;
    ADOQueryVendCalcDT_VEND: TDateTimeField;
    ADOQueryVendCalcVL_DESCONT: TFloatField;
    ADOQueryVendCalcDS_PRODUT: TWideStringField;
    ADOQueryUpdatePrin: TADOQuery;
    procedure SpeedButton4Click(Sender: TObject);
    procedure GridVendaEnter(Sender: TObject);
    procedure GridVendaColExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ADOQueryVendNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    Var sParam : String;
  end;

var
  FLnAltVend: TFLnAltVend;

implementation

{$R *.dfm}

uses RDmComBas, LnVend;

procedure TFLnAltVend.ADOQueryVendNewRecord(DataSet: TDataSet);
begin

  EditClient.Text := QueryPesquisaVendPrinCD_CLIENT.Text;
  EdtClient.Text := ADOQueryClientDS_CLIENT.Text;

  EditPag.Text := QueryPesquisaVendPrinCD_PAG.Text;
  EditDescPag.Text := ADOQueryPagDS_PAG.Text;
  EditPagamento.Text := ADOQueryPagDS_FORMPAG.Value;
  EditTaxa.Text := ADOQueryPagVL_TAXA.Text;
  EditParcelas.Text := ADOQueryPagNR_PARC.Text;

  ADOQueryVendDT_VEND.Value := Date;
end;

procedure TFLnAltVend.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FLnVend.BtnFiltrar.OnClick(Sender);
  FLnAltVend := nil;
end;

procedure TFLnAltVend.GridVendaColExit(Sender: TObject);
var nEstoque, nResultado, nQtd, nQtdEst : Integer;
    nResul, nDesc : Double;
begin
  if (GridVenda.SelectedIndex = 0) then begin
    ADOQueryEst.Close;
    ADOQueryEst.Parameters.ParamByName('PR_EST').Value := ADOQueryVendCD_EST.Text;
    ADOQueryEst.Parameters.ParamByName('PR_PROD').Value := 'T';
    ADOQueryEst.Parameters.ParamByName('PR_PROD2').Value := 'T';
    ADOQueryEst.Open;

    if (ADOQueryEstCD_EST.Text = NullAsStringValue) then begin
      ShowMessage('Informe um estoque existente!');
      ADOQueryVendCD_EST.FocusControl;
      Abort;
    end;
  end;

  if (GridVenda.SelectedIndex = 1) then begin
    ADOQueryEst.Close;
    ADOQueryEst.Parameters.ParamByName('PR_EST').Value := ADOQueryVendCD_EST.Text;
    ADOQueryEst.Parameters.ParamByName('PR_PROD').Value := ADOQueryVendCH_PRODUT.Text;
    ADOQueryEst.Parameters.ParamByName('PR_PROD2').Value := ADOQueryVendCH_PRODUT.Text;
    ADOQueryEst.Open;

    if (ADOQueryEstCH_PRODUT.Text = NullAsStringValue) then begin
      ShowMessage('Informe um produto do estoque correspodente!');
      ADOQueryVendCH_PRODUT.FocusControl;
      Abort;
    end;

    nEstoque := ADOQueryEstVL_QTD.Value - ADOQueryEstVl_QTDVEND.Value;

    if (nEstoque = 0)then begin
      ShowMessage('Produto possui estoque zerado!');
      ADOQueryVendCH_PRODUT.FocusControl;
      Abort;
    end;

    ADOQueryVendDS_PRODUT.Text := ADOQueryEstDS_PRODUT.Text;
    ADOQueryVendVL_VEND.Value := ADOQueryEstVL_PREVEND.Value;

  end;

  if (GridVenda.SelectedIndex = 4) then begin
    nQtd := ADOQueryVendNR_QTD.Value - ADOQueryVendCalcNR_QTD.Value;
    //Subtrai a quantidade colocada agora pela de antes, ai entra uma lógica, pois se a quantidade de agora for menor
    //sera um número negativo, se maior positivo
    nQtdEst := ADOQueryEstVL_QTDVEND.Value + nQtd;
    //nisso aqui nessa linha ele pega e soma esse resultado, se negativo ele vai somar -x, se positivo vai somar +x

    nResultado := ADOQueryEstVL_QTD.Value - nQtdEst;
    //Subtrai a qtd do estoque pela qtd vendida e a qtd dita pelo usuário
    //para ver se possui a quantidade colocada em estoque

    if (nResultado < 0) then begin
      nEstoque := ADOQueryEstVL_QTD.Value - ADOQueryEstVl_QTDVEND.Value;
      ShowMessage('Estoque insuficiente para essa quantidade! Quantidade em estoque: ' + IntToStr(nEstoque));
      ADOQueryVendNR_QTD.FocusControl;
      Abort;
    end;

  end;

  if (GridVenda.SelectedIndex = 5) then begin
    nResul := (ADOQueryVendNR_QTD.Value * ADOQueryVendVL_VEND.Value);
    //Multiplica a quantidade e o valor de venda (que vem já do estoque)
    nDesc := nResul - ((nResul * ADOQueryVendVL_DESCONT.Value) / 100);
    //Adiciona o desconto sobre o valor total da venda, fazendo que o valor total da venda seja o valor de desconto (abaixo)
    ADOQueryVendVL_VENDTOTAL.Value := nDesc;
  end;
end;

procedure TFLnAltVend.GridVendaEnter(Sender: TObject);
begin
  ADOQueryVend.Close;
  ADOQueryVend.Parameters.ParamByName('PR_VEND').Value := sParam;
  ADOQueryVend.Open;

  ADOQueryVendCalc.Close;
  ADOQueryVendCalc.Parameters.ParamByName('PR_VEND').Value := sParam;
  ADOQueryVendCalc.Open;

  QueryPesquisaVendPrin.Close;
  QueryPesquisaVendPrin.Parameters.ParamByName('PR_VEND').Value := sParam;
  QueryPesquisaVendPrin.Open;

  EditClient.Text := QueryPesquisaVendPrinCD_CLIENT.Text;
  EditPag.Text := QueryPesquisaVendPrinCD_PAG.Text;

  ADOQueryClient.Close;
  ADOQueryClient.Parameters.ParamByName('PR_CLIENT').Value := EditClient.Text;
  ADOQueryClient.Open;

  EdtClient.Text := ADOQueryClientDS_CLIENT.Text;

  ADOQueryPag.Close;
  ADOQueryPag.Parameters.ParamByName('PR_PAG').Value := EditPag.Text;
  ADOQueryPag.Open;

  EditDescPag.Text := ADOQueryPagDS_PAG.Text;
  EditPagamento.Text := ADOQueryPagDS_FORMPAG.Value;

  EditTaxa.Text := ADOQueryPagVL_TAXA.Text;
  EditParcelas.Text := ADOQueryPagNR_PARC.Text;
end;

procedure TFLnAltVend.SpeedButton4Click(Sender: TObject);
var nSomaDosItens, nParcelas, nEstoque, nQtd, nQtdEst, nNumParc: Double;
begin
  nSomaDosItens := 0;
  ADOQueryVend.First;
  while not(ADOQueryVend.Eof) do begin
    nSomaDosItens := nSomaDosItens + ADOQueryVendVL_VENDTOTAL.Value;
    //Faz a soma dos valores totais dos itens

    nQtd := ADOQueryVendNR_QTD.Value - ADOQueryVendCalcNR_QTD.Value;
    nQtdEst := ADOQueryEstVL_QTDVEND.Value + nQtd;

    ADOQueryUpdateEst.Parameters.ParamByName('pr_qtd').Value := nQtdEst;
    ADOQueryUpdateEst.Parameters.ParamByName('pr_est').Value := ADOQueryVendCD_EST.Value;
    ADOQueryUpdateEst.Parameters.ParamByName('pr_produt').Value := ADOQueryVendCH_PRODUT.Value;
    ADOQueryUpdateEst.ExecSQL;

    ADOQueryVend.Next;
  end;

  if ADOQueryPagVL_TAXA.Value >= 1 then begin
    nSomaDosItens := nSomaDosItens + ((nSomaDosItens * ADOQueryPagVL_TAXA.Value)/100);
    //Soma com a taxa das parcelas
  end;

  nNumParc := 1;
  if (ADOQueryPagNR_PARC.Value >= 1) then nNumParc := ADOQueryPagNR_PARC.Value;

  nParcelas := nSomaDosItens / nNumParc;

  ADOQueryUpdatePrin.Parameters.ParamByName('pr_vend').Value := ADOQueryVendCD_VEND.Text;
  ADOQueryUpdatePrin.Parameters.ParamByName('pr_valor').Value := nSomaDosItens;
  ADOQueryUpdatePrin.Parameters.ParamByName('pr_parc').Value := nParcelas;
  ADOQueryUpdatePrin.ExecSQL;
  //Divide o valor total da venda pelo número de parcelas, para saber quanto cada parcela custa
  Close;
end;

end.
