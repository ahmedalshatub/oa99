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
	˵����
		�������ָ��ͼ��������ȡ����ֵ
	����
		pimagein  �����ָ��ͼ������
				  ���256, �߶�296, ���ݰ���˳������, ÿ��������1�ֽڱ�ʾ�Ҷ�
		feature   ���ɵ�ָ������ֵ
				  256�Ƿ����ֽڵ�����
		pimagebin ���ɵĶ�ֵ��ͼ������
				  ���256, �߶�296, ���ݰ���˳������, ÿ��������0��255��ʾ�Ҷ�
		bthin	  1-pimagebin�����ϸ��ͼ��
				  0-pimagebin���ϸ��ǰͼ��
		bdrawfea  1-pimagebin�������������Ϣ
				  0-pimagebin�������������Ϣ
	���
		��
	���أ�
		0,��ȡ�ɹ�
		1,��ȡʧ��
		2,ϵͳ����
*/

short WINAPI AvzMatch (unsigned char *feature1, 
  				 unsigned char *feature2, 
				 unsigned short level);
/*
	˵����
		�����������ָ������ֵ���бȶ�
	����
		feature1 ָ������ֵ1
		feature2 ָ������ֵ2
		level    ƥ��ȼ�(0-9)
	���
		��
	���أ�
		0,ƥ��ɹ�
		1,ƥ��ʧ��
		2,ϵͳ����
*/

short WINAPI AvzMatchN (unsigned char *featurein, 
  				  unsigned char featurelib[][256], 
				  unsigned short fingernum,
				  unsigned short level);
/*
	˵����
		�������ָ������ֵ��ָ�ƿ�������ֵ���п���1:N�ȶ�
	����
		featurein  ��ȶԵ�����ֵ
		featurelib ָ������ֵ������
		fingernum  ָ�ƿ�ָ����, 1-20000
		level    ƥ��ȼ�(0-9)
	���
		��
	���أ�
		-1:   ƥ�䲻�ɹ�,
		-2:   ϵͳ����
		����: ƥ��ɹ���ָ�ƿ���ָ���±�
		
*/

#endif
