unit CdClient;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, System.ImageList, Vcl.ImgList, Vcl.Grids,
  Vcl.DBGrids, Data.Win.ADODB, StrUtils;

type
  TFCdClient = class(TForm)
    GridProdutos: TDBGrid;
    ImageList1: TImageList;
    panCadastro: TPanel;
    DBCheckBox1: TDBCheckBox;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    panMsg: TPanel;
    panTitulo: TPanel;
    panCampo: TPanel;
    Splitter: TSplitter;
    ADTabClient: TADOTable;
    srcCadastro: TDataSource;
    ADTabClientCD_CLIENT: TIntegerField;
    ADTabClientCH_ATIVO: TWideStringField;
    DBCod: TDBEdit;
    ADTabClientDS_CLIENT: TWideStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCdClient: TFCdClient;

implementation

{$R *.dfm}

procedure TFCdClient.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FCdClient := nil;
end;

procedure TFCdClient.SpeedButton1Click(Sender: TObject);
begin
  ADTabClient.Append;
  ADTabClientCH_ATIVO.Value := 'S';
end;

procedure TFCdClient.SpeedButton2Click(Sender: TObject);
begin
  ADTabClient.Edit;
end;

procedure TFCdClient.SpeedButton3Click(Sender: TObject);
begin
  ADTabClient.Delete;
end;

procedure TFCdClient.SpeedButton4Click(Sender: TObject);
begin
  ADTabClient.Post;
end;

end.
