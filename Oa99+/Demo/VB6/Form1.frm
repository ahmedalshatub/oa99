VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "Comdlg32.ocx"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   9705
   ClientLeft      =   6435
   ClientTop       =   3135
   ClientWidth     =   8640
   LinkTopic       =   "Form1"
   ScaleHeight     =   9705
   ScaleWidth      =   8640
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   4920
      Top             =   0
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.PictureBox Picture2 
      Height          =   3930
      Left            =   45
      ScaleHeight     =   3870
      ScaleWidth      =   4125
      TabIndex        =   46
      Top             =   975
      Width           =   4185
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   200
      Left            =   4065
      Top             =   0
   End
   Begin VB.CommandButton Command16 
      Caption         =   "Set"
      Height          =   375
      Left            =   4395
      TabIndex        =   45
      Top             =   4170
      Width           =   1695
   End
   Begin VB.CommandButton Command15 
      Caption         =   "Set Defsult"
      Height          =   375
      Left            =   6765
      TabIndex        =   44
      Top             =   4185
      Width           =   1695
   End
   Begin VB.Frame Frame3 
      Caption         =   "1:N match with current dir feature"
      Height          =   1335
      Left            =   4380
      TabIndex        =   30
      Top             =   8145
      Width           =   4110
      Begin VB.CommandButton Command14 
         Caption         =   "Match"
         Height          =   285
         Left            =   3195
         TabIndex        =   42
         Top             =   660
         Width           =   810
      End
      Begin VB.TextBox Text4 
         Height          =   345
         Left            =   1365
         TabIndex        =   41
         Top             =   600
         Width           =   1650
      End
      Begin VB.TextBox Text3 
         Height          =   300
         Left            =   1365
         TabIndex        =   40
         Top             =   225
         Width           =   1905
      End
      Begin VB.CommandButton Command13 
         Caption         =   "Browse"
         Height          =   285
         Left            =   3270
         TabIndex        =   37
         Top             =   210
         Width           =   810
      End
      Begin VB.Label Label13 
         Height          =   240
         Left            =   120
         TabIndex        =   43
         Top             =   1080
         Width           =   1095
      End
      Begin VB.Label Label12 
         Caption         =   "Result"
         Height          =   240
         Left            =   135
         TabIndex        =   39
         Top             =   705
         Width           =   1095
      End
      Begin VB.Label Label11 
         Caption         =   "Feature file"
         Height          =   240
         Left            =   120
         TabIndex        =   38
         Top             =   270
         Width           =   1095
      End
   End
   Begin VB.Frame Frame2 
      Caption         =   "1:1 Match with feature file"
      Height          =   1335
      Left            =   4410
      TabIndex        =   29
      Top             =   6735
      Width           =   4080
      Begin VB.CommandButton Command12 
         Caption         =   "Match"
         Height          =   285
         Left            =   3195
         TabIndex        =   36
         Top             =   735
         Width           =   810
      End
      Begin VB.TextBox Text2 
         Height          =   345
         Left            =   1275
         TabIndex        =   35
         Top             =   690
         Width           =   1650
      End
      Begin VB.CommandButton Command11 
         Caption         =   "Browse"
         Height          =   285
         Left            =   3225
         TabIndex        =   34
         Top             =   315
         Width           =   810
      End
      Begin VB.TextBox Text1 
         Height          =   300
         Left            =   1275
         TabIndex        =   33
         Top             =   315
         Width           =   1905
      End
      Begin VB.Label Label10 
         Caption         =   "Result"
         Height          =   240
         Left            =   165
         TabIndex        =   32
         Top             =   780
         Width           =   1095
      End
      Begin VB.Label Label9 
         Caption         =   "Feature file"
         Height          =   240
         Left            =   150
         TabIndex        =   31
         Top             =   345
         Width           =   1095
      End
   End
   Begin VB.PictureBox Picture1 
      Height          =   4170
      Left            =   45
      ScaleHeight     =   4110
      ScaleWidth      =   4095
      TabIndex        =   28
      Top             =   5265
      Width           =   4155
   End
   Begin VB.Frame Frame1 
      Height          =   2175
      Left            =   4395
      TabIndex        =   21
      Top             =   4515
      Width           =   4110
      Begin VB.CommandButton Command10 
         Caption         =   "Store Bin"
         Height          =   345
         Left            =   2055
         TabIndex        =   27
         Top             =   1230
         Width           =   1695
      End
      Begin VB.CommandButton Command9 
         Caption         =   "Store Feature"
         Height          =   345
         Left            =   2055
         TabIndex        =   26
         Top             =   1695
         Width           =   1695
      End
      Begin VB.CommandButton Command8 
         Caption         =   "Store Image"
         Height          =   345
         Left            =   2055
         TabIndex        =   25
         Top             =   810
         Width           =   1695
      End
      Begin VB.CommandButton Command7 
         Caption         =   "Show Bin&&Fea"
         Height          =   495
         Left            =   105
         TabIndex        =   24
         Top             =   1515
         Width           =   1695
      End
      Begin VB.CommandButton Command6 
         Caption         =   "Show Image"
         Height          =   495
         Left            =   120
         TabIndex        =   23
         Top             =   825
         Width           =   1695
      End
      Begin VB.CommandButton Command5 
         Caption         =   "Catch Image and Get Feature"
         Height          =   420
         Left            =   150
         TabIndex        =   22
         Top             =   255
         Width           =   3780
      End
   End
   Begin MSComctlLib.Slider Brightness 
      Height          =   330
      Left            =   5700
      TabIndex        =   6
      Top             =   1035
      Width           =   2550
      _ExtentX        =   4498
      _ExtentY        =   582
      _Version        =   393216
   End
   Begin VB.CommandButton Command4 
      Caption         =   "AvzCloseDevice"
      Height          =   375
      Left            =   6705
      TabIndex        =   4
      Top             =   555
      Width           =   1695
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Command3"
      Height          =   3525
      Left            =   105
      TabIndex        =   3
      Top             =   1125
      Visible         =   0   'False
      Width           =   4125
   End
   Begin VB.CommandButton Command2 
      Caption         =   "AvzOpenDevice"
      Height          =   375
      Left            =   4455
      TabIndex        =   2
      Top             =   555
      Width           =   1695
   End
   Begin VB.ComboBox Combo1 
      Height          =   300
      Left            =   120
      TabIndex        =   1
      Top             =   600
      Width           =   4140
   End
   Begin VB.CommandButton Command1 
      Caption         =   "AvzFindDevice"
      Height          =   375
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   1695
   End
   Begin MSComctlLib.Slider Contrast 
      Height          =   330
      Left            =   5700
      TabIndex        =   8
      Top             =   1410
      Width           =   2550
      _ExtentX        =   4498
      _ExtentY        =   582
      _Version        =   393216
   End
   Begin MSComctlLib.Slider Hue 
      Height          =   330
      Left            =   5700
      TabIndex        =   10
      Top             =   1800
      Width           =   2550
      _ExtentX        =   4498
      _ExtentY        =   582
      _Version        =   393216
   End
   Begin MSComctlLib.Slider Saturation 
      Height          =   330
      Left            =   5700
      TabIndex        =   12
      Top             =   2175
      Width           =   2550
      _ExtentX        =   4498
      _ExtentY        =   582
      _Version        =   393216
   End
   Begin MSComctlLib.Slider Sharpness 
      Height          =   330
      Left            =   5700
      TabIndex        =   14
      Top             =   2535
      Width           =   2550
      _ExtentX        =   4498
      _ExtentY        =   582
      _Version        =   393216
   End
   Begin MSComctlLib.Slider Gama 
      Height          =   315
      Left            =   5700
      TabIndex        =   16
      Top             =   2895
      Width           =   2550
      _ExtentX        =   4498
      _ExtentY        =   556
      _Version        =   393216
   End
   Begin MSComctlLib.Slider WBalance 
      Height          =   330
      Left            =   5700
      TabIndex        =   18
      Top             =   3240
      Width           =   2550
      _ExtentX        =   4498
      _ExtentY        =   582
      _Version        =   393216
   End
   Begin MSComctlLib.Slider Exposure 
      Height          =   330
      Left            =   5700
      TabIndex        =   20
      Top             =   3615
      Width           =   2550
      _ExtentX        =   4498
      _ExtentY        =   582
      _Version        =   393216
   End
   Begin VB.Label Label8 
      Caption         =   "Exposure"
      Height          =   195
      Left            =   4470
      TabIndex        =   19
      Top             =   3720
      Width           =   1020
   End
   Begin VB.Label Label7 
      Caption         =   "W Balance"
      Height          =   195
      Left            =   4470
      TabIndex        =   17
      Top             =   3345
      Width           =   1020
   End
   Begin VB.Label Label6 
      Caption         =   "Gama"
      Height          =   195
      Left            =   4470
      TabIndex        =   15
      Top             =   2970
      Width           =   1020
   End
   Begin VB.Label Label5 
      Caption         =   "Sharpness"
      Height          =   195
      Left            =   4470
      TabIndex        =   13
      Top             =   2595
      Width           =   1020
   End
   Begin VB.Label Label4 
      Caption         =   "Saturation"
      Height          =   195
      Left            =   4470
      TabIndex        =   11
      Top             =   2250
      Width           =   1020
   End
   Begin VB.Label Label3 
      Caption         =   "Hue"
      Height          =   195
      Left            =   4485
      TabIndex        =   9
      Top             =   1875
      Width           =   1020
   End
   Begin VB.Label Label2 
      Caption         =   "Contrast"
      Height          =   195
      Left            =   4470
      TabIndex        =   7
      Top             =   1455
      Width           =   1020
   End
   Begin VB.Label Label1 
      Caption         =   "Brightness"
      Height          =   195
      Left            =   4470
      TabIndex        =   5
      Top             =   1095
      Width           =   1020
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim DF_BRIGHTNESS  As Integer
Dim DF_CONTRAST    As Integer
Dim DF_HUE         As Integer
Dim DF_SATURATION  As Integer
Dim DF_SHARPNESS   As Integer
Dim DF_GAMA        As Integer
Dim DF_WBALANCE    As Integer
Dim DF_EXPOSURE    As Integer

