// OA99_PLUS_DEMO.h : main header file for the OA99_PLUS_DEMO application
//

#if !defined(AFX_OA99_PLUS_DEMO_H__F5407A5D_9A2C_4F4A_BF83_0BE17C6B498D__INCLUDED_)
#define AFX_OA99_PLUS_DEMO_H__F5407A5D_9A2C_4F4A_BF83_0BE17C6B498D__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols

/////////////////////////////////////////////////////////////////////////////
// COA99_PLUS_DEMOApp:
// See OA99_PLUS_DEMO.cpp for the implementation of this class
//

class COA99_PLUS_DEMOApp : public CWinApp
{
public:
	COA99_PLUS_DEMOApp();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(COA99_PLUS_DEMOApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation

	//{{AFX_MSG(COA99_PLUS_DEMOApp)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_OA99_PLUS_DEMO_H__F5407A5D_9A2C_4F4A_BF83_0BE17C6B498D__INCLUDED_)
