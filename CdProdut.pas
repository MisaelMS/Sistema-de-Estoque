unit CdProdut;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, System.Actions,
  Vcl.ActnList, Datasnap.DBClient, Data.Win.ADODB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, System.ImageList, StrUtils,
  Vcl.ImgList;

type
  TFCdProdut = class(TForm)
    panCadastro: TPanel;
    panMsg: TPanel;
    panTitulo: TPanel;
    panCampo: TPanel;
    Splitter: TSplitter;
    srcCadastro: TDataSource;
    ADTabProdut: TADOTable;
    ADTabProdutDS_PRODUT: TWideStringField;
    ADTabProdutCH_ATIVO: TWideStringField;
    Label1: TLabel;
    Label2: TLabel;
    DbDesc: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    GridProdutos: TDBGrid;
    ImageList1: TImageList;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    DBEdProdut: TDBEdit;
    ADTabProdutCH_PRODUT: TWideStringField;
    SpeedButton4: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DbPrecoKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ADTabProdutBeforePost(DataSet: TDataSet);
    procedure Controle;
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCdProdut: TFCdProdut;

implementation

{$R *.dfm}

Uses RDmComBas;

procedure TFCdProdut.Controle;
begin
  if (DBEdProdut.Text = NullAsStringValue) then
  begin
    messagedlg('Informe o código do produto!', mtInformation, [mbok], 0);
    DBEdProdut.SetFocus;
    Abort;
  end;
  if (DbDesc.Text = NullAsStringValue) then
  begin
    messagedlg('Informe a descrição do produto!', mtInformation, [mbok], 0);
    DBDesc.SetFocus;
    Abort;
  end;
end;

procedure TFCdProdut.ADTabProdutBeforePost(DataSet: TDataSet);
begin
  Controle;
end;

procedure TFCdProdut.DbPrecoKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', chr(8), ',']) then
    Key := #0;
end;

procedure TFCdProdut.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FCdProdut := nil;
end;

procedure TFCdProdut.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', chr(8), chr(190)]) then
    Key := #0;
end;

procedure TFCdProdut.FormShow(Sender: TObject);
begin
  ADTabProdut.Open;
end;

procedure TFCdProdut.SpeedButton1Click(Sender: TObject);
begin
  ADTabProdut.Append;
  ADTabProdutCH_ATIVO.Value := 'S';
end;

procedure TFCdProdut.SpeedButton2Click(Sender: TObject);
begin
  ADTabProdut.Edit;
end;

procedure TFCdProdut.SpeedButton3Click(Sender: TObject);
begin
  ADTabProdut.Delete;
end;

procedure TFCdProdut.SpeedButton4Click(Sender: TObject);
begin
  ADTabProdut.Post;
end;

end.