Dim MK_BRIGHTNESS  As Integer
Dim MK_CONTRAST    As Integer
Dim MK_HUE         As Integer
Dim MK_SATURATION  As Integer
Dim MK_SHARPNESS   As Integer
Dim MK_GAMA        As Integer
Dim MK_WBALANCE    As Integer
Dim MK_EXPOSURE    As Integer
Dim gpImageShow(78400)  As Byte
Dim gpImageProc(78400)  As Byte
Dim gpImageBin(78400)   As Byte
Dim gpFeature(256)          As Byte
Dim gpFeatureA(256)         As Byte
Dim gpFeatureB(256)         As Byte
Dim pFeaBuf1(2560000) As Byte
Dim pFeaBuf2(2560000) As Byte
Dim strFileList(10000) As String
Dim gpFingerNum As Long


Private Sub Command1_Click()
    Dim Buffer(128 * 8) As Byte
    Dim Buff(128) As Byte
    Dim n As Integer
    Dim strA As String

    AvzFindDevice (VarPtr(Buffer(0)))
    n = 0
    For i = 0 To 7
        For j = 0 To 127
            If (Buffer(i * 128 + j) <> 0) Then
                n = n + 1
            End If
            Buff(j) = Buffer(i * 128 + j)
        Next j
        strA = StrConv(Buff, vbUnicode)
        strA = Left$(strA, n)
        n = 0
        If Len(strA) > 0 Then
            Combo1.AddItem strA
        End If
    Next i
