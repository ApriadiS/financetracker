unit FinanceDataQuickReport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, QuickRpt, QRCtrls, Vcl.ExtCtrls,
  ZAbstractConnection, ZConnection, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  TF_FinanceTrackerQuickReport = class(TForm)
    QuickRep: TQuickRep;
    TitleBand1: TQRBand;
    DetailBand1: TQRBand;
    LabelTitle: TQRLabel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    QRLabelTanggal: TQRLabel;
    QRLabelJenisTransaksi: TQRLabel;
    QRLabelJumblah: TQRLabel;
    QRLabelDeskripsi: TQRLabel;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Shape8: TShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    ZQuery: TZQuery;
    ZConnection: TZConnection;
  private
    { Private declarations }
    procedure ConnectionSetup;
    procedure QuerySetup(ATanggal: TDateTime);
    procedure DetailBandSetup;
    procedure QRDBText3Print(sender: TObject; var Value: string);

  public
    { Public declarations }
    procedure GenerateReport(ATanggal: TDateTime);


  end;

var
  F_FinanceTrackerQuickReport: TF_FinanceTrackerQuickReport;

implementation

{$R *.dfm}

procedure TF_FinanceTrackerQuickReport.ConnectionSetup;
begin
  ZConnection.HostName := 'localhost';
  ZConnection.Database := 'financetracker';
  ZConnection.User := 'root';
  ZConnection.Password := '';
  ZConnection.Protocol := 'mysql';
  ZConnection.Port := 3306;
  ZConnection.Connect;
  ZQuery.Connection := ZConnection;
  QuickRep.DataSet := ZQuery;
end;

procedure TF_FinanceTrackerQuickReport.QuerySetup(ATanggal: TDateTime);
begin
  ZQuery.SQL.Text :=
    'SELECT tanggal, ' +
    'CASE WHEN jenis_transaksi = 0 THEN ''Pengeluaran'' ELSE ''Pemasukan'' END AS jenis_transaksi_str, ' +
    'jumblah, deskripsi ' +
    'FROM financedata WHERE DATE(tanggal) = :tanggal';
  ZQuery.ParamByName('tanggal').AsDate := ATanggal;
  ZQuery.Open;
end;

procedure TF_FinanceTrackerQuickReport.GenerateReport(ATanggal: TDateTime);
begin
  ConnectionSetup;
  DetailBandSetup;
  QuerySetup(ATanggal);

  if ZQuery.IsEmpty then
  begin
    ShowMessage('Tidak ada data untuk tanggal yang dipilih.');
    Exit;
  end;

  QuickRep.Preview;
end;

procedure TF_FinanceTrackerQuickReport.DetailBandSetup;
begin
  QRDBText1.DataSet := ZQuery;
  QRDBText2.DataSet := ZQuery;
  QRDBText3.DataSet := ZQuery;
  QRDBText4.DataSet := ZQuery;
  QRDBText1.DataField := 'tanggal';
  QRDBText2.DataField := 'jenis_transaksi_str';
  QRDBText3.DataField := 'jumblah';
  QRDBText4.DataField := 'deskripsi';
  QRDBText1.Mask := 'd mmmm yyyy hh:nn:ss';
  QRDBText3.OnPrint := Self.QRDBText3Print;
end;

procedure TF_FinanceTrackerQuickReport.QRDBText3Print(sender: TObject; var Value: string);
begin
  // Format as Rupiah, no decimals, no comma, with Rp. prefix
  try
    Value := 'Rp. ' + FormatFloat('#,0', StrToFloat(Value));
  except
    Value := 'Rp. ' + Value;
  end;
end;

end.
