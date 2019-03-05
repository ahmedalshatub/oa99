// OA99_PLUS_DEMODlg.h : header file
//

#if !defined(AFX_OA99_PLUS_DEMODLG_H__F1B2A252_C26A_41A5_966D_EFA15C6AED60__INCLUDED_)
#define AFX_OA99_PLUS_DEMODLG_H__F1B2A252_C26A_41A5_966D_EFA15C6AED60__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include "BmpButton.h"

/////////////////////////////////////////////////////////////////////////////
// COA99_PLUS_DEMODlg dialog

class COA99_PLUS_DEMODlg : public CDialog
{
// Construction
public:
	COA99_PLUS_DEMODlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(COA99_PLUS_DEMODlg)
	enum { IDD = IDD_OA99_PLUS_DEMO_DIALOG };
	CComboBox	m_comboType;
	CBmpButton	m_btnImage;
	CString	m_strFeaPath;
	CString	m_strMatchResult;
	CString	m_strMatchTime;
	CString	m_strMatchNResult;
	CString	m_strMatchCnt;
	CString	m_strStatus;
	UINT	m_nLum;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(COA99_PLUS_DEMODlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;
	int LoadFeature(char *strFile, BYTE *pFeature1, BYTE *pFeature2);

	// Generated message map functions
	//{{AFX_MSG(COA99_PLUS_DEMODlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnBtnOpenDev();
	afx_msg void OnTimer(UINT nIDEvent);
	afx_msg void OnClose();
	afx_msg void OnBtnShowRaw();
	afx_msg void OnBtnShowBinFea();
	afx_msg void OnBtnStoreImg();
	afx_msg void OnBtnStoreBin();
	afx_msg void OnBtnStoreFea();
	afx_msg void OnBtnBrowse();
	afx_msg void OnBtnMatch();
	afx_msg void OnBtnMatchn();
	afx_msg void OnBtnEnumDev();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_OA99_PLUS_DEMODLG_H__F1B2A252_C26A_41A5_966D_EFA15C6AED60__INCLUDED_)