End Sub

Private Sub Command10_Click()
     Dim strA, strB As String
    
    Dim fileName() As Byte
    Dim byteq As Byte
    Dim n As Integer
    Dim FingerOn As Integer
    
    
    strB = "save2.bmp"
    fileName = Space$(256)
   
   
    Timer1.Enabled = False
    If Combo1.ListIndex <> -1 Then
    
        
        AvzGetImage Combo1.ListIndex, VarPtr(gpImageProc(0)), FingerOn
        If FingerOn = 1 Then
            result = AvzProcess(VarPtr(gpImageProc(0)), VarPtr(gpFeature(0)), VarPtr(gpImageBin(0)), True, True)
            fileName = StrConv(strB & Chr(0), vbFromUnicode)
            AvzSaveClrBMPFile VarPtr(fileName(0)), VarPtr(gpImageBin(0))
        End If
    End If
    Timer1.Enabled = True
End Sub

Private Sub Command11_Click()
    Dim fileName() As Byte
   
    fileName = Space$(256)
    CommonDialog1.Filter = "anv file(*.anv)|*.anv"
    CommonDialog1.ShowOpen
    Text1.Text = CommonDialog1.fileName

    AvzLoadFeature CommonDialog1.fileName, VarPtr(gpFeatureA(0)), VarPtr(gpFeatureA(0))

