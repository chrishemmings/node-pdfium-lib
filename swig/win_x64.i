%module "pdfium"
%{
#include "fpdfview.h"
%}
%include "externals/win/x64/include/fpdfview.h"
%inline %{
BOOL DeleteObjectHRGN(HRGN hrgn) {
  return DeleteObject(hrgn)
}

HDC CreateEnhMetaFileWNull() {
  return CreateEnhMetaFileW(NULL, NULL, NULL, NULL)
}
%}
HDC CreateMetaFileA(
  LPCSTR pszFile
);
int SelectClipRgn(
  HDC  hdc,
  HRGN hrgn
);
HRGN CreateRectRgn(
  int x1,
  int y1,
  int x2,
  int y2
);
BOOL DeleteObject(
  HGDIOBJ ho
);
HGDIOBJ SelectObject(
  HDC     hdc,
  HGDIOBJ h
);
HGDIOBJ GetStockObject(
  int i
);
BOOL Rectangle(
  HDC hdc,
  int left,
  int top,
  int right,
  int bottom
);
HDC CreateEnhMetaFileW(
  HDC        hdc,
  LPCWSTR    lpFilename,
  const RECT *lprc,
  LPCWSTR    lpDesc
);
UINT GetEnhMetaFileBits(
  HENHMETAFILE hEMF,
  UINT nSize,
  LPBYTE lpData
);
HENHMETAFILE CloseEnhMetaFile(
  HDC hdc
);
