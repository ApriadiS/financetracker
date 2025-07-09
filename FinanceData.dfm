object F_FinanceData: TF_FinanceData
  Left = 0
  Top = 0
  Caption = 'Finance Tracker'
  ClientHeight = 389
  ClientWidth = 884
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object GroupBoxFinance: TGroupBox
    Left = 8
    Top = 8
    Width = 865
    Height = 376
    Caption = 'Finance'
    TabOrder = 0
    object LabelJenisTransaksi: TLabel
      Left = 15
      Top = 31
      Width = 73
      Height = 15
      Caption = 'JenisTransaksi'
    end
    object LabelDeskripsi: TLabel
      Left = 15
      Top = 89
      Width = 47
      Height = 15
      Caption = 'Deskripsi'
    end
    object LabelJumblah: TLabel
      Left = 15
      Top = 60
      Width = 45
      Height = 15
      Caption = 'Jumblah'
    end
    object LabelTanggalData: TLabel
      Left = 15
      Top = 317
      Width = 69
      Height = 15
      Caption = 'Tanggal Data'
    end
    object ListViewData: TListView
      Left = 374
      Top = 28
      Width = 475
      Height = 333
      Columns = <
        item
          AutoSize = True
          Caption = 'Tanggal'
        end
        item
          AutoSize = True
          Caption = 'Jenis Transaksi'
        end
        item
          AutoSize = True
          Caption = 'Jumblah'
        end
        item
          AutoSize = True
          Caption = 'Deskripsi'
        end>
      ReadOnly = True
      RowSelect = True
      TabOrder = 11
      TabStop = False
      ViewStyle = vsReport
    end
    object RichEditDeskripsi: TRichEdit
      Left = 127
      Top = 86
      Width = 185
      Height = 89
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object ButtonBuat: TButton
      Left = 143
      Top = 196
      Width = 75
      Height = 25
      Caption = 'Buat'
      TabOrder = 3
    end
    object ButtonHapus: TButton
      Left = 143
      Top = 227
      Width = 75
      Height = 25
      Caption = 'Hapus'
      TabOrder = 5
    end
    object ButtonUbah: TButton
      Left = 224
      Top = 196
      Width = 75
      Height = 25
      Caption = 'Ubah'
      TabOrder = 4
    end
    object ButtonBatal: TButton
      Left = 224
      Top = 227
      Width = 75
      Height = 25
      Caption = 'Batal'
      TabOrder = 6
    end
    object ButtonKeluar: TButton
      Left = 224
      Top = 258
      Width = 75
      Height = 25
      Caption = 'Keluar'
      TabOrder = 8
    end
    object ButtonSimpan: TButton
      Left = 143
      Top = 258
      Width = 75
      Height = 25
      Caption = 'Simpan'
      TabOrder = 7
    end
    object ComboBoxJenisTransaksi: TComboBox
      Left = 127
      Top = 28
      Width = 185
      Height = 23
      Style = csDropDownList
      TabOrder = 0
    end
    object EditJumblah: TEdit
      Left = 127
      Top = 57
      Width = 185
      Height = 23
      TabOrder = 1
    end
    object ButtonPreview: TButton
      Left = 224
      Top = 338
      Width = 75
      Height = 25
      Caption = 'Preview'
      TabOrder = 10
    end
    object DateTimePicker: TDateTimePicker
      Left = 15
      Top = 338
      Width = 186
      Height = 25
      Date = 45838.000000000000000000
      Format = 'dd-MMMM-yyyy'
      Time = 0.986119849534588900
      TabOrder = 9
    end
  end
  object ZConnection: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    DisableSavepoints = False
    HostName = ''
    Port = 0
    Database = ''
    User = ''
    Password = ''
    Protocol = ''
    Left = 72
    Top = 296
  end
  object ZQuery: TZQuery
    Params = <>
    Left = 24
    Top = 296
  end
end
