unit FinanceData;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, System.UITypes,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Menus, 
  Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, ZAbstractConnection,
  ZConnection, FinanceDataQuickReport;

type
  TF_FinanceData = class(TForm)
    GroupBoxFinance: TGroupBox;
    ListViewData: TListView;
    LabelJenisTransaksi: TLabel;
    LabelDeskripsi: TLabel;
    RichEditDeskripsi: TRichEdit;
    ButtonBuat: TButton;
    ButtonHapus: TButton;
    ButtonUbah: TButton;
    ButtonBatal: TButton;
    ButtonKeluar: TButton;
    DateTimePicker: TDateTimePicker;
    LabelTanggalData: TLabel;
    ButtonPreview: TButton;
    ZConnection: TZConnection;
    ZQuery: TZQuery;
    ButtonSimpan: TButton;
    ComboBoxJenisTransaksi: TComboBox;
    EditJumblah: TEdit;
    LabelJumblah: TLabel;
    
    procedure FormCreate(Sender: TObject);

    
    procedure ButtonBuatClick(Sender: TObject);
    procedure ButtonHapusClick(Sender: TObject);
    procedure ButtonUbahClick(Sender: TObject);
    procedure ButtonBatalClick(Sender: TObject);
    procedure ButtonKeluarClick(Sender: TObject);
    procedure ButtonPreviewClick(Sender: TObject);
    procedure ButtonSimpanClick(Sender: TObject);

    
    procedure ListViewDataItemClick(Sender: TObject; Item: TListItem; Selected: Boolean);

    // sanitasi agar hanya angka yang dapat di input kepada EditJumblah
    procedure EditJumblahKeyPress(Sender: TObject; var Key: Char);
    
    procedure ConfigureMySQLConnection;
  private
    { Private declarations }
    FMode: string; 
    procedure SetStateAwal;
    procedure SetStateEdit;
    procedure SetStateInputBaru;
    procedure RefreshListView;
    procedure ClearFormFields;
  public
    { Public declarations }
  end;

var
  F_FinanceData: TF_FinanceData;

implementation

{$R *.dfm}

