unit DpMenPro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, System.Actions,
  Vcl.ActnList, Vcl.Menus, System.ImageList, Vcl.ImgList;

type
  TFDpMenPro = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    ImagemBotoes: TImageList;
    Menu: TMainMenu;
    ActList: TActionList;
    ActCdProd: TAction;
    CadastroProdutos1: TMenuItem;
    CadastroProdutos2: TMenuItem;
    Cliente1: TMenuItem;
    Cliente2: TMenuItem;
    ActCdClient: TAction;
    ActLnProdut: TAction;
    ActCdFornec: TAction;
    LanamentodeProduto2: TMenuItem;
    Consulta1: TMenuItem;
    CadastroFornecedor1: TMenuItem;
    ActCnEst: TAction;
    ActCnVend: TAction;
    ConsultaEstoque1: TMenuItem;
    ConsultaVenda1: TMenuItem;
    ActCdTipPag: TAction;
    ipoPagamento1: TMenuItem;
    ActLnVend: TAction;
    ConsultaVenda2: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActCdProdExecute(Sender: TObject);
    procedure ActCdClientExecute(Sender: TObject);
    procedure ActLnProdutExecute(Sender: TObject);
    procedure ActCdFornecExecute(Sender: TObject);
    procedure ActCnEstExecute(Sender: TObject);
    procedure ActCnVendExecute(Sender: TObject);
    procedure ActCdTipPagExecute(Sender: TObject);
    procedure ActLnVendExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDpMenPro: TFDpMenPro;

implementation

{$R *.dfm}

uses CdProdut, CdClient, LnProdut, CdFornec, CnEst, CnVend, CdTipPag, LnEst, LnVend;

procedure TFDpMenPro.ActCdClientExecute(Sender: TObject);
begin
  try
    Application.CreateForm(TFCdClient, FCdClient);
    TForm(FCdClient).ShowModal;
  except
    ShowMessage('Falha na Chamada da Tela' + TForm(FCdClient).Caption);
  end;
end;

procedure TFDpMenPro.ActCdFornecExecute(Sender: TObject);
begin
  try
    Application.CreateForm(TFCdFornec, FCdFornec);
    TForm(FCdFornec).ShowModal;
  except
    ShowMessage('Falha na Chamada da Tela' + TForm(FCdFornec).Caption);
  end;
end;

procedure TFDpMenPro.ActCdProdExecute(Sender: TObject);
begin
  try
    Application.CreateForm(TFCdProdut, FCdProdut);
    TForm(FCdProdut).ShowModal;
  except
    ShowMessage('Falha na Chamada da Tela' + TForm(FCdProdut).Caption);
  end;
end;

procedure TFDpMenPro.ActCdTipPagExecute(Sender: TObject);
begin
  try
    Application.CreateForm(TFCdTipPag, FCdTipPag);
    TForm(FCdTipPag).ShowModal;
  except
    ShowMessage('Falha na Chamada da Tela' + TForm(FCdTipPag).Caption);
  end;
end;

procedure TFDpMenPro.ActCnEstExecute(Sender: TObject);
begin
  try
    Application.CreateForm(TFCnEst, FCnEst);
    TForm(FCnEst).ShowModal;
  except
    ShowMessage('Falha na Chamada da Tela' + TForm(FCnEst).Caption);
  end;
end;

procedure TFDpMenPro.ActCnVendExecute(Sender: TObject);
begin
  try
    Application.CreateForm(TFCnVend, FCnVend);
    TForm(FCnVend).ShowModal;
  except
    ShowMessage('Falha na Chamada da Tela' + TForm(FCnVend).Caption);
  end;
end;

procedure TFDpMenPro.ActLnProdutExecute(Sender: TObject);
begin
  try
    Application.CreateForm(TFLnEst, FLnEst);
    TForm(FLnEst).ShowModal;
  except
    ShowMessage('Falha na Chamada da Tela' + TForm(FLnEst).Caption);
  end;
end;

procedure TFDpMenPro.ActLnVendExecute(Sender: TObject);
begin
  try
    Application.CreateForm(TFLnVend, FLnVend);
    TForm(FLnVend).ShowModal;
  except
    ShowMessage('Falha na Chamada da Tela' + TForm(FLnVend).Caption);
  end;
end;

procedure TFDpMenPro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FDpMenPro := nil;
end;

end.
