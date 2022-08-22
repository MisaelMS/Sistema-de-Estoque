unit LnVend;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls, System.ImageList,
  Vcl.ImgList, Data.Win.ADODB;

type
  TFLnVend = class(TForm)
    Image1: TImage;
    ImagemBotoes: TImageList;
    Panel1: TPanel;
    BtnFiltrar: TSpeedButton;
    Panel2: TPanel;
    GridProdutos: TDBGrid;
    Panel3: TPanel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    panMsg: TPanel;
    panTitulo: TPanel;
    panCampo: TPanel;
    PlnBotao: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    CbClient: TCheckBox;
    EditClient: TEdit;
    EdtFornec: TEdit;
    ComboBox1: TComboBox;
    EditVend: TEdit;
    CBVend: TCheckBox;
    ChkData: TCheckBox;
    EditDataIni: TDateTimePicker;
    EditDataFin: TDateTimePicker;
    ADOQueryClient: TADOQuery;
    srcLancam: TDataSource;
    ADOQueryVend: TADOQuery;
    ADOQueryDelete: TADOQuery;
    ADOQueryClientCD_CLIENT: TIntegerField;
    ADOQueryClientDS_CLIENT: TWideStringField;
    ADOQueryVendCD_VEND: TAutoIncField;
    ADOQueryVendDT_CADAST: TDateTimeField;
    ADOQueryVendVL_VENDA: TFloatField;
    ADOQueryDelete2: TADOQuery;
    ADOQueryTemp: TADOQuery;
    ADOQueryVendVL_PARCELAS: TFloatField;
    ADOQueryVendNR_PARC: TIntegerField;
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BtnFiltrarClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure CbClientClick(Sender: TObject);
    procedure CBVendClick(Sender: TObject);
    procedure ChkDataClick(Sender: TObject);
    procedure EditClientExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLnVend: TFLnVend;

implementation

{$R *.dfm}

uses RDmComBas, LnAltVend, LnVenda;

procedure TFLnVend.CbClientClick(Sender: TObject);
begin
  if (CbClient.Checked) then begin
    EditClient.Enabled := False;
  end else begin
    EditClient.Enabled := True;
  end;
end;

procedure TFLnVend.CBVendClick(Sender: TObject);
begin
  if (CbVend.Checked) then begin
    EditVend.Enabled := False;
  end else begin
    EditVend.Enabled := True;
  end;
end;

procedure TFLnVend.ChkDataClick(Sender: TObject);
begin
  if (ChkData.Checked) then begin
    EditDataIni.Enabled := False;
    EditDataFin.Enabled := False;
  end else begin
    EditDataIni.Enabled := True;
    EditDataFin.Enabled := True;
  end;
end;

procedure TFLnVend.EditClientExit(Sender: TObject);
begin

  if (EditClient.Text = NullAsStringValue) then Abort;

  ADOQueryClient.Close;
  ADOQueryClient.Parameters.ParamByName('PR_CLIENT').Value := EditClient.Text;
  ADOQueryClient.Open;
  //ADOQueryFornec.Locate('PR_FORNEC',DBFornec.Text,[loPartialKey]);

  if (ADOQueryClientCD_CLIENT.Text = NullAsStringValue) then begin
    ShowMessage('Informe um cliente existente!');
    EditClient.SetFocus;
    Abort;
  end;
  EdtFornec.Text := ADOQueryClientDS_CLIENT.Text;
  ADOQueryClient.Open;
end;

procedure TFLnVend.BtnFiltrarClick(Sender: TObject);
var sClient, sVend, sTodas, sDataIni, sDataFin : String;
begin

  if (CbClient.Checked) then begin
    sClient := 'T';
  end else begin
    if (EditClient.Text = NullAsStringValue) then begin
      ShowMessage('Informe o cliente!');
      EditClient.SetFocus;
      Abort;
    end;
    sClient := EditClient.Text;
  end;

  if (CBVend.Checked) then begin
    sVend := 'T';
  end else begin
    if (EditVend.Text = NullAsStringValue) then begin
      ShowMessage('Informe o estoque!');
      EditVend.SetFocus;
      Abort;
    end;
    sVend := EditVend.Text;
  end;

  if (ChkData.Checked) then begin
    sTodas := 'S';
    sDataIni := '01/01/2022';
    sDataFin := '31/12/2096';
  end else begin
    if (EditDataIni.Date > EditDataFin.Date) then begin
      ShowMessage('Informe uma data final maior que a data inicial');
      EditDataFin.SetFocus;
      Abort;
    end;
    sDataIni := DateToStr(EditDataIni.Date);
    sDataFin := DateToStr(EditDataFin.Date);
    sTodas := 'N';
  end;
  ADOQueryVend.Close;
  ADOQueryVend.Parameters.ParamByName('PR_VEND1').Value := sVend;
  ADOQueryVend.Parameters.ParamByName('PR_VEND2').Value := sVend;
  ADOQueryVend.Parameters.ParamByName('PR_CLIENT1').Value := sClient;
  ADOQueryVend.Parameters.ParamByName('PR_CLIENT2').Value := sClient;
  ADOQueryVend.Parameters.ParamByName('PR_DATAINI').Value := sDataIni;
  ADOQueryVend.Parameters.ParamByName('PR_DATAFIN').Value := sDataFin;
  ADOQueryVend.Parameters.ParamByName('PR_TODASDATA').Value := sTodas;
  ADOQueryVend.Open;
end;

procedure TFLnVend.SpeedButton2Click(Sender: TObject);
begin
  ADOQueryTemp.ExecSQL;
  try
    Application.CreateForm(TFLnVenda, FLnVenda);
    TForm(FLnVenda).ShowModal;
  except
    ShowMessage('Falha na Chamada da Tela' + TForm(FLnVenda).Caption);
  end;
end;

procedure TFLnVend.SpeedButton3Click(Sender: TObject);
begin
  if (ADOQueryVend.IsEmpty) then begin
    ShowMessage('Não foi encontrado registros para deletar!');
    Abort;
  end;
      if MessageDlg('Deseja Excluir esse estoque',mtInformation, [mbYes, mbNo], 0, mbYes) = mrYes then begin
    ADOQueryDelete.Parameters.ParamByName('PR_VEND').Value := ADOQueryVendCD_VEND.Text;
    ADOQueryDelete.ExecSQL;
    ADOQueryDelete2.Parameters.ParamByName('PR_VEND').Value := ADOQueryVendCD_VEND.Text;
    ADOQueryDelete2.ExecSQL;
  end else begin
    Abort;
  end;
end;

procedure TFLnVend.SpeedButton4Click(Sender: TObject);
begin
  if (ADOQueryVend.IsEmpty) then begin
    ShowMessage('Não foi encontrado registros para alterar!');
    Abort;
  end;
  try
    Application.CreateForm(TFLnAltVend, FLnAltVend);
    FLnAltVend.ADOQueryVend.Parameters.ParamByName('PR_VEND').Value := ADOQueryVendCD_VEND.Value;
    FLnAltVend.sParam := IntToStr(ADOQueryVendCD_VEND.Value);
    TForm(FLnAltVend).ShowModal;
  except
    ShowMessage('Falha na Chamada da Tela' + TForm(FLnAltVend).Caption);
  end;
end;

end.
