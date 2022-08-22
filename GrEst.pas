unit GrEst;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VclTee.TeeGDIPlus, Data.DB,
  VCLTee.TeEngine, VCLTee.Series, VCLTee.TeeProcs, VCLTee.Chart, VCLTee.DBChart,
  Vcl.ExtCtrls, Data.Win.ADODB;

type
  TFGrEst = class(TForm)
    Panel1: TPanel;
    panMsg: TPanel;
    panTitulo: TPanel;
    panCampo: TPanel;
    PlnBotao: TPanel;
    DBChart1: TDBChart;
    ADOQueryGrEst: TADOQuery;
    DataSource1: TDataSource;
    Series1: TFastLineSeries;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGrEst: TFGrEst;

implementation

{$R *.dfm}

Uses RDmComBas;

end.
