const pdfium = require('bindings')({ bindings: 'pdfium.node', module_root: __dirname });

const FPDF_NONE=0;
const FPDF_ANNOT=1;
const FPDF_LCD_TEXT=2;
const FPDF_NO_NATIVETEXT=4;
const FPDF_GRAYSCALE=8;
const FPDF_DEBUG_INFO=128;
const FPDF_NO_CATCH=256;
const FPDF_RENDER_LIMITEDIMAGECACHE=512;
const FPDF_RENDER_FORCEHALFTONE=1024;
const FPDF_PRINTING=2048;
const FPDF_REVERSE_BYTE_ORDER=16;
const FPDF_THUMBNAIL=32768;
const FPDF_HQTHUMBNAIL=32768;
const FPDF_RENDER_NO_SMOOTHTEXT=4096;
const FPDF_RENDER_NO_SMOOTHIMAGE=8192;
const FPDF_RENDER_NO_SMOOTHPATH=16384;

const WHITE_BRUSH = 0;
const LTGRAY_BRUSH = 1;
const GRAY_BRUSH = 2;
const DKGRAY_BRUSH = 3;
const BLACK_BRUSH = 4;
const NULL_BRUSH = 5;
const WHITE_PEN = 6;
const BLACK_PEN = 7;
const NULL_PEN = 8;
const OEM_FIXED_FONT = 10;
const ANSI_FIXED_FONT = 11;
const ANSI_VAR_FONT = 12;
const SYSTEM_FONT = 13;
const DEVICE_DEFAULT_FONT = 14;
const SYSTEM_FIXED_FONT = 16;
const DEFAULT_GUI_FONT = 17;

exports.init = function init() {
    return pdfium.FPDF_InitLibrary();
};

exports.loadDocument = function loadDocument(filename) {
    return pdfium.FPDF_LoadDocument(filename, '');
};

exports.getPageCount = function getPageCount(document) {
    return pdfium.FPDF_GetPageCount(document);
};

exports.loadPage = function loadPage(document, pageNumber = 0) {
    return pdfium.FPDF_LoadPage(document, pageNumber);
};

exports.getPageWidth = function getPageWidth(page) {
    return pdfium.FPDF_GetPageWidth(page);
};

exports.getPageHeight = function getPageHeight(page) {
    return pdfium.FPDF_GetPageHeight(page);
};

exports.createBitmap = function createBitmap(width, height, useAlpha = 0) {
    return pdfium.FPDFBitmap_Create(width, height, useAlpha);
};

if (process.platform === "win32") {
    exports.createEmf = function(page) {
        width = pdfium.FPDF_GetPageWidth(page);
        height = pdfium.FPDF_GetPageHeight(page);
        dc = pdfium.CreateEnhMetaFileWNull();
        rgn = pdfium.CreateRectRgn(0, 0, width, height);
        pdfium.SelectClipRgn(dc, rgn);
        pdfium.DeleteObjectHRGN(rgn);
        pdfium.SelectObject(dc, pdfium.GetStockObject(NULL_PEN));
        pdfium.SelectObject(dc, pdfium.GetStockObject(WHITE_BRUSH));
        // // If a PS_NULL pen is used, the dimensions of the rectangle are 1 pixel less.
        pdfium.Rectangle(dc, 0, 0, width + 1, height + 1);
        pdfium.FPDF_RenderPage(dc, page, 0, 0, width, height, 0, FPDF_ANNOT | FPDF_PRINTING | FPDF_NO_CATCH);
        emf = pdfium.CloseEnhMetaFile(dc);

        if (emf != undefined) {
            emfSize = pdfium.getEnhMetaFileBitsSize(emf);
            emfFileContents = pdfium.getEnhFileBits(emf, emfSize);
            return emfFileContents;
        }
    }
}
