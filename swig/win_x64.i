%module "pdfium"
%{
#include "fpdfview.h"
%}
%include "externals/win/x64/include/fpdfview.h"
%inline %{
BOOL DeleteObjectHRGN(HRGN hrgn) {
  return DeleteObject(hrgn);
}

HDC CreateEnhMetaFileWNull() {
  return CreateEnhMetaFileW(NULL, NULL, NULL, NULL);
}

UINT getEnhMetaFileBitsSize(HENHMETAFILE hEMF) {
  return GetEnhMetaFileBits(hEMF, 0, NULL);
}

char * getEnhFileBits(HENHMETAFILE hEMF, UINT size) {
  std::string oData;
  oData.clear();
  oData.resize(size);
  UINT size2 = GetEnhMetaFileBits(hEMF, size, reinterpret_cast<BYTE *>((void *)(oData.c_str())));
  if (size != size2) {
    return NULL;
  }
  char *c = oData.c_str();
  return c;
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
