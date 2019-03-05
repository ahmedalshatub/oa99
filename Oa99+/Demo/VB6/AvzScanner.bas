Attribute VB_Name = "Module1"
'搜索采集仪
Public Declare Function AvzFindDevice Lib "AvzScanner.dll" (ByVal lpBuffer As Long) As Integer
'打开采集仪
Public Declare Function AvzOpenDevice Lib "AvzScanner.dll" (ByVal uDeviceID As Integer, ByVal HWND As Long) As Integer
'关闭采集仪
Public Declare Sub AvzCloseDevice Lib "AvzScanner.dll" (ByVal uDeviceID As Integer)
'设置参数
Public Declare Sub AvzSetParm Lib "AvzScanner.dll" (ByVal uDeviceID As Integer, ByVal uBrightness As Integer, ByVal uContrast As Integer, uHue As Integer, ByVal uSaturation As Integer, ByVal uSharpness As Integer, ByVal uGama As Integer, ByVal uWBalance As Integer, ByVal uExposure As Integer)
'获取图像
Public Declare Sub AvzGetImage Lib "AvzScanner.dll" (ByVal uDeviceID As Integer, ByVal lpBufferImage As Long, ByRef bFingerOn As Integer)
'保存原Bmp图像
Public Declare Sub AvzSaveHueBMPFile Lib "AvzScanner.dll" (ByVal strFile As Long, ByVal lpBufferImage As Long)
'保存特征Bmp图像
Public Declare Sub AvzSaveClrBMPFile Lib "AvzScanner.dll" (ByVal strFile As Long, ByVal lpBufferImage As Long)
'对输入的指纹图像数据提取特征值
Public Declare Function AvzProcess Lib "AvzScanner.dll" (ByVal lpBufferImage As Long, ByVal pFeature As Long, ByVal lpBufferBinImage As Long, ByVal bthin As Boolean, ByVal bdrawfea As Boolean) As Integer


'1:1比对指纹
Public Declare Function AvzMatch Lib "AvzScanner.dll" (ByVal pFeature As Long, ByVal pFeatureLib As Long, ByVal level As Integer) As Integer
'1:N比对指纹
Public Declare Function AvzMatchN Lib "AvzScanner.dll" (ByVal pFeature As Long, ByVal pFeatureLib As Long, ByVal FingerNum As Integer, ByVal level As Integer) As Integer
'保存模板文件
Public Declare Sub AvzSaveFeatureFile Lib "AvzScanner.dll" (ByVal strFile As Long, ByVal pFeature1 As Long)
'封装指纹模板
Public Declare Function AvzPackFeature Lib "AvzScanner.dll" (ByVal pFeature1 As Long, ByVal pFeature2 As Long, ByVal gpFeatureBuf As Long) As Integer
'解包指纹模板
Public Declare Function AvzUnpackFeature Lib "AvzScanner.dll" (ByVal gpFeatureBuf As Long, ByVal pFeature1 As Long, ByVal pFeature2 As Long) As Integer

Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
Public Type BrowseInfo
     hwndOwner As Long
     pIDLRoot As Long
     pszDisplayName As Long
     lpszTitle As Long
     ulFlags As Long
     lpfnCallback As Long
     lParam As Long
     iImage As Long
End Type

Public Const BIF_RETURNONLYFSDIRS = 1
Public Const MAX_PATH = 260

Public Declare Sub CoTaskMemFree Lib "ole32.dll" (ByVal hMem As Long)
Public Declare Function lstrcat Lib "kernel32" Alias "lstrcatA" (ByVal lpString1 As String, ByVal lpString2 As String) As Long
Public Declare Function SHBrowseForFolder Lib "shell32" (lpbi As BrowseInfo) As Long
Public Declare Function SHGetPathFromIDList Lib "shell32" (ByVal pidList As Long, ByVal lpBuffer As String) As Long


Function AvzLoadFeature(ByVal strFile As String, ByVal pFeature1 As Long, ByVal pFeature2 As Long) As Boolean


    Dim CodeData_Cp As Double
    Dim FileLength As Double
    Dim FileNum As Integer
    Dim CodeData(512) As Byte
    
    FileNum = FreeFile
    FileLength = FileLen(strFile)
    Open strFile For Binary As FileNum
    For CodeData_Cp = 1 To FileLength
            DoEvents
            Get #FileNum, CodeData_Cp, CodeData(CodeData_Cp - 1)
    Next CodeData_Cp
    Close FileNum
        
    If AvzUnpackFeature(VarPtr(CodeData(0)), pFeature1, pFeature2) = 0 Then
        AvzLoadFeature = True
    Else
        AvzLoadFeature = False
    End If
    
End Function
  
Public Function BrowseForFolder(hwndOwner As Long, sPrompt As String) As String
     
    
     Dim iNull As Integer
     Dim lpIDList As Long
     Dim lResult As Long
     Dim sPath As String
     Dim udtBI As BrowseInfo

   
     With udtBI
        .hwndOwner = hwndOwner
        .lpszTitle = lstrcat(sPrompt, "")
        .ulFlags = BIF_RETURNONLYFSDIRS
     End With

     lpIDList = SHBrowseForFolder(udtBI)
   
    If lpIDList Then
        sPath = String$(MAX_PATH, 0)
        lResult = SHGetPathFromIDList(lpIDList, sPath)
        Call CoTaskMemFree(lpIDList)
        iNull = InStr(sPath, vbNullChar)
        If iNull Then sPath = Left$(sPath, iNull - 1)
     End If
     BrowseForFolder = sPath

End Function


