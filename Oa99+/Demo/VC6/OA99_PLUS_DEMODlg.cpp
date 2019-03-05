// OA99_PLUS_DEMODlg.cpp : implementation file
//

#include "stdafx.h"
#include "OA99_PLUS_DEMO.h"
#include "OA99_PLUS_DEMODlg.h"
#include "AvzScanner.h"
#include "AvzGlobal.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

WORD getLum (BYTE *pImage)
{
	int cnt = 0;
	BYTE *p;
	long lLum = 0;
	int i, j;
	for (i = 296 / 4; i < 296 * 3 / 4; i++)
	{
		p = pImage + 256 * i + 256 / 4;
		for (j = 256 / 4; j < 256 * 3 / 4; j++)
		{
			lLum += *p++;
			cnt ++;
		}
	}
	lLum /= cnt;
	lLum = min (lLum, 255);
	return (WORD)lLum;
}

//////////////////////////////////////////////////////////////
// CAboutDlg dialog used for App About

class CAboutDlg : public CDialog
{
public:
	CAboutDlg();

// Dialog Data
	//{{AFX_DATA(CAboutDlg)
	enum { IDD = IDD_ABOUTBOX };
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CAboutDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	//{{AFX_MSG(CAboutDlg)
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

CAboutDlg::CAboutDlg() : CDialog(CAboutDlg::IDD)
{
	//{{AFX_DATA_INIT(CAboutDlg)
	//}}AFX_DATA_INIT
}

void CAboutDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CAboutDlg)
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CAboutDlg, CDialog)
	//{{AFX_MSG_MAP(CAboutDlg)
		// No message handlers
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// COA99_PLUS_DEMODlg dialog

COA99_PLUS_DEMODlg::COA99_PLUS_DEMODlg(CWnd* pParent /*=NULL*/)
	: CDialog(COA99_PLUS_DEMODlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(COA99_PLUS_DEMODlg)
	m_strFeaPath = _T("");
	m_strMatchResult = _T("");
	m_strMatchTime = _T("");
	m_strMatchNResult = _T("");
	m_strMatchCnt = _T("");
	m_strStatus = _T("");
	m_nLum = 0;
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void COA99_PLUS_DEMODlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(COA99_PLUS_DEMODlg)
	DDX_Control(pDX, IDC_COMBO1, m_comboType);
	DDX_Control(pDX, IDC_BTN_IMAGE, m_btnImage);
	DDX_Text(pDX, IDC_EDIT_FEA_PATH, m_strFeaPath);
	DDX_Text(pDX, IDC_EDIT_MATCH_RESULT, m_strMatchResult);
	DDX_Text(pDX, IDC_EDIT_MATCH_TIME, m_strMatchTime);
	DDX_Text(pDX, IDC_EDIT_MATCHN_RESULT, m_strMatchNResult);
	DDX_Text(pDX, IDC_EDIT_MATCH_CNT, m_strMatchCnt);
	DDX_Text(pDX, IDC_EDIT_STATUS, m_strStatus);
	DDX_Text(pDX, IDC_EDIT_LUM, m_nLum);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(COA99_PLUS_DEMODlg, CDialog)
	//{{AFX_MSG_MAP(COA99_PLUS_DEMODlg)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_BN_CLICKED(IDC_BTN_OPEN_DEV, OnBtnOpenDev)
	ON_WM_TIMER()
	ON_WM_CLOSE()
	ON_BN_CLICKED(IDC_BTN_SHOW_RAW, OnBtnShowRaw)
	ON_BN_CLICKED(IDC_BTN_SHOW_BIN_FEA, OnBtnShowBinFea)
	ON_BN_CLICKED(IDC_BTN_STORE_IMG, OnBtnStoreImg)
	ON_BN_CLICKED(IDC_BTN_STORE_BIN, OnBtnStoreBin)
	ON_BN_CLICKED(IDC_BTN_STORE_FEA, OnBtnStoreFea)
	ON_BN_CLICKED(IDC_BTN_BROWSE, OnBtnBrowse)
	ON_BN_CLICKED(IDC_BTN_MATCH, OnBtnMatch)
	ON_BN_CLICKED(IDC_BTN_MATCHN, OnBtnMatchn)
	ON_BN_CLICKED(IDC_BTN_ENUM_DEV, OnBtnEnumDev)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// COA99_PLUS_DEMODlg message handlers

BOOL COA99_PLUS_DEMODlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// Add "About..." menu item to system menu.

	// IDM_ABOUTBOX must be in the system command range.
	ASSERT((IDM_ABOUTBOX & 0xFFF0) == IDM_ABOUTBOX);
	ASSERT(IDM_ABOUTBOX < 0xF000);

	CMenu* pSysMenu = GetSystemMenu(FALSE);
	if (pSysMenu != NULL)
	{
		CString strAboutMenu;
		strAboutMenu.LoadString(IDS_ABOUTBOX);
		if (!strAboutMenu.IsEmpty())
		{
			pSysMenu->AppendMenu(MF_SEPARATOR);
			pSysMenu->AppendMenu(MF_STRING, IDM_ABOUTBOX, strAboutMenu);
		}
	}

	// Set the icon for this dialog.  The framework does this automatically
	//  when the application's main window is not a dialog
	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon
	
	// TODO: Add extra initialization here
	
	return TRUE;  // return TRUE  unless you set the focus to a control
}

