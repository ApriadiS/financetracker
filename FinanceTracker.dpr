program FinanceTracker;

uses
  Vcl.Forms,
  FinanceData in 'FinanceData.pas' {F_FinanceData},
  FinanceDataQuickReport in 'FinanceDataQuickReport.pas' {F_FinanceTrackerQuickReport};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TF_FinanceData, F_FinanceData);
  Application.CreateForm(TF_FinanceTrackerQuickReport, F_FinanceTrackerQuickReport);
  Application.Run;
end.
