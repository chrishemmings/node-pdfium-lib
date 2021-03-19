#!/bin/bash

/usr/local/bin/swig -o src/pdfium_win_ia32.cxx -javascript -node -c++ swig/win_ia32.i
/usr/local/bin/swig -o src/pdfium_win_x64.cxx -javascript -node -c++ swig/win_x64.i
/usr/local/bin/swig -o src/pdfium_linux.cxx -javascript -node -c++ swig/linux.i
/usr/local/bin/swig -o src/pdfium_mac.cxx -javascript -node -c++ swig/mac.i

rm -rf build && node-gyp clean && node-gyp configure && node-gyp build
