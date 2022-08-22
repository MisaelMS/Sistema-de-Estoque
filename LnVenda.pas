unit LnVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Data.Win.ADODB;

type
  TFLnVenda = class(TForm)
    GridVenda: TDBGrid;
    Panel1: TPanel;
    SpeedButton4: TSpeedButton;
    panMsg: TPanel;
    panTitulo: TPanel;
    panCampo: TPanel;
    PlnBotao: TPanel;
    Label3: TLabel;
    DBClient: TDBEdit;
    EdtClient: TEdit;
    ADOQueryClient: TADOQuery;
    ADOQueryClientCD_CLIENT: TAutoIncField;
    ADOQueryClientDS_CLIENT: TWideStringField;
    ADOQueryClientCH_ATIVO: TWideStringField;
    ADOQueryProdut: TADOQuery;
    ADOQueryProdutDS_PRODUT: TWideStringField;
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
    srcLancam: TDataSource;
    ADOQueryVend: TADOQuery;
    ADOQueryVendCD_EST: TIntegerField;
    ADOQueryVendCH_PRODUT: TWideStringField;
    ADOQueryVendNR_QTD: TIntegerField;
    ADOQueryVendDT_VEND: TDateTimeField;
    ADOQueryVendVL_DESCONT: TFloatField;
    Label1: TLabel;
    DBEditPag: TDBEdit;
    EditDescPag: TEdit;
    EditPagamento: TEdit;
    EditTaxa: TEdit;
    EditParcelas: TEdit;
    ADOQueryPag: TADOQuery;
    ADOQueryPagCD_PAG: TIntegerField;
    ADOQueryPagDS_PAG: TWideStringField;
    ADOQueryPagNR_PARC: TIntegerField;
    ADOQueryPagCH_ATIVO: TWideStringField;
    ADOQueryPagVL_TAXA: TFloatField;
    Panel2: TPanel;
    Edit1: TEdit;
    Label2: TLabel;
    ADOQueryPagDS_FORMPAG: TWideStringField;
    ADOQueryVendVL_VEND: TFloatField;
    ADOQueryVendDS_PRODUT: TWideStringField;
    ADOQueryVendVL_VENDITEM: TFloatField;
    ADOQueryVendCD_CLIENT: TIntegerField;
    ADOQueryVendCD_PAG: TIntegerField;
    ADOQueryVendVL_VENDATOTAL: TFloatField;
    ADOQueryVendVL_PARCELAS: TFloatField;
    ADOQueryInsertVendPrin: TADOQuery;
    ADOQueryInsertVend: TADOQuery;
    QueryPesquisaVendPrin: TADOQuery;
    QueryPesquisaVendPrinExpr1000: TIntegerField;
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
    procedure GridVendaColExit(Sender: TObject);
    procedure DBEditPagExit(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure DBClientExit(Sender: TObject);
    procedure ADOQueryVendNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    var sClient, sPag : String;
  end;

var
  FLnVenda: TFLnVenda;

implementation

{$R *.dfm}

uses RDmComBas;

procedure TFLnVenda.ADOQueryVendNewRecord(DataSet: TDataSet);
begin
  ADOQueryVendDT_VEND.Value := Date;
  ADOQueryVendCD_CLIENT.Text := sClient;
  ADOQueryVendCD_PAG.Text := sPag;
end;

procedure TFLnVenda.DBClientExit(Sender: TObject);
begin
  if (DBClient.Text <> NullAsStringValue) then begin
    ADOQueryClient.Close;
    ADOQueryClient.Parameters.ParamByName('PR_CLIENT').Value := DBClient.Text;
    ADOQueryClient.Open;

    if (ADOQueryClientCD_CLIENT.Text = NullAsStringValue) then begin
      ShowMessage('Informe um cliente existente!');
      DBClient.SetFocus;
      Abort;
    end;

    EdtClient.Text := ADOQueryClientDS_CLIENT.Text;
  end;
  sClient := DBClient.Text;
end;

procedure TFLnVenda.DBEditPagExit(Sender: TObject);
begin
  if (DBEditPag.Text <> NullAsStringValue) then begin
    ADOQueryPag.Close;
    ADOQueryPag.Parameters.ParamByName('PR_PAG').Value := DBEditPag.Text;
    ADOQueryPag.Open;

    if (ADOQueryPagCD_PAG.Text = NullAsStringValue) then begin
      ShowMessage('Informe um tipo de pagamento existente!');
      DBEditPag.SetFocus;
      Abort;
    end;

    EditDescPag.Text := ADOQueryPagDS_PAG.Text;
    EditPagamento.Text := ADOQueryPagDS_FORMPAG.Value;

    EditTaxa.Text := ADOQueryPagVL_TAXA.Text;
    EditParcelas.Text := ADOQueryPagNR_PARC.Text;
  end;
  sPag := DBEditPag.Text;
end;

procedure TFLnVenda.GridVendaColExit(Sender: TObject);
var nEstoque, nResultado : Integer;
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

    nResultado := ADOQueryEstVL_QTD.Value - (ADOQueryEstVL_QTDVEND.Value + ADOQueryVendNR_QTD.Value);
    //Subtrai a qtd do estoque pela soma da qtd vendida e a qtd dita pelo usuário
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
    ADOQueryVendVL_VENDITEM.Value := nDesc;
  end;

end;

procedure TFLnVenda.SpeedButton4Click(Sender: TObject);
var nSomaDosItens, nParcelas, nEstoque, nNumParc : Double;
begin
  nSomaDosItens := 0;
  ADOQueryVend.First;
  while not(ADOQueryVend.Eof) do begin
    nSomaDosItens := nSomaDosItens + ADOQueryVendVL_VENDITEM.Value;
    //Faz a soma dos valores totais dos itens

    ADOQueryUpdateEst.Parameters.ParamByName('pr_qtd').Value := ADOQueryVendNR_QTD.Value;
    ADOQueryUpdateEst.Parameters.ParamByName('pr_est').Value := ADOQueryVendCD_EST.Value;
    ADOQueryUpdateEst.Parameters.ParamByName('pr_produt').Value := ADOQueryVendCH_PRODUT.Value;
    ADOQueryUpdateEst.ExecSQL;

    ADOQueryVend.Next;
  end;

  if ADOQueryPagVL_TAXA.Value >= 1 then begin
    nSomaDosItens := nSomaDosItens + ((nSomaDosItens * ADOQueryPagVL_TAXA.Value)/100);
    //Soma com a taxa das parcelas
  end;

  ADOQueryVend.Edit;
  ADOQueryVendVL_VENDATOTAL.Value := nSomaDosItens;
  //A coluna Venda Total do estoque principal recebe a soma total.

  nNumParc := 1;
  if (ADOQueryPagNR_PARC.Value >= 1) then nNumParc := ADOQueryPagNR_PARC.Value;

  nParcelas := nSomaDosItens / nNumParc;
  //Divide o valor total da venda pelo número de parcelas, para saber quanto cada parcela custa

  ADOQueryInsertVendPrin.Parameters.ParamByName('pr_client').Value := ADOQueryVendCD_CLIENT.Value;
  ADOQueryInsertVendPrin.Parameters.ParamByName('pr_pag').Value := ADOQueryVendCD_PAG.Value;
  ADOQueryInsertVendPrin.Parameters.ParamByName('pr_venda').Value := nSomaDosItens;
  ADOQueryInsertVendPrin.Parameters.ParamByName('pr_dtvend').Value := ADOQueryVendDT_VEND.Value;
  ADOQueryInsertVendPrin.Parameters.ParamByName('pr_parc').Value := nParcelas;
  ADOQueryInsertVendPrin.ExecSQL;

  QueryPesquisaVendPrin.Close;
  QueryPesquisaVendPrin.Open;

  ADOQueryInsertVend.Parameters.ParamByName('PR_VEND').Value := QueryPesquisaVendPrinExpr1000.Text;
  ADOQueryInsertVend.ExecSQL;

  Close;
end;

end.
