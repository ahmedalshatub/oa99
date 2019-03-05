#ifndef _AVZ_SCANNER_H_
#define _AVZ_SCANNER_H_

#define CAMERA_MAX_NUM   5

#define STATUS_COMMON		0
#define STATUS_FINGER_ON	1

unsigned short WINAPI AvzFindDevice(char pDeviceName[CAMERA_MAX_NUM][128]);
long WINAPI AvzOpenDevice (unsigned short uDeviceID, HWND hWnd);
long WINAPI AvzCloseDevice (unsigned short uDeviceID);
long WINAPI AvzGetID (WORD wDeviceID, unsigned char *pID);
long WINAPI AvzOpenLED(unsigned short uDeviceID);
long WINAPI AvzCloseLED(unsigned short uDeviceID);
void WINAPI AvzSetParm (unsigned short uDeviceID,
			    unsigned short uBrightness, unsigned short uContrast,
				unsigned short uHue, unsigned short uSaturation,
				unsigned short uSharpness, unsigned short uGama,
				unsigned short uWBalance, unsigned short uExposure);
void WINAPI AvzGetImage (WORD wDeviceID, BYTE *pImage, WORD &uStatus);
void WINAPI AvzGetRawImage (WORD wDeviceID, BYTE *pImage, WORD &uStatus);
unsigned short WINAPI AvzPackFeature (unsigned char *pFeature1, unsigned char *pFeature2, unsigned char *pPackFeature);
unsigned short WINAPI AvzUnpackFeature (unsigned char *pPackFeature, unsigned char *pFeature1, unsigned char *pFeature2);

void WINAPI AvzSaveHueBMPFile (char *strFIleName, unsigned char *pImage);
void WINAPI AvzSaveClrBMPFile (char *strFIleName, unsigned char *pImage);
short WINAPI AvzProcess (unsigned char *pimagein, 
				   unsigned char *feature,
				   unsigned char *pimagebin,
				   unsigned char bthin,
				   unsigned char bdrawfea);
/*
	说明：
		对输入的指纹图像数据提取特征值
	输入
		pimagein  输入的指纹图像数据
				  宽度256, 高度296, 数据按行顺序排列, 每个像素用1字节表示灰度
		feature   生成的指纹特征值
				  256非符号字节的数组
		pimagebin 生成的二值化图像数据
				  宽度256, 高度296, 数据按行顺序排列, 每个像素用0和255表示灰度
		bthin	  1-pimagebin将绘出细化图像
				  0-pimagebin绘出细化前图像
		bdrawfea  1-pimagebin将绘出特征点信息
				  0-pimagebin不绘出特征点信息
	输出
		无
	返回：
		0,提取成功
		1,提取失败
		2,系统错误
*/

short WINAPI AvzMatch (unsigned char *feature1, 
  				 unsigned char *feature2, 
				 unsigned short level);
/*
	说明：
		对输入的两个指纹特征值进行比对
	输入
		feature1 指纹特征值1
		feature2 指纹特征值2
		level    匹配等级(0-9)
	输出
		无
	返回：
		0,匹配成功
		1,匹配失败
		2,系统错误
*/

short WINAPI AvzMatchN (unsigned char *featurein, 
  				  unsigned char featurelib[][256], 
				  unsigned short fingernum,
				  unsigned short level);
/*
	说明：
		对输入的指纹特征值与指纹库内特征值进行快速1:N比对
	输入
		featurein  需比对的特征值
		featurelib 指纹特征值库数组
		fingernum  指纹库指纹数, 1-20000
		level    匹配等级(0-9)
	输出
		无
	返回：
		-1:   匹配不成功,
		-2:   系统错误
		其它: 匹配成功的指纹库内指纹下标
		
*/

#endif
