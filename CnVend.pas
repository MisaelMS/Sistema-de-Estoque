unit CnVend;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  frxClass, Data.DB, Data.Win.ADODB, frxDBSet, Vcl.ComCtrls;

type
  TFCnVend = class(TForm)
    PlnBotao: TPanel;
    Label1: TLabel;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    Label5: TLabel;
    cbclient: TCheckBox;
    EditCli: TEdit;
    EditProd: TEdit;
    cbprod: TCheckBox;
    Panel1: TPanel;
    panMsg: TPanel;
    panTitulo: TPanel;
    panCampo: TPanel;
    frxDB: TfrxDBDataset;
    src: TDataSource;
    Consulta: TADOQuery;
    Relat: TfrxReport;
    DTINI: TDateTimePicker;
    DTFIN: TDateTimePicker;
    cbPer: TCheckBox;
    Label3: TLabel;
    Label4: TLabel;
    Consultacd_vend: TAutoIncField;
    Consultavl_venda: TFloatField;
    Consultacd_client: TIntegerField;
    Consultadt_cadast: TDateTimeField;
    Consultanr_item: TAutoIncField;
    Consultach_produt: TWideStringField;
    Consultads_produt: TWideStringField;
    Consultanr_qtd: TIntegerField;
    Consultadt_vend: TDateTimeField;
    Consultavl_vend: TFloatField;
    Consultavl_descont: TFloatField;
    Consultavl_vendtotal: TFloatField;
    Consultads_client: TWideStringField;
    SpeedButton7: TSpeedButton;
    procedure SpeedButton5Click(Sender: TObject);
    procedure cbclientClick(Sender: TObject);
    procedure cbprodClick(Sender: TObject);
    procedure cbPerClick(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCnVend: TFCnVend;

implementation

{$R *.dfm}

Uses GrVend, RDmComBas;

procedure TFCnVend.cbclientClick(Sender: TObject);
begin
  if (cbclient.Checked) then begin
    EditCli.Enabled := False;
  end else begin
    EditCli.Enabled := True;
  end;
end;

procedure TFCnVend.cbPerClick(Sender: TObject);
begin
  if (cbPer.Checked) then
  begin
    DTINI.Enabled := False;
    DTFIN.Enabled := False;
  end
  else
  begin
    DTINI.Enabled := True;
    DTFIN.Enabled := True;
  end;
end;

procedure TFCnVend.cbprodClick(Sender: TObject);
begin
  if (cbprod.Checked) then begin
    EditProd.Enabled := False;
  end else begin
    EditProd.Enabled := True;
  end;
end;

procedure TFCnVend.SpeedButton5Click(Sender: TObject);
var
  sClient: string;
  sProd: string;
  sDataIni: string;
  sDataFin: string;
  sTodas: string;
begin

  if (cbclient.Checked) then
  begin
    sclient := '0';
  end
  else
  begin
    if (EditCli.Text = NullAsStringValue) then
    begin
      ShowMessage('Informe um fornecedor!');
      EditCli.SetFocus;
      Abort;
    end;
    sClient := EditCli.Text;
  end;

  if (cbProd.Checked) then
  begin
    sProd := 'T';
  end
  else
  begin
    if (EditProd.Text = NullAsStringValue) then
    begin
      ShowMessage('Informe um produto!');
      EditProd.SetFocus;
      Abort;
    end;
    sProd := EditProd.Text;
  end;

  if (cbPer.Checked) then
  begin
    sTodas := 'S';
  end
  else
  begin
    if (DTINI.Date > DTFIN.Date) then begin
      ShowMessage('Informe uma data final maior que a data inicial!');
      DTFIN.SetFocus;
      Abort;
    end;
    sDataIni := DateToStr(DTINI.Date);
    sDataFin := DateToStr(DTFIN.Date);
  end;

  Consulta.Close;
  Consulta.Parameters.ParamByName('PR_CLIENT').Value := sClient;
  Consulta.Parameters.ParamByName('PR_PROD').Value := sProd;
  Consulta.Parameters.ParamByName('PR_INI').Value := sDataIni;
  Consulta.Parameters.ParamByName('PR_FIN').Value := sDataFin;
  Consulta.Parameters.ParamByName('PR_TODAS').Value := sTodas;
  Consulta.Open;
  Relat.ShowReport();
end;

procedure TFCnVend.SpeedButton7Click(Sender: TObject);
var
  sClient: string;
  sProd: string;
  sDataIni: string;
  sDataFin: string;
  sTodas: string;
begin

  if (cbclient.Checked) then
  begin
    sclient := '0';
  end
  else
  begin
    if (EditCli.Text = NullAsStringValue) then
    begin
      ShowMessage('Informe um fornecedor!');
      EditCli.SetFocus;
      Abort;
    end;
    sClient := EditCli.Text;
  end;

  if (cbProd.Checked) then
  begin
    sProd := 'T';
  end
  else
  begin
    if (EditProd.Text = NullAsStringValue) then
    begin
      ShowMessage('Informe um produto!');
      EditProd.SetFocus;
      Abort;
    end;
    sProd := EditProd.Text;
  end;

  if (cbPer.Checked) then
  begin
    sTodas := 'S';
  end
  else
  begin
    if (DTINI.Date > DTFIN.Date) then begin
      ShowMessage('Informe uma data final maior que a data inicial!');
      DTFIN.SetFocus;
      Abort;
    end;
    sDataIni := DateToStr(DTINI.Date);
    sDataFin := DateToStr(DTFIN.Date);
  end;
  try
    Application.CreateForm(TFGrVend, FGrVend);
    FGrVend.ADOQueryGrVend.Close;
    FGrVend.ADOQueryGrVend.Parameters.ParamByName('PR_CLIENT').Value := sClient;
    FGrVend.ADOQueryGrVend.Parameters.ParamByName('PR_PROD').Value := sProd;
    FGrVend.ADOQueryGrVend.Parameters.ParamByName('PR_CLIENT2').Value := sClient;
    FGrVend.ADOQueryGrVend.Parameters.ParamByName('PR_PROD2').Value := sProd;
    FGrVend.ADOQueryGrVend.Parameters.ParamByName('PR_INI').Value := sDataIni;
    FGrVend.ADOQueryGrVend.Parameters.ParamByName('PR_FIN').Value := sDataFin;
    FGrVend.ADOQueryGrVend.Parameters.ParamByName('PR_TODAS').Value := sTodas;
    FGrVend.ADOQueryGrVend.Open;
    TForm(FGrVend).ShowModal;
  except
    ShowMessage('Falha na Chamada da Tela' + TForm(FGrVend).Caption);
  end;
end;

end.
