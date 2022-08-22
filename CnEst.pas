unit CnEst;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls,
  Data.DB, Data.Win.ADODB, frxClass, frxDBSet, Vcl.Mask, Vcl.DBCtrls,
  Vcl.ComCtrls;

type
  TFCnEst = class(TForm)
    Panel1: TPanel;
    panTitulo: TPanel;
    panCampo: TPanel;
    panMsg: TPanel;
    PlnBotao: TPanel;
    Label2: TLabel;
    cbFornec: TCheckBox;
    Label3: TLabel;
    SpeedButton5: TSpeedButton;
    Label4: TLabel;
    SpeedButton6: TSpeedButton;
    EditFornec: TEdit;
    EditProd: TEdit;
    Label5: TLabel;
    cbProd: TCheckBox;
    Consulta: TADOQuery;
    Relat: TfrxReport;
    frxDB: TfrxDBDataset;
    src: TDataSource;
    Consultacd_est: TIntegerField;
    Consultavl_valor: TFloatField;
    Consultacd_fornec: TIntegerField;
    Consultaceestoqprindt_entrada: TDateTimeField;
    Consultach_status: TWideStringField;
    Consultanr_item: TIntegerField;
    Consultach_produt: TWideStringField;
    Consultads_produt: TWideStringField;
    Consultavl_qtd: TIntegerField;
    Consultaceestoqdt_entrada: TDateTimeField;
    Consultavl_precom: TFloatField;
    Consultavl_prevend: TFloatField;
    Consultavl_trans: TFloatField;
    Consultavl_percprec: TFloatField;
    Consultavl_total: TFloatField;
    Consultads_fornec: TWideStringField;
    DTINI: TDateTimePicker;
    DTFIN: TDateTimePicker;
    cbPer: TCheckBox;
    SpeedButton7: TSpeedButton;
    procedure SpeedButton5Click(Sender: TObject);
    procedure cbFornecClick(Sender: TObject);
    procedure cbProdClick(Sender: TObject);
    procedure cbPerClick(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCnEst: TFCnEst;

implementation

{$R *.dfm}

Uses RDmComBas, GrEst;

procedure TFCnEst.cbFornecClick(Sender: TObject);
begin
  if (cbFornec.Checked) then
  begin
    EditFornec.Enabled := False;
  end
  else
  begin
    EditFornec.Enabled := True;
  end;
end;

procedure TFCnEst.cbPerClick(Sender: TObject);
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

procedure TFCnEst.cbProdClick(Sender: TObject);
begin
  if (cbProd.Checked) then
  begin
    EditProd.Enabled := False;
  end
  else
  begin
    EditProd.Enabled := True;
  end;
end;

procedure TFCnEst.SpeedButton5Click(Sender: TObject);
var
  sFornec: string;
  sProd: string;
  sDataIni: string;
  sDataFin: string;
  sTodas: string;
begin

  if (cbFornec.Checked) then
  begin
    sFornec := '0';
  end
  else
  begin
    if (EditFornec.Text = NullAsStringValue) then
    begin
      ShowMessage('Informe um fornecedor!');
      EditFornec.SetFocus;
      Abort;
    end;
    sFornec := EditFornec.Text;
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
  Consulta.Parameters.ParamByName('PR_FORNEC').Value := sFornec;
  Consulta.Parameters.ParamByName('PR_PROD').Value := sProd;
  Consulta.Parameters.ParamByName('PR_INI').Value := sDataIni;
  Consulta.Parameters.ParamByName('PR_FIN').Value := sDataFin;
  Consulta.Parameters.ParamByName('PR_TODAS').Value := sTodas;
  Consulta.Open;
  Relat.ShowReport();
end;

procedure TFCnEst.SpeedButton6Click(Sender: TObject);
begin
  cbFornec.Checked := False;
  EditFornec.Clear;
  cbProd.Checked := False;
  EditProd.Clear;
  cbPer.Checked := False;
  DTINI.Date := Date - 30;
  DTFIN.Date := Date;
end;

procedure TFCnEst.SpeedButton7Click(Sender: TObject);
var
  sFornec: string;
  sProd: string;
  sDataIni: string;
  sDataFin: string;
  sTodas: string;
begin
  sTodas := 'N';
  if (cbFornec.Checked) then
  begin
    sFornec := 'T';
  end
  else
  begin
    if (EditFornec.Text = NullAsStringValue) then
    begin
      ShowMessage('Informe um fornecedor!');
      EditFornec.SetFocus;
      Abort;
    end;
    sFornec := EditFornec.Text;
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
    sTodas := 'T';
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
    Application.CreateForm(TFGrEst, FGrEst);

    FGrEst.ADOQueryGrEst.Close;
    FGrEst.ADOQueryGrEst.Parameters.ParamByName('PR_FORNEC').Value := sFornec;
    FGrEst.ADOQueryGrEst.Parameters.ParamByName('PR_FORNEC2').Value := sFornec;
    FGrEst.ADOQueryGrEst.Parameters.ParamByName('PR_TODAS').Value := sTodas;
    FGrEst.ADOQueryGrEst.Parameters.ParamByName('PR_INI').Value := sDataIni;
    FGrEst.ADOQueryGrEst.Parameters.ParamByName('PR_FIN').Value := sDataFin;
    FGrEst.ADOQueryGrEst.Open;
    TForm(FGrEst).ShowModal;

  except
    ShowMessage('Falha na Chamada da Tela' + TForm(FGrEst).Caption);
  end;
end;

end.
