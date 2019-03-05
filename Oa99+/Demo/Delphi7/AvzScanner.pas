unit AvzScanner;

interface

Uses SysUtils, Classes,Windows;

const
    CAMERA_MAX_NUM:Integer = 8;
    FEATURE_SIZE  :Integer =169;

    DF_BRIGHTNESS:Word     = 0;
    DF_CONTRAST	 :Word     = 50;
    DF_HUE		 :Word     = 0;
    DF_SATURATION:Word     = 0;
    DF_SHARPNESS :Word     = 0;
    DF_GAMA		 :Word     = 30;
    DF_WBALANCE	 :Word     = 15;
    DF_EXPOSURE	 :Word     = 30;

type ScannerName=Array[0..7,0..127] of Char;
type gpImage=Array[0..256*296-1] of Byte;
type gpFeature=Array[0..255] of Byte;
type gpFeatureBuf=Array[0..511] of Byte;
type gpFeatureLib=Array[0..9999,0..255] of Byte;

var
    gbValidScanner:Boolean;
    ImageShow:gpImage;
    ImageProc:gpImage;
    ImageBin:gpImage;

    pFeature:gpFeature;
    pFeatureA:gpFeature;
    pFeatureB:gpFeature;
    pFeatureBuf:gpFeatureBuf;
    pFeatureLib1:gpFeatureLib;
    pFeatureLib2:gpFeatureLib;
    pFeatureNum:Integer;
    PFileName:Array[0..9999] of String;

//�����ɼ���
function AvzFindDevice(var PScannerName:ScannerName):SmallInt;stdcall; external 'AvzScanner.dll' ;

//�򿪲ɼ���
function AvzOpenDevice(uDeviceID:SmallInt;HWND:THandle):Integer;stdcall; external 'AvzScanner.dll' ;

//�رղɼ���
procedure AvzCloseDevice(uDeviceID:SmallInt);stdcall; external 'AvzScanner.dll' ;

//���ò���
procedure AvzSetParm(uDeviceID,uBrightness,uContrast,uHue,uSaturation,uSharpness,uGama,uWBalance,uExposure:SmallInt);stdcall; external 'AvzScanner.dll' ;

//��ȡͼ��
procedure AvzGetImage(uDeviceID:SmallInt;var pImageproc:gpImage;var FingerOn:SmallInt);stdcall; external 'AvzScanner.dll' ;
procedure AvzGetRawImage(uDeviceID:SmallInt;var pImageproc:gpImage;var FingerOn:SmallInt);stdcall; external 'AvzScanner.dll' ;

//void WINAPI AvzShowImage (HDC hdcDest, BYTE *pImage,int nXOriginDest, int nYOriginDest, int nWidthDest, int nHeighDest,int nXOriginSrc, int nYOriginSrc, int nWidthSrc, int nHeightSrc)
procedure AvzShowImage(hdcDest:Hwnd;pImageproc:gpImage;nXOriginDest,nYOriginDest,nWidthDest,nHeighDest,nXOriginSrc,nYOriginSrc,nWidthSrc,nHeightSrc:Integer);stdcall; external 'AvzScanner.dll' ;

//����ԭBmpͼ��
procedure AvzSaveHueBMPFile(const FileName:PChar;const pImage:gpImage);stdcall; external 'AvzScanner.dll' ;

//��������Bmpͼ��
procedure AvzSaveClrBMPFile(const FileName:PChar;const pImage:gpImage);stdcall; external 'AvzScanner.dll' ;

//��װָ��ģ��
function AvzPackFeature(const pFeature1:gpFeature;const pFeature2:gpFeature;var pFeatureBuf:gpFeatureBuf):SmallInt;stdcall; external 'AvzScanner.dll' ;

//���ָ��ģ�� 
function AvzUnpackFeature(const pFeatureBuf:gpFeatureBuf;var pFeature1:gpFeature;var pFeature2:gpFeature):SmallInt;stdcall; external 'AvzScanner.dll' ;

//�������ָ��ͼ��������ȡ����ֵ
function AvzProcess(const pImageproc:gpImage;var pFeature:gpFeature;var pImageBin:gpImage;bthin:Boolean;bdrawfea:Boolean):SmallInt;stdcall; external 'AvzScanner.dll' ;

