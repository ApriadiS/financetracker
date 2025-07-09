object F_FinanceTrackerQuickReport: TF_FinanceTrackerQuickReport
  Left = 0
  Top = 0
  Width = 832
  Height = 1095
  AutoScroll = True
  AutoSize = True
  Caption = 'Finance Tracker Quick Report'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Scaled = False
  TextHeight = 15
  object QuickRep: TQuickRep
    Left = 0
    Top = 0
    Width = 816
    Height = 1056
    ShowingPreview = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = Letter
    Page.Continuous = False
    Page.Values = (
      127.000000000000000000
      2794.000000000000000000
      127.000000000000000000
      2159.000000000000000000
      127.000000000000000000
      127.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.OutputBin = Auto
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 0
    PrinterSettings.ExtendedDuplex = 0
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 0
    PrinterSettings.PrintMetaFile = False
    PrinterSettings.MemoryLimit = 1000000
    PrinterSettings.PrintQuality = 0
    PrinterSettings.Collate = 0
    PrinterSettings.ColorOption = 0
    PrintIfEmpty = True
    SnapToGrid = True
    Units = Inches
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    PreviewWidth = 500
    PreviewHeight = 500
    PrevInitialZoom = qrZoomToFit
    PreviewDefaultSaveType = stPDF
    PreviewLeft = 0
    PreviewTop = 0
    object TitleBand1: TQRBand
      Left = 48
      Top = 48
      Width = 720
      Height = 153
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        404.812500000000000000
        1905.000000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbTitle
      object Shape1: TShape
        Left = 0
        Top = 96
        Width = 193
        Height = 56
      end
      object Shape2: TShape
        Left = 192
        Top = 96
        Width = 193
        Height = 56
      end
      object Shape3: TShape
        Left = 384
        Top = 96
        Width = 169
        Height = 56
      end
      object Shape4: TShape
        Left = 552
        Top = 96
        Width = 168
        Height = 56
      end
      object LabelTitle: TQRLabel
        Left = 0
        Top = 9
        Width = 721
        Height = 34
        Size.Values = (
          89.958333333333330000
          0.000000000000000000
          23.812500000000000000
          1907.645833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'LAPORAN DATA KEUANGAN'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Arial Black'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlCenter
        FontSize = 18
      end
      object QRLabelTanggal: TQRLabel
        Left = 8
        Top = 104
        Width = 178
        Height = 43
        Size.Values = (
          113.770833333333300000
          21.166666666666670000
          275.166666666666700000
          470.958333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Tanggal'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlCenter
        FontSize = 12
      end
      object QRLabelJenisTransaksi: TQRLabel
        Left = 199
        Top = 104
        Width = 178
        Height = 43
        Size.Values = (
          113.770833333333300000
          526.520833333333300000
          275.166666666666700000
          470.958333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Jenis Transaksi'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlCenter
        FontSize = 12
      end
      object QRLabelJumblah: TQRLabel
        Left = 391
        Top = 104
        Width = 155
        Height = 43
        Size.Values = (
          113.770833333333300000
          1034.520833333333000000
          275.166666666666700000
          410.104166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Jumlah'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlCenter
        FontSize = 12
      end
      object QRLabelDeskripsi: TQRLabel
        Left = 559
        Top = 104
        Width = 154
        Height = 43
        Size.Values = (
          113.770833333333300000
          1479.020833333333000000
          275.166666666666700000
          407.458333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Deskripsi'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlCenter
        FontSize = 12
      end
    end
    object DetailBand1: TQRBand
      Left = 48
      Top = 201
      Width = 720
      Height = 42
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        111.125000000000000000
        1905.000000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object Shape5: TShape
        Left = 0
        Top = 0
        Width = 193
        Height = 41
      end
      object Shape6: TShape
        Left = 191
        Top = 0
        Width = 193
        Height = 41
      end
      object Shape7: TShape
        Left = 383
        Top = 0
        Width = 169
        Height = 41
      end
      object Shape8: TShape
        Left = 551
        Top = 0
        Width = 168
        Height = 41
      end
      object QRDBText1: TQRDBText
        Left = 7
        Top = 5
        Width = 178
        Height = 28
        Size.Values = (
          74.083333333333330000
          18.520833333333330000
          13.229166666666670000
          470.958333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlCenter
        FontSize = 10
      end
      object QRDBText2: TQRDBText
        Left = 199
        Top = 5
        Width = 178
        Height = 28
        Size.Values = (
          74.083333333333330000
          526.520833333333300000
          13.229166666666670000
          470.958333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlCenter
        FontSize = 10
      end
      object QRDBText3: TQRDBText
        Left = 390
        Top = 5
        Width = 155
        Height = 28
        Size.Values = (
          74.083333333333330000
          1031.875000000000000000
          13.229166666666670000
          410.104166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlCenter
        FontSize = 10
      end
      object QRDBText4: TQRDBText
        Left = 558
        Top = 5
        Width = 155
        Height = 28
        Size.Values = (
          74.083333333333330000
          1476.375000000000000000
          13.229166666666670000
          410.104166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlCenter
        FontSize = 10
      end
    end
  end
  object ZQuery: TZQuery
    Params = <>
    Left = 712
    Top = 264
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
    Left = 712
    Top = 336
  end
end