End Sub

Private Sub Command12_Click()
    Dim result As Integer
    result = AvzMatch(VarPtr(gpFeature(0)), VarPtr(gpFeatureA(0)), 3)
    If (result <> 0) Then
        result = AvzMatch(VarPtr(gpFeature(0)), VarPtr(gpFeatureB(0)), 3)
    End If
    If (result = 0) Then
        Text2.Text = "OK"
    Else
        Text2.Text = "FAIL"
    End If
End Sub

Private Sub Command13_Click()
    Dim strResFolder As String
    Dim tempFeatureA(256)         As Byte
    Dim tempFeatureB(256)         As Byte
    strResFolder = BrowseForFolder(HWND, "Select...")
    If strResFolder <> "" Then
       Text3.Text = strResFolder
    End If
    
  
    


    gpFingerNum = 0
    Set fso = CreateObject("Scripting.FileSystemObject")
    Set folder = fso.getFolder(Text3.Text)
    Set fold = folder.subfolders
    Set file = folder.Files
    For Each Files In file
        If InStr(Files.Name, ".anv") > 0 Then
            If (AvzLoadFeature(Text3.Text + "\" + Files.Name, VarPtr(tempFeatureA(0)), VarPtr(tempFeatureB(0))) = True) Then
                For i = 0 To 255
                    pFeaBuf1(gpFingerNum * 256 + i) = tempFeatureA(i)
                    pFeaBuf2(gpFingerNum * 256 + i) = tempFeatureB(i)
              
                Next i
                strFileList(gpFingerNum) = Files.Name
                gpFingerNum = gpFingerNum + 1
            End If
        End If
    Next
    Set fso = Nothing

End Sub

Private Sub Command14_Click()

    Dim ret As Integer
    

    ret = AvzMatchN(VarPtr(gpFeature(0)), VarPtr(pFeaBuf1(0)), gpFingerNum, 3)
  
    If ret >= 0 Then
        Text4.Text = strFileList(ret)
    Else
        Text4.Text = "All FAIL"
    End If
    
End Sub

Private Sub Command15_Click()
    Brightness.Value = DF_BRIGHTNESS
    Contrast.Value = DF_CONTRAST
    Hue.Value = DF_HUE
    Saturation.Value = DF_SATURATION
    Sharpness.Value = DF_SHARPNESS
    Gama.Value = DF_GAMA
    WBalance.Value = DF_WBALANCE
    Exposure.Value = DF_EXPOSURE
    
    ParaRefresh
End Sub

Private Sub Command16_Click()
    ParaRefresh
End Sub

Private Sub Command2_Click()
    If Combo1.ListIndex <> -1 Then
        Combo1.Enabled = False
        AvzOpenDevice Combo1.ListIndex, Command3.HWND
    End If
    Command15_Click
    Timer1.Enabled = True
End Sub

Private Sub Command4_Click()
    Timer1.Enabled = False
    If Combo1.ListIndex <> -1 Then
        Combo1.Enabled = True
        AvzCloseDevice Combo1.ListIndex
    End If
End Sub

Private Sub Command5_Click()
'    int result;
    Dim strA, strB As String
    
    Dim fileName() As Byte
    Dim byteq As Byte
    Dim n As Integer
    Dim FingerOn As Integer
    
    strA = "aa.bmp"
    strB = "bb.bmp"
    fileName = Space$(256)
   
   
    Timer1.Enabled = False
    If Combo1.ListIndex <> -1 Then
    
        fileName = StrConv(strA & Chr(0), vbFromUnicode)
        AvzGetImage Combo1.ListIndex, VarPtr(gpImageProc(0)), FingerOn
        If FingerOn = 1 Then
            AvzSaveHueBMPFile VarPtr(fileName(0)), VarPtr(gpImageProc(0))
            Picture2.Picture = LoadPicture(strA)
            result = AvzProcess(VarPtr(gpImageProc(0)), VarPtr(gpFeature(0)), VarPtr(gpImageBin(0)), True, True)
            fileName = StrConv(strB & Chr(0), vbFromUnicode)
            AvzSaveClrBMPFile VarPtr(fileName(0)), VarPtr(gpImageBin(0))
            Picture1.Picture = LoadPicture(strB)
        End If
    End If
    Timer1.Enabled = True
  
End Sub

Private Sub Command6_Click()
   Dim strA, strB As String
    
    Dim fileName() As Byte
    Dim byteq As Byte
    Dim n As Integer
    Dim FingerOn As Integer
    
    Timer1.Enabled = False
    strA = "aa.bmp"
    fileName = Space$(256)


    fileName = StrConv(strA & Chr(0), vbFromUnicode)

    If Combo1.ListIndex <> -1 Then
        AvzGetImage Combo1.ListIndex, VarPtr(gpImageProc(0)), FingerOn
        If FingerOn = 1 Then
            AvzSaveHueBMPFile VarPtr(fileName(0)), VarPtr(gpImageProc(0))
            Picture1.Picture = LoadPicture(strA)
        End If
    End If
    Timer1.Enabled = True
End Sub

Private Sub Command7_Click()
     Dim strA, strB As String
    
    Dim fileName() As Byte
    Dim byteq As Byte
    Dim n As Integer
    Dim FingerOn As Integer
    
    
    strA = "aa.bmp"
    strB = "bb.bmp"
    fileName = Space$(256)
   
   
    Timer1.Enabled = False
    If Combo1.ListIndex <> -1 Then
    
        fileName = StrConv(strA & Chr(0), vbFromUnicode)
        AvzGetImage Combo1.ListIndex, VarPtr(gpImageProc(0)), FingerOn
        If FingerOn = 1 Then
            result = AvzProcess(VarPtr(gpImageProc(0)), VarPtr(gpFeature(0)), VarPtr(gpImageBin(0)), True, True)
            fileName = StrConv(strB & Chr(0), vbFromUnicode)
            AvzSaveClrBMPFile VarPtr(fileName(0)), VarPtr(gpImageBin(0))
            Picture1.Picture = LoadPicture(strB)
        End If
    End If
    Timer1.Enabled = True
End Sub

Private Sub Command8_Click()
    Dim strA, strB As String
    
    Dim fileName() As Byte
    Dim byteq As Byte
    Dim n As Integer
    Dim FingerOn As Integer
    
    Timer1.Enabled = False
    strA = "save1.bmp"
    fileName = Space$(256)


    fileName = StrConv(strA & Chr(0), vbFromUnicode)

    If Combo1.ListIndex <> -1 Then
        AvzGetImage Combo1.ListIndex, VarPtr(gpImageProc(0)), FingerOn
        If FingerOn = 1 Then
            AvzSaveHueBMPFile VarPtr(fileName(0)), VarPtr(gpImageProc(0))
        End If
    End If
     Timer1.Enabled = True
End Sub

Private Sub Command9_Click()
    Dim pBuffer() As Byte
    ReDim pBuffer(500)
    Dim tempBuffer() As Byte
    
    uLen = AvzPackFeature(VarPtr(gpFeature(0)), VarPtr(gpFeature(0)), VarPtr(pBuffer(0)))
    
    ReDim tempBuffer(uLen - 1)
    
    If Dir("test.anv") <> "" Then Kill "test.anv"
    For i = 0 To uLen - 1
        tempBuffer(i) = pBuffer(i)
    Next i
    Dim WriteFileNo As Integer
    WriteFileNo = FreeFile
    Open "test.anv" For Binary As WriteFileNo
    Put #WriteFileNo, 1, tempBuffer
    Close WriteFileNo

End Sub

Private Sub Form_Load()
    DF_BRIGHTNESS = 0
    DF_CONTRAST = 50
    DF_HUE = 0
    DF_SATURATION = 0
    DF_SHARPNESS = 0
    DF_GAMA = 30
    DF_WBALANCE = 15
    DF_EXPOSURE = 30
    
    Brightness.Max = 100
    Brightness.Min = 0
    
    Contrast.Max = 100
    Contrast.Min = 0

    Hue.Min = 0
    Hue.Max = 100
    
    Saturation.Min = 0
    Saturation.Max = 100
    
    Sharpness.Min = 0
    Sharpness.Max = 100
    
    Gama.Max = 30
    Gama.Min = 10
   
    
    WBalance.Min = 4
    WBalance.Max = 24
    Exposure.Min = 0
    Exposure.Max = 100
    
    Brightness.Value = DF_BRIGHTNESS
    Contrast.Value = DF_CONTRAST
    Hue.Value = DF_HUE
    Saturation.Value = DF_SATURATION
    Sharpness.Value = DF_SHARPNESS
    Gama.Value = DF_GAMA
    WBalance.Value = DF_WBALANCE
    Exposure.Value = DF_EXPOSURE
    
    gpFingerNum = 0
End Sub
Private Sub ParaRefresh()
    MM_BRIGHTNESS = Brightness.Value
    MM_CONTRAST = Contrast.Value
    MM_HUE = Hue.Value
    MM_SATURATION = Saturation.Value
    MM_SHARPNESS = Sharpness.Value
    MM_GAMA = Gama.Value
    MM_WBALANCE = WBalance.Value
    MM_EXPOSURE = Exposure.Value
    If Combo1.ListIndex <> -1 Then
        AvzSetParm Combo1.ListIndex, MM_BRIGHTNESS, MM_CONTRAST, MM_HUE, MM_SATURATION, MM_SHARPNESS * 25, MM_GAMA, MM_WBALANCE * 500, MM_EXPOSURE
    End If
End Sub

Private Sub Form_Unload(Cancel As Integer)
 If Combo1.ListIndex <> -1 Then
        AvzCloseDevice Combo1.ListIndex
    End If
End Sub

Private Sub Timer1_Timer()
    Dim strA As String
    
    Dim fileName() As Byte
    Dim byteq As Byte
    Dim n As Integer
    Dim FingerOn As Integer
    
    Timer1.Enabled = False
    strA = "aa.bmp"
    fileName = Space$(256)


    fileName = StrConv(strA & Chr(0), vbFromUnicode)

    If Combo1.ListIndex <> -1 Then
        AvzGetImage Combo1.ListIndex, VarPtr(gpImageProc(0)), FingerOn
        If FingerOn = 1 Then
            AvzSaveHueBMPFile VarPtr(fileName(0)), VarPtr(gpImageProc(0))
            Picture2.Picture = LoadPicture(strA)
        End If
    End If
     Timer1.Enabled = True
End Sub
