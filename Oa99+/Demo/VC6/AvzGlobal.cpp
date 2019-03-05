#include "stdAfx.h"
#include "Protocol.h"

int nDevAddr = 0xFFFFFFFF;

BYTE gpImage[256 * 296];
BYTE gpBin[256 * 296];
BYTE gpFeature[256];
BYTE  gpFeatureA[256];//从文件取得的特征值
BYTE  gpFeatureB[256];//从文件取得的特征值
