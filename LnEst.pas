unit LnEst;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Data.Win.ADODB, Vcl.ComCtrls,
  System.ImageList, Vcl.ImgList;

type
  TFLnEst = class(TForm)
    Panel1: TPanel;
    BtnFiltrar: TSpeedButton;
    panTitulo: TPanel;
    panCampo: TPanel;
    PlnBotao: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    CbFornec: TCheckBox;
    EditFornec: TEdit;
    panMsg: TPanel;
    EdtFornec: TEdit;
    Panel2: TPanel;
    GridProdutos: TDBGrid;
    srcLancam: TDataSource;
    Panel3: TPanel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    ADOQueryDelete: TADOQuery;
    SpeedButton4: TSpeedButton;
    ComboBox1: TComboBox;
    ADOQueryEst: TADOQuery;
    EditEst: TEdit;
    Label1: TLabel;
    ChkEst: TCheckBox;
    ChkData: TCheckBox;
    ADOQueryEstCD_EST: TIntegerField;
    ADOQueryEstDT_ENTRADA: TDateTimeField;
    ADOQueryEstVL_VALOR: TFloatField;
    ADOQueryEstCH_STATUS: TWideStringField;
    EditDataIni: TDateTimePicker;
    EditDataFin: TDateTimePicker;
    ADOQueryFornec: TADOQuery;
    ADOQueryFornecCD_FORNEC: TIntegerField;
    ADOQueryFornecDS_FORNEC: TWideStringField;
    ImagemBotoes: TImageList;
    Image1: TImage;
    ADOQueryDeleteTPESTOQ: TADOQuery;
    ADOQueryDelete2: TADOQuery;
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton3Click(Sender: TObject);
    procedure BtnFiltrarClick(Sender: TObject);
    procedure ChkEstClick(Sender: TObject);
    procedure ChkDataClick(Sender: TObject);
    procedure EditFornecExit(Sender: TObject);
    procedure CbFornecClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLnEst: TFLnEst;

implementation

{$R *.dfm}

Uses RDmComBas, LnProdut, LnAltEst;

procedure TFLnEst.CbFornecClick(Sender: TObject);
begin
  if (CbFornec.Checked) then begin
    EditFornec.Enabled := False;
  end else begin
    EditFornec.Enabled := True;
  end;

end;

procedure TFLnEst.ChkDataClick(Sender: TObject);
begin
  if ChkData.Checked then begin
    EditDataIni.Enabled := False;
    EditDataFin.Enabled := False;
  end else begin
    EditDataIni.Enabled := True;
    EditDataFin.Enabled := True;
  end;
end;

procedure TFLnEst.ChkEstClick(Sender: TObject);
begin
  if (ChkEst.Checked) then begin
    EditEst.Enabled := False;
  end else begin
    EditEst.Enabled := True;
  end;
end;

procedure TFLnEst.EditFornecExit(Sender: TObject);
begin

  if (EditFornec.Text = NullAsStringValue) then Abort;

  ADOQueryFornec.Close;
  ADOQueryFornec.Parameters.ParamByName('PR_FORNEC').Value := EditFornec.Text;
  ADOQueryFornec.Open;
  //ADOQueryFornec.Locate('PR_FORNEC',DBFornec.Text,[loPartialKey]);

  if (ADOQueryFornecCD_FORNEC.Text = NullAsStringValue) then begin
    ShowMessage('Informe um fornecedor existente!');
    EditFornec.SetFocus;
    Abort;
  end;
  EdtFornec.Text := ADOQueryFornecDS_FORNEC.Text;
  ADOQueryEst.Open;
end;

procedure TFLnEst.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FLnEst := nil;
end;

procedure TFLnEst.BtnFiltrarClick(Sender: TObject);
var sFornec, sEst, sTodas, sDataIni, sDataFin : String;
begin

  if (CbFornec.Checked) then begin
    sFornec := 'T';
  end else begin
    if (EditFornec.Text = NullAsStringValue) then begin
      ShowMessage('Informe o fornecedor!');
      EditFornec.SetFocus;
      Abort;
    end;
    sFornec := EditFornec.Text;
  end;

  if (ChkEst.Checked) then begin
    sEst := 'T';
  end else begin
    if (EditEst.Text = NullAsStringValue) then begin
      ShowMessage('Informe o estoque!');
      EditEst.SetFocus;
      Abort;
    end;
    sEst := EditEst.Text;
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
  ADOQueryEst.Close;
  ADOQueryEst.Parameters.ParamByName('PR_EST').Value := sEst;
  ADOQueryEst.Parameters.ParamByName('PR_EST2').Value := sEst;
  ADOQueryEst.Parameters.ParamByName('PR_FORNEC').Value := sFornec;
  ADOQueryEst.Parameters.ParamByName('PR_FORNEC2').Value := sFornec;
  ADOQueryEst.Parameters.ParamByName('PR_DATAINI').Value := sDataIni;
  ADOQueryEst.Parameters.ParamByName('PR_DATAFIN').Value := sDataFin;
  ADOQueryEst.Parameters.ParamByName('PR_TODASDATA').Value := sTodas;
  ADOQueryEst.Open;
end;

procedure TFLnEst.SpeedButton2Click(Sender: TObject);
begin
  ADOQueryDeleteTPESTOQ.ExecSQL;
  try
    Application.CreateForm(TFLnProdut, FLnProdut);
    TForm(FLnProdut).ShowModal;
  except
    ShowMessage('Falha na Chamada da Tela' + TForm(FLnProdut).Caption);
  end;
end;

procedure TFLnEst.SpeedButton3Click(Sender: TObject);
begin
  if (ADOQueryEst.IsEmpty) then begin
    ShowMessage('Não foi encontrado registros para deletar!');
    Abort;
  end;
  if MessageDlg('Deseja Excluir esse estoque',mtInformation, [mbYes, mbNo], 0, mbYes) = mrYes then begin
    ADOQueryDelete.Parameters.ParamByName('PR_EST').Value := ADOQueryEstCD_EST.Text;
    ADOQueryDelete.ExecSQL;
    ADOQueryDelete2.Parameters.ParamByName('PR_EST').Value := ADOQueryEstCD_EST.Text;
    ADOQueryDelete2.ExecSQL;
  end else begin
    Abort;
  end;
end;

procedure TFLnEst.SpeedButton4Click(Sender: TObject);
begin
  if (ADOQueryEst.IsEmpty) then begin
    ShowMessage('Não foi encontrado registros para alterar!');
    Abort;
  end;
  try
    Application.CreateForm(TFLnAltEst, FLnAltEst);
    FLnAltEst.ADOQueryEst.Parameters.ParamByName('PR_EST').Value := ADOQueryEstCD_EST.Value;
    FLnAltEst.sParam := IntToStr(ADOQueryEstCD_EST.Value);
    TForm(FLnAltEst).ShowModal;
  except
    ShowMessage('Falha na Chamada da Tela' + TForm(FLnAltEst).Caption);
  end;
end;

end.