//1:1�ȶ�ָ��
function AvzMatch(pFeature1:gpFeature;pFeature2:gpFeature;level:SmallInt):SmallInt;stdcall; external 'AvzScanner.dll' ;

//1:N�ȶ�ָ��
function AvzMatchN(pFeature:gpFeature;pFeatureLib:gpFeatureLib;FingerNum:SmallInt;level:SmallInt):SmallInt;stdcall; external 'AvzScanner.dll' ;

//����ģ���ļ�
procedure AvzSaveFeatureFile(const FileName:PChar;const pFeature:gpFeature);

//װ��ģ��
function AvzLoadFeature(const FileName:PChar;var pFeature1:gpFeature;var pFeature2:gpFeature):Boolean;

implementation

procedure AvzSaveFeatureFile(const FileName:PChar;const pFeature:gpFeature);
var I,J,Tmp,SumValue:Integer;
    FS:TMemoryStream;
begin
    Fs:=TMemoryStream.Create;

    for I:=1 to 2 do
    begin
        SumValue:=0;

        Tmp:=$C0;
        Fs.WriteBuffer(Tmp,1);

        if I=2 then Tmp:=8
        else Tmp:=2;
        Fs.WriteBuffer(Tmp,1);
        SumValue:=SumValue+Tmp;
        Tmp:=0;
        Fs.WriteBuffer(Tmp,1);
        Fs.WriteBuffer(Tmp,1);
        Fs.WriteBuffer(Tmp,1);
        Fs.WriteBuffer(Tmp,1);
        Fs.WriteBuffer(Tmp,1);
        Tmp:=169;
        Fs.WriteBuffer(Tmp,1);
        SumValue:=SumValue+Tmp;

        for J:=0 to 168 do
        begin
            Tmp:=pFeature[J];
            SumValue:=SumValue+Tmp;

            if Tmp=$C0 then
            begin
                Tmp:=$DB;
                Fs.WriteBuffer(Tmp,1);
                Tmp:=$DC;
                Fs.WriteBuffer(Tmp,1);
            end else if Tmp=$DB then
            begin
                Fs.WriteBuffer(Tmp,1);
                Tmp:=$DD;
                Fs.WriteBuffer(Tmp,1);
            end else begin
                Fs.WriteBuffer(Tmp,1);
            end;
        end;
        //У���
        Tmp:=SumValue div 256;
        if Tmp=$C0 then
        begin
            Tmp:=$DB;
            Fs.WriteBuffer(Tmp,1);
            Tmp:=$DC;
            Fs.WriteBuffer(Tmp,1);
        end else if Tmp=$DB then
        begin
            Fs.WriteBuffer(Tmp,1);
            Tmp:=$DD;
            Fs.WriteBuffer(Tmp,1);
        end else begin
            Fs.WriteBuffer(Tmp,1);
        end;
        Tmp:=SumValue mod 256;
        if Tmp=$C0 then
        begin
            Tmp:=$DB;
            Fs.WriteBuffer(Tmp,1);
            Tmp:=$DC;
            Fs.WriteBuffer(Tmp,1);
        end else if Tmp=$DB then
        begin
            Fs.WriteBuffer(Tmp,1);
            Tmp:=$DD;
            Fs.WriteBuffer(Tmp,1);
        end else begin
            Fs.WriteBuffer(Tmp,1);
        end;

        Tmp:=$C0;
        Fs.WriteBuffer(Tmp,1);
    end;

    Fs.SaveToFile(FileName);
    Fs.Destroy;
end;

function AvzLoadFeature(const FileName:PChar;var pFeature1:gpFeature;var pFeature2:gpFeature):Boolean;
var FileSize:LongInt;
    FS:TMemoryStream;

    ret:Integer;
    FeatureInfo:gpFeatureBuf;
begin
    FS:=TMemoryStream.Create;
    FS.LoadFromFile(FileName);
    Fs.Seek(0, soFromBeginning);
    FileSize:=FS.Size;

    FS.ReadBuffer(FeatureInfo,FileSize);

    ret:=AvzUnpackFeature(FeatureInfo,pFeature1,pFeature2);
    if ret=0 then Result:=True
    else Result:=False;

    FS.Destroy;
end;

end.
