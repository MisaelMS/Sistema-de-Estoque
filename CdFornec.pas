unit CdFornec;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.Mask, Vcl.ExtCtrls, Vcl.DBCtrls, System.ImageList, Vcl.ImgList, Vcl.Grids,
  Vcl.DBGrids, Data.Win.ADODB;

type
  TFCdFornec = class(TForm)
    GridFornec: TDBGrid;
    ImageList1: TImageList;
    panCadastro: TPanel;
    Label1: TLabel;
    DBCheckBox1: TDBCheckBox;
    DBCod: TDBEdit;
    DBEdit1: TDBEdit;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    panMsg: TPanel;
    panTitulo: TPanel;
    panCampo: TPanel;
    ADQueryFornec: TADOQuery;
    srcFornec: TDataSource;
    ADQueryFornecExpr1000: TIntegerField;
    ADTabFornec: TADOTable;
    ADTabFornecCD_FORNEC: TIntegerField;
    ADTabFornecDS_FORNEC: TWideStringField;
    ADTabFornecCH_ATIVO: TWideStringField;
    Splitter: TSplitter;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCdFornec: TFCdFornec;

implementation

{$R *.dfm}

Uses RDmComBas;

procedure TFCdFornec.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FCdFornec := nil;
end;

procedure TFCdFornec.FormShow(Sender: TObject);
begin
  ADTabFornec.Open;
end;

procedure TFCdFornec.SpeedButton1Click(Sender: TObject);
begin
  ADTabFornec.Append;
  ADTabFornecCH_ATIVO.Value := 'S';
end;

procedure TFCdFornec.SpeedButton2Click(Sender: TObject);
begin
  ADTabFornec.Edit;
end;

procedure TFCdFornec.SpeedButton3Click(Sender: TObject);
begin
  ADTabFornec.Delete;
end;

procedure TFCdFornec.SpeedButton4Click(Sender: TObject);
begin
  ADTabFornec.Post;

end;

end.
