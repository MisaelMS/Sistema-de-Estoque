unit CdTipPag;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Mask, Data.Win.ADODB;

type
  TFCdTipPag = class(TForm)
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    panTitulo: TPanel;
    panCampo: TPanel;
    Splitter: TSplitter;
    panCadastro: TPanel;
    DBCheckBox1: TDBCheckBox;
    GridProdutos: TDBGrid;
    panMsg: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    DBPag: TDBComboBox;
    Label4: TLabel;
    DBDescPag: TDBEdit;
    ADOQueryPag: TADOQuery;
    srcPag: TDataSource;
    ADOQueryPagCD_PAG: TIntegerField;
    ADOQueryPagDS_PAG: TWideStringField;
    ADOQueryPagNR_PARC: TIntegerField;
    ADOQueryPagCH_ATIVO: TWideStringField;
    CBParcelas: TDBComboBox;
    DBJuros: TDBEdit;
    Label5: TLabel;
    ADOQueryPagVL_TAXA: TFloatField;
    ADOQueryPagDS_FORMPAG: TWideStringField;
    procedure DBPagChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCdTipPag: TFCdTipPag;

implementation

{$R *.dfm}

Uses RDmComBas;

procedure TFCdTipPag.DBPagChange(Sender: TObject);
begin
  DBJuros.Enabled := False;
  if (DBPag.ItemIndex >= 3) then begin
    CBParcelas.Enabled := True;
  end else begin
    CBParcelas.Enabled := False;
  end;
  if (DBPag.ItemIndex >= 2) then DBJuros.Enabled := True;
end;

procedure TFCdTipPag.SpeedButton1Click(Sender: TObject);
begin
  ADOQueryPag.Append;
  ADOQueryPagCH_ATIVO.Value := 'S';
end;

procedure TFCdTipPag.SpeedButton3Click(Sender: TObject);
begin
  ADOQueryPag.Delete;
end;

procedure TFCdTipPag.SpeedButton4Click(Sender: TObject);
begin
  if not(DBJuros.Enabled) then ADOQueryPagVL_TAXA.Value := 0;
  ADOQueryPag.Post;
end;

end.
