#!/bin/bash

/usr/local/bin/swig -o src/pdfium_win.cxx -javascript -node -c++ swig/win.i
/usr/local/bin/swig -o src/pdfium_linux.cxx -javascript -node -c++ swig/linux.i
/usr/local/bin/swig -o src/pdfium_mac.cxx -javascript -node -c++ swig/mac.i

rm -rf build && node-gyp clean && node-gyp configure && node-gyp build
