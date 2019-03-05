unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, FileCtrl;

type
  TForm1 = class(TForm)
    Button1: TButton;
    ComboBox1: TComboBox;
    Panel1: TPanel;
    Button2: TButton;
    Button3: TButton;
    Panel2: TPanel;
    Panel3: TPanel;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Panel4: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    EDIT_FEA_File: TEdit;
    Button9: TButton;
    Label2: TLabel;
    EDIT_FEA_Result: TEdit;
    Button10: TButton;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    EDIT_FEA_Path: TEdit;
    Button11: TButton;
    EDIT_FEA_Result2: TEdit;
    Button12: TButton;
    Panel5: TPanel;
    TrackBar1: TTrackBar;
    Label5: TLabel;
    Edit1: TEdit;
    Label6: TLabel;
    TrackBar2: TTrackBar;
    Edit2: TEdit;
    Label7: TLabel;
    TrackBar3: TTrackBar;
    Edit3: TEdit;
    Label8: TLabel;
    TrackBar4: TTrackBar;
    Edit4: TEdit;
    Label9: TLabel;
    TrackBar5: TTrackBar;
    Edit5: TEdit;
    Label10: TLabel;
    TrackBar6: TTrackBar;
    Edit6: TEdit;
    Label11: TLabel;
    TrackBar7: TTrackBar;
    Edit7: TEdit;
    Label12: TLabel;
    TrackBar8: TTrackBar;
    Edit8: TEdit;
    Button13: TButton;
    Image1: TImage;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    Label14: TLabel;
    EDIT_FEA_Count: TEdit;
    Label15: TLabel;
    EDIT_FEA_Time: TEdit;
    Timer1: TTimer;
    Panel6: TPanel;
    Image2: TImage;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
    procedure TrackBar3Change(Sender: TObject);
    procedure TrackBar4Change(Sender: TObject);
    procedure TrackBar5Change(Sender: TObject);
    procedure TrackBar6Change(Sender: TObject);
    procedure TrackBar7Change(Sender: TObject);
    procedure TrackBar8Change(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    BitMap1:TBitmap;
    Procedure ParaRefresh;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  AppPath:String;

implementation

uses AvzScanner;

{$R *.dfm}

Procedure TForm1.ParaRefresh;
var m_brightness,m_contrast,m_hue,m_saturation,m_sharpness,m_gama,m_wbalance,m_exposure:Word;
begin
    m_brightness := TrackBar1.Position;
	m_contrast := TrackBar2.Position;
	m_hue := TrackBar3.Position;
	m_saturation := TrackBar4.Position;
	m_sharpness := TrackBar5.Position * 25;
	m_gama := TrackBar6.Position;
	m_wbalance := TrackBar7.Position * 500;
	m_exposure := TrackBar8.Position;

	AvzSetParm(ComboBox1.ItemIndex,
					m_brightness, m_contrast,
					m_hue, m_saturation,
					m_sharpness, m_gama,
					m_wbalance, m_exposure);
end;

procedure TForm1.Button1Click(Sender: TObject);
var ret:SmallInt;
    P:ScannerName;
    I,J:Integer;
    tmpS:String;
begin
    ComboBox1.Items.Clear;
    FillChar(P,Sizeof(P),Char(0));
    ret:=AvzFindDevice(P);
    for I:=0 to ret-1 do
    begin
        tmpS:='';
        for J:=0 to 127 do
        begin
            if P[I,J]=Char(0) then Break
            else tmpS:=tmpS+P[I,J];
        end;
        ComboBox1.Items.Add(tmpS);
    end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var ret:Integer;
    Hwnd:THandle;
begin
    if ComboBox1.ItemIndex<0 then Exit;
    Hwnd:=Panel1.Handle;
    ret:=AvzOpenDevice(ComboBox1.ItemIndex,Hwnd);
    if ret=-1 then Showmessage('AvzOpenDevice fail')
    else begin
        Button2.Enabled:=False;
        Button3.Enabled:=True;
        Button1.Enabled:=False;

        ComboBox1.Enabled:=False;
        gbValidScanner:=True;

        Button13.Click;

        Panel3.Enabled:=True;
        Panel5.Enabled:=True;
    end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
    gbValidScanner:=False;

    AvzCloseDevice(ComboBox1.ItemIndex);
    Button2.Enabled:=True;
    Button3.Enabled:=False;
    Button1.Enabled:=True;
    ComboBox1.Enabled:=True;

    Panel3.Enabled:=False;
    Panel4.Enabled:=False;
    Panel5.Enabled:=False;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    if Button3.Enabled then Button3.Click;
    BitMap1.FreeImage;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
    Apppath:=ExtractFilepath(Application.Exename);
    if Apppath[length(apppath)] <> '\' then Apppath:=Apppath+'\';

    gbValidScanner:=False;

    BitMap1:=Tbitmap.Create;
    Bitmap1.Width:=200;
    Bitmap1.Height:=260;
    Bitmap1.PixelFormat:=pf8bit;
    Bitmap1.Palette:=Image1.Picture.Bitmap.Palette;
    Image1.Picture.Bitmap:=nil;
end;

procedure TForm1.Button13Click(Sender: TObject);
begin
    TrackBar1.Position:=DF_BRIGHTNESS;
    TrackBar2.Position:=DF_CONTRAST;
    TrackBar3.Position:=DF_HUE;
    TrackBar4.Position:=DF_SATURATION;
    TrackBar5.Position:=DF_SHARPNESS;
    TrackBar6.Position:=DF_GAMA;
    TrackBar7.Position:=DF_WBALANCE;
    TrackBar8.Position:=DF_EXPOSURE;

    ParaRefresh;
end;

procedure TForm1.TrackBar1Change(Sender: TObject);
begin
    Edit1.Text:=Inttostr(TrackBar1.Position);
    Update;
    ParaRefresh;
end;

procedure TForm1.TrackBar2Change(Sender: TObject);
begin
    Edit2.Text:=Inttostr(TrackBar2.Position);
    Update;
    ParaRefresh;
end;

procedure TForm1.TrackBar3Change(Sender: TObject);
begin
    Edit3.Text:=Inttostr(TrackBar3.Position);
    Update;
    ParaRefresh;
end;

procedure TForm1.TrackBar4Change(Sender: TObject);
begin
    Edit4.Text:=Inttostr(TrackBar4.Position);
    Update;
    ParaRefresh;
end;

procedure TForm1.TrackBar5Change(Sender: TObject);
begin
    Edit5.Text:=Inttostr(TrackBar5.Position);
    Update;
    ParaRefresh;
end;

procedure TForm1.TrackBar6Change(Sender: TObject);
begin
    Edit6.Text:=Inttostr(TrackBar6.Position);
    Update;
    ParaRefresh;
end;

procedure TForm1.TrackBar7Change(Sender: TObject);
begin
    Edit7.Text:=Inttostr(TrackBar7.Position);
    Update;
    ParaRefresh;
end;

procedure TForm1.TrackBar8Change(Sender: TObject);
begin
    Edit8.Text:=Inttostr(TrackBar8.Position);
    Update;
    ParaRefresh;   
end;

procedure TForm1.Button4Click(Sender: TObject);
var ret:Integer;
    FileName:String;
    FingerOn:SmallInt;
begin
	AvzGetRawImage(ComboBox1.ItemIndex,ImageShow,FingerOn);
    if FingerOn=0 then
    begin
        Showmessage('No finger is on sensor.');
        Exit;
    end;
    AvzShowImage(Bitmap1.Canvas.Handle ,ImageShow,0,0,200,260,0,18,200,260);
    Image1.Picture.Bitmap:=BitMap1;

	ret := AvzProcess(ImageShow,pFeature,ImageBin,TRUE,TRUE);
    if ret=0 then Panel4.Enabled:=True
    else Panel4.Enabled:=False;
end;

procedure TForm1.Button7Click(Sender: TObject);
var FileName:String;
begin
    FileName:=AppPath+'Temp.bmp';
    AvzSaveClrBMPFile(Pchar(FileName),ImageBin);
    Image1.Picture.LoadFromFile(FileName);
end;

procedure TForm1.Button5Click(Sender: TObject);
var FileName:String;
begin
    FileName:=AppPath+'Temp.bmp';
    AvzSaveHueBMPFile(Pchar(FileName),ImageShow);
    Image1.Picture.LoadFromFile(FileName);
end;

procedure TForm1.Button8Click(Sender: TObject);
var FileName:String;
begin
    Savedialog1.Filter:='BMP files (*.bmp)|*.bmp';
    if not Savedialog1.Execute then exit;
    FileName:=Savedialog1.FileName;

    if ExtractFileExt(FileName) <> '.bmp' then FileName:=ChangeFileExt(FileName,'.bmp');
    AvzSaveHueBMPFile(PChar(FileName),ImageProc);
end;

procedure TForm1.Button6Click(Sender: TObject);
var FileName:String;
    ret:Integer;
    Fs:TFileStream;
begin
    Savedialog1.Filter:='Anviz files (*.anv)|*.anv';
    if not Savedialog1.Execute then exit;
    FileName:=Savedialog1.FileName;

    if ExtractFileExt(FileName) <> '.anv' then FileName:=ChangeFileExt(FileName,'.anv');

    ret:=AvzPackFeature(pFeature,pFeature,pFeatureBuf);
    Fs :=TFileStream.Create(FileName,fmCreate or fmShareDenyNone);
    Fs.Seek(0,soFromBeginning);
    Fs.WriteBuffer(pFeatureBuf,ret);
    Fs.Destroy;
end;

procedure TForm1.Button9Click(Sender: TObject);
var FileName:String;
begin
    OpenDialog1.Filter:='Anviz files (*.anv)|*.anv';
    if not OpenDialog1.Execute then Exit;
    FileName:=OpenDialog1.FileName;

    if not AvzLoadFeature(Pchar(FileName),pFeatureA,pFeatureB) then
    begin
        Button10.Enabled:=False;
        Exit;
    end;

    EDIT_FEA_File.Text:=FileName;
    Button10.Enabled:=True;
end;

procedure TForm1.Button10Click(Sender: TObject);
var ret:Integer;
begin
    ret:=AvzMatch(pFeature,pFeatureA,3);
    if ret=0 then EDIT_FEA_Result.Text:='Succ'
    else EDIT_FEA_Result.Text:='Fail';
end;

procedure TForm1.Button11Click(Sender: TObject);
var Dir:String;
    I:Integer;
    SFile,TempF,TempPath:String;
    FileSearch: TSearchRec;
    FileAttrs: Integer;
begin
    Dir:=AppPath+'Template';
    if not SelectDirectory('Folder:','',Dir) then Exit;

    Timer1.Enabled:=False;
    EDIT_FEA_Path.Text:=Dir;

    pFeatureNum:=0;

    FileAttrs:=faArchive;
    TempF:=Dir+'\*.anv';
    TempPath:=Dir+'\';
    if FindFirst(TempF, FileAttrs, FileSearch) = 0 then
    begin
        sFile:=TempPath+Filesearch.Name;
        if AvzLoadFeature(Pchar(sFile),pFeatureA,pFeatureB) then
        begin
            for I:=0 to 255 do pFeatureLib1[pFeatureNum,I]:=pFeatureA[I];
            for I:=0 to 255 do pFeatureLib2[pFeatureNum,I]:=pFeatureB[I];

            PFileName[pFeatureNum]:=Filesearch.Name;
            Inc(pFeatureNum);
        end;

        while FindNext(FileSearch) = 0 do
        begin
            Application.ProcessMessages;
            Sleep(1);
            sFile:=TempPath+Filesearch.Name;
            if AvzLoadFeature(PChar(sFile),pFeatureA,pFeatureB) then
            begin
                if pFeatureNum=10000 then
                begin
                    FindClose(FileSearch);
                    Break;
                end;
                for I:=0 to 255 do pFeatureLib1[pFeatureNum,I]:=pFeatureA[I];
                for I:=0 to 255 do pFeatureLib2[pFeatureNum,I]:=pFeatureB[I];

                PFileName[pFeatureNum]:=Filesearch.Name;
                Inc(pFeatureNum);
            end;
        end;
        FindClose(FileSearch);
    end;
    EDIT_FEA_Count.Text:=Inttostr(pFeatureNum);
    if pFeatureNum>0 then Button12.Enabled:=True
    else Button12.Enabled:=False;
    
    Timer1.Enabled:=True;
end;

procedure TForm1.Button12Click(Sender: TObject);
var ret:Integer;
    STime,ETime:DWord;
begin
    EDIT_FEA_Result2.Text:='';
    EDIT_FEA_Time.Text:='';
    Form1.Update;
    
    STime:=GetTickCount;
    ret:=AvzMatchN(pFeature,pFeatureLib1,pFeatureNum,3);
    ETime:=GetTickCount;
    if ret<0 then
    begin
        STime:=GetTickCount;
        ret:=AvzMatchN(pFeature,pFeatureLib2,pFeatureNum,3);
        ETime:=GetTickCount;
    end;

    if ret>=0 then EDIT_FEA_Result2.Text:=PFileName[ret]
    else EDIT_FEA_Result2.Text:='All fail';

    EDIT_FEA_Time.Text:=Inttostr(ETime-STime);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var ret:Integer;
    FileName:String;

    FingerOn:SmallInt;

    Hwnd:THandle;
begin
    if not gbValidScanner then exit;
    Timer1.Enabled:=False;

	AvzGetRawImage(ComboBox1.ItemIndex,ImageShow,FingerOn);
    if FingerOn=0 then
    begin
        Timer1.Enabled:=True;
        Exit;
    end;
    AvzShowImage(Bitmap1.Canvas.Handle ,ImageShow,0,0,200,260,0,18,200,260);
    Image2.Picture.Bitmap:=BitMap1;

	ret := AvzProcess(ImageShow,pFeature,ImageBin,TRUE,TRUE);
    if ret<>0 then Image2.Picture := nil;
    
    Timer1.Enabled:=True;
end;

end.
