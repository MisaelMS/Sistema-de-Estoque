program MichaelJackson;

uses
  Vcl.Forms,
  DpMenPro in 'DpMenPro.pas' {FDpMenPro},
  CdProdut in 'CdProdut.pas' {Form1},
  RDmComBas in 'RDmComBas.pas' {FRDmComBas: TDataModule},
  CdClient in 'CdClient.pas' {FCdClient},
  LnProdut in 'LnProdut.pas' {FLnProdut},
  CdFornec in 'CdFornec.pas' {FCdFornec},
  CnEst in 'CnEst.pas' {FCnEst},
  CnVend in 'CnVend.pas' {FCnVend},
  CdTipPag in 'CdTipPag.pas' {FCdTipPag},
  LnEst in 'LnEst.pas' {FLnEst},
  LnAltEst in 'LnAltEst.pas' {FLnAltEst},
  LnVend in 'LnVend.pas' {FLnVend},
  LnAltVend in 'LnAltVend.pas' {FLnAltVend},
  LnVenda in 'LnVenda.pas' {FLnVenda},
  GrVend in 'GrVend.pas' {FGrVend},
  GrEst in 'GrEst.pas' {FGrEst};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFDpMenPro, FDpMenPro);
  Application.CreateForm(TFRDmComBas, FRDmComBas);
  Application.Run;
end.
