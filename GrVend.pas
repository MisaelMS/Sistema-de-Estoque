unit GrVend;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCGrids, VclTee.TeeGDIPlus, VCLTee.TeEngine,
  VCLTee.TeeProcs, VCLTee.Chart, VCLTee.DBChart, Data.Win.ADODB, VCLTee.Series;

type
  TFGrVend = class(TForm)
    Panel1: TPanel;
    panTitulo: TPanel;
    panCampo: TPanel;
    panMsg: TPanel;
    PlnBotao: TPanel;
    DBChart1: TDBChart;
    Series1: TFastLineSeries;
    ADOQueryGrVend: TADOQuery;
    DataSource1: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGrVend: TFGrVend;

implementation

{$R *.dfm}

Uses RDmComBas;

end.
