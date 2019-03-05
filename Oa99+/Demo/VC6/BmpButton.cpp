// BmpButton.cpp : implementation file
//

#include "stdafx.h"
#include "OA99_PLUS_DEMO.h"
#include "BmpButton.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CBmpButton

CBmpButton::CBmpButton()
{	
	m_pImage=NULL;
	m_pBmi=(LPBITMAPINFO)new BYTE[sizeof(BITMAPINFOHEADER)+sizeof(RGBQUAD)*256];	
}

CBmpButton::~CBmpButton()
{
}


BEGIN_MESSAGE_MAP(CBmpButton, CButton)
	//{{AFX_MSG_MAP(CBmpButton)
	ON_WM_CREATE()
	ON_WM_DESTROY()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CBmpButton message handlers

void CBmpButton::DrawItem(LPDRAWITEMSTRUCT lpDrawItemStruct) 
{

	//int i;
	CDC *pDC=CDC::FromHandle(lpDrawItemStruct->hDC);
	ASSERT_VALID(pDC);
	CRect rect=lpDrawItemStruct->rcItem;	

	m_pBmi->bmiHeader.biSize=40L;
	m_pBmi->bmiHeader.biWidth=m_dwWidth;
	m_pBmi->bmiHeader.biHeight=m_dwHeight;
	m_pBmi->bmiHeader.biPlanes=1L;
	m_pBmi->bmiHeader.biBitCount=8L;
	m_pBmi->bmiHeader.biCompression=0L;
	m_pBmi->bmiHeader.biSizeImage=(long)(m_dwWidth*m_dwHeight);
	m_pBmi->bmiHeader.biXPelsPerMeter=0xbc;
	m_pBmi->bmiHeader.biYPelsPerMeter=0xbc;
	m_pBmi->bmiHeader.biClrUsed=(long)256L;
	m_pBmi->bmiHeader.biClrImportant=0L;

	/*for(i=0;i<256;i++)
	{
		m_pBmi->bmiColors[i].rgbRed=i;
		m_pBmi->bmiColors[i].rgbGreen=i;
		m_pBmi->bmiColors[i].rgbBlue=i;
		m_pBmi->bmiColors[i].rgbReserved=0;
	}
	*/
	if(m_pImage!=NULL)
	{
		StretchDIBits( pDC->m_hDC, 
			(rect.Width() - m_dwWidth) / 2, 
			(rect.Height() - m_dwHeight) / 2,
			m_dwWidth, 
			m_dwHeight,
			0, 0, m_dwWidth, m_dwHeight, m_pImage, (BITMAPINFO *) m_pBmi,
			BI_RGB, SRCCOPY );

/*		StretchDIBits( pDC->m_hDC, 0, 0, rect.Width(), rect.Height(),
			0, 0, m_dwWidth, m_dwHeight, m_pImage, (BITMAPINFO *) m_pBmi,
			BI_RGB, SRCCOPY );
*/	}	
}

void CBmpButton::PreSubclassWindow() 
{

	SetButtonStyle(GetButtonStyle()|BS_OWNERDRAW);
	CButton::PreSubclassWindow();
}

int CBmpButton::OnCreate(LPCREATESTRUCT lpCreateStruct) 
{
	if (CButton::OnCreate(lpCreateStruct) == -1)
		return -1;	
		
	return 0;
}

void CBmpButton::OnDestroy() 
{
	CButton::OnDestroy();
	
	delete[] m_pBmi;	
}

void CBmpButton::SetHuePalate()
{
	int	 i;
	for (i = 0; i < 256; i++)
	{
		m_pBmi->bmiColors[i].rgbRed = i;
		m_pBmi->bmiColors[i].rgbGreen = i;
		m_pBmi->bmiColors[i].rgbBlue = i;
		m_pBmi->bmiColors[i].rgbReserved = 0;
	}
}

void CBmpButton::SetColorPalate()
{
#define COLOR_R		2
#define COLOR_B		3
#define COLOR_BLACK 1
#define COLOR_WHITE	0

	m_pBmi->bmiColors[COLOR_R].rgbRed = 255;
	m_pBmi->bmiColors[COLOR_R].rgbGreen = 0;
	m_pBmi->bmiColors[COLOR_R].rgbBlue = 0;
	m_pBmi->bmiColors[COLOR_R].rgbReserved = 0;

	m_pBmi->bmiColors[COLOR_B].rgbRed = 0;
	m_pBmi->bmiColors[COLOR_B].rgbGreen = 0;
	m_pBmi->bmiColors[COLOR_B].rgbBlue = 255;
	m_pBmi->bmiColors[COLOR_B].rgbReserved = 0;

	m_pBmi->bmiColors[COLOR_BLACK].rgbRed = 0;
	m_pBmi->bmiColors[COLOR_BLACK].rgbGreen = 0;
	m_pBmi->bmiColors[COLOR_BLACK].rgbBlue = 0;
	m_pBmi->bmiColors[COLOR_BLACK].rgbReserved = 0;

	m_pBmi->bmiColors[COLOR_WHITE].rgbRed = 255;
	m_pBmi->bmiColors[COLOR_WHITE].rgbGreen = 255;
	m_pBmi->bmiColors[COLOR_WHITE].rgbBlue = 255;
	m_pBmi->bmiColors[COLOR_WHITE].rgbReserved = 0;
}