void COA99_PLUS_DEMODlg::OnSysCommand(UINT nID, LPARAM lParam)
{
	if ((nID & 0xFFF0) == IDM_ABOUTBOX)
	{
		CAboutDlg dlgAbout;
		dlgAbout.DoModal();
	}
	else
	{
		CDialog::OnSysCommand(nID, lParam);
	}
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

void COA99_PLUS_DEMODlg::OnPaint() 
{
	if (IsIconic())
	{
		CPaintDC dc(this); // device context for painting

		SendMessage(WM_ICONERASEBKGND, (WPARAM) dc.GetSafeHdc(), 0);

		// Center icon in client rectangle
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;

		// Draw the icon
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialog::OnPaint();
	}
}

// The system calls this to obtain the cursor to display while the user drags
//  the minimized window.
HCURSOR COA99_PLUS_DEMODlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

void COA99_PLUS_DEMODlg::OnBtnOpenDev() 
{
	long  lRet;
	unsigned char  pID[100];

	lRet = AvzOpenDevice (m_comboType.GetCurSel(), 0);

	if (lRet == 0)
	{
		AvzOpenLED (m_comboType.GetCurSel());
		m_strStatus = "Open Device OK";

		//取ID号
		AvzGetID (m_comboType.GetCurSel(), pID);
	}
	else
	{
		m_strStatus = "Open Device Fail";
	}	

	UpdateData (false);

	SetTimer (1, 320, NULL);
}

void COA99_PLUS_DEMODlg::OnTimer(UINT nIDEvent) 
{
	static bool bFingerOn = FALSE;
	WORD uStatus;
	//AvzGetImage (m_comboType.GetCurSel(), gpImage, uStatus);
	AvzGetRawImage (m_comboType.GetCurSel(), gpImage, uStatus);
			
	//if (uStatus == STATUS_FINGER_ON)
	{
	//	if (!bFingerOn)
		{
			AvzProcess (gpImage, gpFeature, gpBin, TRUE, TRUE);

			OnBtnMatchn ();

			m_nLum = getLum (gpImage);
			UpdateData (false);			

			m_btnImage.m_dwWidth  = 256;
			m_btnImage.m_dwHeight = 296;
			m_btnImage.m_pImage = gpImage;
			m_btnImage.SetHuePalate();
			m_btnImage.Invalidate ();	
		}
		bFingerOn = TRUE;
	}
//	else
	{
		bFingerOn = FALSE;
	}
	
	CDialog::OnTimer(nIDEvent);
}

void COA99_PLUS_DEMODlg::OnClose() 
{
	AvzCloseLED (m_comboType.GetCurSel());
	AvzCloseDevice (m_comboType.GetCurSel());
	
	CDialog::OnClose();
}

int COA99_PLUS_DEMODlg::LoadFeature(char *strFile, BYTE *pFeature1, BYTE *pFeature2)
{
#define FEATURE_SIZE_1		169	 				
#define PACK_FEATURE_SIZE   (84 + 1)
	BYTE  pBuffer[500];
	short result;
	CFile f;
	int   i, j;	

	//载入特征值
	if (f.Open (strFile, CFile::modeRead) == NULL)
	{
		MessageBox ("File open error!");
		return -1;
	}
	f.Read (pBuffer, min (500, f.GetLength()));
	f.Close ();

	result = AvzUnpackFeature (pBuffer, pFeature1, pFeature2);
	if (result == 0) return 0;
			    else return -1;
}

void COA99_PLUS_DEMODlg::OnBtnShowRaw() 
{
	m_btnImage.m_dwWidth  = 256;
	m_btnImage.m_dwHeight = 296;
	m_btnImage.m_pImage = gpImage;
	m_btnImage.SetHuePalate();
	m_btnImage.Invalidate ();		
}

void COA99_PLUS_DEMODlg::OnBtnShowBinFea() 
{
	m_btnImage.m_dwWidth  = 256;
	m_btnImage.m_dwHeight = 296;
	m_btnImage.m_pImage = gpBin;
	m_btnImage.SetColorPalate();
	m_btnImage.Invalidate ();		
}

void COA99_PLUS_DEMODlg::OnBtnStoreImg() 
{
	CFileDialog fDlg(false, "bmp", "",
					OFN_HIDEREADONLY | OFN_OVERWRITEPROMPT,
					"Bmp files (*.bmp)|*.bmp|");

	if (fDlg.DoModal () != IDOK) return;

	AvzSaveHueBMPFile (fDlg.GetPathName().GetBuffer (200), gpImage);	
}

void COA99_PLUS_DEMODlg::OnBtnStoreBin() 
{
	CFileDialog fDlg(false, "bmp", "",
					OFN_HIDEREADONLY | OFN_OVERWRITEPROMPT,
					"Bmp files (*.bmp)|*.bmp|");

	if (fDlg.DoModal () != IDOK) return;

	AvzSaveClrBMPFile (fDlg.GetPathName().GetBuffer (200), gpBin);	
}

void COA99_PLUS_DEMODlg::OnBtnStoreFea() 
{
	CFileDialog fDlg(false, "anv","",
						OFN_HIDEREADONLY | OFN_OVERWRITEPROMPT,
						"template files (*.anv)|*.anv|");
	unsigned char pBuffer[500];
	CFile f;
	WORD uLen;	
	
	if (fDlg.DoModal () != IDOK) return;
	if (f.Open (fDlg.GetPathName(), CFile::modeCreate | CFile::modeWrite) == NULL)
	{
		MessageBox ("File open error!");
		return;
	}

	uLen = AvzPackFeature (gpFeature, gpFeature, pBuffer);
	f.Write (pBuffer, uLen);
	f.Close ();	
}

void COA99_PLUS_DEMODlg::OnBtnBrowse() 
{
	CFileDialog fDlg(true, "anv", "",
						OFN_HIDEREADONLY | OFN_OVERWRITEPROMPT,
						"Feature files (*.anv)|*.anv|");
	short result;
	
	if (fDlg.DoModal() != IDOK)
	{
		return;		
	}

	m_strFeaPath = fDlg.GetPathName();
	UpdateData (FALSE);

	result = LoadFeature (m_strFeaPath.GetBuffer(200), gpFeatureA, gpFeatureB);
	if (result == -1)
	{
		MessageBox ("Invalid Feature File!");
	}	
}

void COA99_PLUS_DEMODlg::OnBtnMatch() 
{
	WORD result;
	//比对
	result = AvzMatch (gpFeature, gpFeatureA, 3);
	if (result != 0)
	{
		result = AvzMatch (gpFeature, gpFeatureB, 3);
	}
	if (result == 0)
	{
		m_strMatchResult = "OK";
	}
	else
	{
		m_strMatchResult = "FAIL";
	}
	UpdateData (false);	
}

char pFileName[1000][256];
BYTE pFeaBuf1[1000][256];
BYTE pFeaBuf2[1000][256];

void COA99_PLUS_DEMODlg::OnBtnMatchn() 
{
	char pDirName[200];
	char pPathName[200];
	HANDLE hSearch;
	bool bSearch;
	short result;
	WIN32_FIND_DATA fd;
	DWORD tMatch;
	int  uFeaCnt;
	int  i;

	GetModuleFileName (NULL, pDirName, 200);
	for (i = strlen (pDirName) - 1; i >= 0; i --)
	{
		if (pDirName[i] == '\\') break;
	}
	pDirName[i + 1] = 0;

	strcpy (pPathName, pDirName);
	strcat (pPathName, "*.anv");
	
	uFeaCnt = 0;
	hSearch = FindFirstFile (pPathName, &fd);
	if ((DWORD)hSearch != 0xFFFFFFFF)
	{
		while (1)
		{
			if (uFeaCnt <= 1000)
			{
				strcpy (pPathName, pDirName);
				strcat (pPathName, fd.cFileName);
				strcpy (pFileName[uFeaCnt], fd.cFileName);
				result = LoadFeature (pPathName, pFeaBuf1[uFeaCnt], pFeaBuf2[uFeaCnt]);		
				if (result == -1)
				{
					MessageBox ("Invalid Feature File!");
					return;
				}
				uFeaCnt ++;
			}
			bSearch = FindNextFile (hSearch, &fd);
			if (!bSearch) break;
		}
	}

	tMatch = GetTickCount ();
	result = AvzMatchN (gpFeature, pFeaBuf1, uFeaCnt, 5);
	tMatch = GetTickCount () - tMatch;

	if (result < 0)
	{
		result = AvzMatchN (gpFeature, pFeaBuf2, uFeaCnt, 5);
	}

	if (result >= 0) 
	{
		strcpy (m_strMatchNResult.GetBuffer(100), pFileName[result]);
		strcat (m_strMatchNResult.GetBuffer(100), " OK");
	}
	else 
	{
		strcpy (m_strMatchNResult.GetBuffer(100), "All FAIL");
	}
	itoa (uFeaCnt, m_strMatchCnt.GetBuffer(100), 10);
	itoa (tMatch, m_strMatchTime.GetBuffer(100), 10);
	UpdateData (false);	
}

void COA99_PLUS_DEMODlg::OnBtnEnumDev() 
{
	char pName[8][128];
	short iNum;
	int  i;
	
	iNum = AvzFindDevice (pName);

	for (i = 0; i < iNum; i++)
	{
		m_comboType.AddString (pName[i]);
	}
	m_comboType.SetCurSel (0);
}