procedure TF_FinanceData.EditJumblahKeyPress(Sender: TObject; var Key: Char);
begin
  if not CharInSet(Key, ['0'..'9', #8]) then
    Key := #0;
end;

procedure TF_FinanceData.ClearFormFields;
begin
  ComboBoxJenisTransaksi.ItemIndex := -1;
  EditJumblah.Clear;
  RichEditDeskripsi.Lines.Clear;
  DateTimePicker.Date := Now; 
  ListViewData.Selected := nil; 
end;

procedure TF_FinanceData.FormCreate(Sender: TObject);
begin
  ConfigureMySQLConnection;
  DateTimePicker.Date := Now;
  RichEditDeskripsi.Lines.Clear;
  ComboBoxJenisTransaksi.Items.Clear;
  ComboBoxJenisTransaksi.Items.Add('Pengeluaran'); // 0
  ComboBoxJenisTransaksi.Items.Add('Pemasukan');   // 1
  ComboBoxJenisTransaksi.ItemIndex := -1;
  RefreshListView;
  ListViewData.OnSelectItem := ListViewDataItemClick;
  ListViewData.ReadOnly := True; // Prevent editing directly in ListView
  ListViewData.ViewStyle := vsReport;
  ListViewData.RowSelect := True;  
  ButtonBuat.OnClick := ButtonBuatClick;
  ButtonHapus.OnClick := ButtonHapusClick;
  ButtonUbah.OnClick := ButtonUbahClick;
  ButtonBatal.OnClick := ButtonBatalClick;
  ButtonKeluar.OnClick := ButtonKeluarClick;
  ButtonPreview.OnClick := ButtonPreviewClick;
  ButtonSimpan.OnClick := ButtonSimpanClick;
  EditJumblah.OnKeyPress := EditJumblahKeyPress;
  SetStateAwal;
end;

procedure TF_FinanceData.ConfigureMySQLConnection;
begin
  ZConnection.HostName := 'localhost'; 
  ZConnection.Database := 'financetracker'; 
  ZConnection.User := 'root'; 
  ZConnection.Password := ''; 
  ZConnection.Protocol := 'mysql'; 
  ZConnection.Port := 3306; 
  ZConnection.Connect;
  ZQuery.Connection := ZConnection;
  if not ZConnection.Connected then
    ShowMessage('Failed to connect to the database.');
end;

procedure TF_FinanceData.SetStateAwal;
begin
  ButtonBuat.Enabled := True;
  ButtonSimpan.Enabled := False;
  ButtonUbah.Enabled := False;
  ButtonHapus.Enabled := False;
  ButtonBatal.Enabled := True;
  ButtonKeluar.Enabled := True;
  ButtonPreview.Enabled := True;
  ComboBoxJenisTransaksi.Enabled := False;
  EditJumblah.Enabled := False;
  RichEditDeskripsi.Enabled := False;
  ListViewData.Enabled := True; // Enable ListView for data selection
  ListViewData.Selected := nil; // Clear any selection
  ClearFormFields;
end;

procedure TF_FinanceData.SetStateEdit;
begin
  ButtonBuat.Enabled := False;
  ButtonSimpan.Enabled := True;
  ButtonUbah.Enabled := True;
  ButtonHapus.Enabled := True;
  ButtonBatal.Enabled := True;
  ButtonKeluar.Enabled := True;
  ButtonPreview.Enabled := True;
  ComboBoxJenisTransaksi.Enabled := True;
  EditJumblah.Enabled := True;
  RichEditDeskripsi.Enabled := True;
end;

procedure TF_FinanceData.SetStateInputBaru;
begin
  ButtonBuat.Enabled := False;
  ButtonSimpan.Enabled := True;
  ButtonUbah.Enabled := False;
  ButtonHapus.Enabled := False;
  ButtonBatal.Enabled := True;
  ButtonKeluar.Enabled := True;
  ButtonPreview.Enabled := False;
  ComboBoxJenisTransaksi.Enabled := True;
  EditJumblah.Enabled := True;
  RichEditDeskripsi.Enabled := True;
  ListViewData.Selected := nil; 
  ListViewData.Enabled := False; // Disable ListView while inputting new data
  ClearFormFields;
end;

procedure TF_FinanceData.RefreshListView;
begin
  ListViewData.Clear;
  ZQuery.SQL.Text := 'SELECT * FROM financedata ORDER BY tanggal DESC';
  ZQuery.Open;
  while not ZQuery.Eof do
  begin
    with ListViewData.Items.Add do
    begin
      Caption := FormatDateTime('d mmmm yyyy hh:nn:ss', ZQuery.FieldByName('tanggal').AsDateTime);
      if ZQuery.FieldByName('jenis_transaksi').AsInteger = 0 then
        SubItems.Add('Pengeluaran')
      else
        SubItems.Add('Pemasukan');
      SubItems.Add(ZQuery.FieldByName('jumblah').AsString);
      SubItems.Add(ZQuery.FieldByName('deskripsi').AsString);
      Data := Pointer(ZQuery.FieldByName('id_transaksi').AsInteger);
    end;
    ZQuery.Next;
  end;
  ZQuery.Close;
end;

procedure TF_FinanceData.ButtonBuatClick(Sender: TObject);
begin
  FMode := 'create';
  SetStateInputBaru;
end;

procedure TF_FinanceData.ButtonSimpanClick(Sender: TObject);
var
  jenisTransaksi: Integer;
begin
  if (ComboBoxJenisTransaksi.ItemIndex = -1) or
     (EditJumblah.Text = '') or
     (RichEditDeskripsi.Lines.Count = 0) then
  begin
    ShowMessage('Silakan lengkapi semua data yang wajib diisi.');
    Exit;
  end;
  if not ZConnection.Connected then
  begin
    ShowMessage('Koneksi ke database belum berhasil.');
    Exit;
  end;
  jenisTransaksi := ComboBoxJenisTransaksi.ItemIndex; // 0: Pengeluaran, 1: Pemasukan
  try
    if FMode = 'create' then
    begin
      ZQuery.SQL.Text := 'INSERT INTO financedata (tanggal, jenis_transaksi, deskripsi, jumblah) VALUES (NOW(), :jenis_transaksi, :deskripsi, :jumblah)';
      ZQuery.ParamByName('jenis_transaksi').AsInteger := jenisTransaksi;
      ZQuery.ParamByName('deskripsi').AsString := RichEditDeskripsi.Lines.Text;
      ZQuery.ParamByName('jumblah').AsString := EditJumblah.Text;
      ZQuery.ExecSQL;
      ShowMessage('Data keuangan berhasil ditambahkan.');
    end
    else if (FMode = 'edit') and (ListViewData.Selected <> nil) then
    begin
      ZQuery.SQL.Text := 'UPDATE financedata SET jenis_transaksi = :jenis_transaksi, deskripsi = :deskripsi, jumblah = :jumblah WHERE id_transaksi = :id_transaksi';
      ZQuery.ParamByName('jenis_transaksi').AsInteger := jenisTransaksi;
      ZQuery.ParamByName('deskripsi').AsString := RichEditDeskripsi.Lines.Text;
      ZQuery.ParamByName('jumblah').AsString := EditJumblah.Text;
      ZQuery.ParamByName('id_transaksi').AsInteger := Integer(ListViewData.Selected.Data);
      ZQuery.ExecSQL;
      ShowMessage('Data keuangan berhasil diubah.');
    end;
    RefreshListView;
    SetStateAwal;
    FMode := '';
  except
    on E: Exception do
      ShowMessage('Gagal menyimpan data keuangan: ' + E.Message);
  end;
end;

procedure TF_FinanceData.ButtonHapusClick(Sender: TObject);
begin
  
  if ListViewData.Selected = nil then
  begin
    ShowMessage('Silakan pilih data keuangan yang ingin dihapus.');
    Exit;
  end;

  if not ZConnection.Connected then
  begin
    ShowMessage('Koneksi ke database belum berhasil.');
    Exit;
  end;

  if MessageDlg('Apakah Anda yakin ingin menghapus data ini?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    try
      ZQuery.SQL.Text := 'DELETE FROM financedata WHERE id_transaksi = :id';
      ZQuery.ParamByName('id').AsInteger := Integer(ListViewData.Selected.Data);
      ZQuery.ExecSQL;
      ShowMessage('Data keuangan berhasil dihapus.');
      RefreshListView;
      SetStateAwal;
    except
      on E: Exception do
        ShowMessage('Gagal menghapus data keuangan: ' + E.Message);
    end;
  end;
end;

procedure TF_FinanceData.ButtonUbahClick(Sender: TObject);
begin
  if ListViewData.Selected = nil then
  begin
    ShowMessage('Silakan pilih data keuangan yang ingin diubah.');
    Exit;
  end;
  FMode := 'edit';
  SetStateEdit;
end;

procedure TF_FinanceData.ButtonPreviewClick(Sender: TObject);
var
  LFinanceReport: TF_FinanceTrackerQuickReport;
begin
  LFinanceReport := TF_FinanceTrackerQuickReport.Create(Self);
  try
    LFinanceReport.GenerateReport(DateTimePicker.Date);
  finally
    LFinanceReport.Free;
  end;
end;

procedure TF_FinanceData.ListViewDataItemClick(Sender: TObject; Item: TListItem; Selected: Boolean);
begin
  
  if Selected then
  begin
    if Item.SubItems[0] = 'Pengeluaran' then
      ComboBoxJenisTransaksi.ItemIndex := 0
    else if Item.SubItems[0] = 'Pemasukan' then
      ComboBoxJenisTransaksi.ItemIndex := 1
    else
      ComboBoxJenisTransaksi.ItemIndex := -1;
    EditJumblah.Text := Item.SubItems[1]; 
    RichEditDeskripsi.Lines.Text := Item.SubItems[2];
    ButtonUbah.Enabled := True;
    ButtonHapus.Enabled := True;
  end
  else
  begin
    ButtonUbah.Enabled := False;
    ButtonHapus.Enabled := False;
  end;
end;

procedure TF_FinanceData.ButtonBatalClick(Sender: TObject);
begin  
  ClearFormFields;
  SetStateAwal;
end;

procedure TF_FinanceData.ButtonKeluarClick(Sender: TObject);
begin  
  Application.Terminate;
end;

end.