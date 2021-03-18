{
    "targets": [
        {
            "target_name": "pdfium",
            'conditions': [
                ['OS=="mac"', {
                    "sources": [
                        "src/pdfium_mac.cxx"
                    ],
                    'include_dirs': [
                        'externals/mac/include',
                    ],
                     "copies": [
                        {
                            "destination": "<(module_root_dir)/build/Release",
                            "files": ["externals/mac/lib/libpdfium.dylib"]
                        }
                    ],
                    "libraries": ["<(module_root_dir)/build/Release/libpdfium.dylib"],
                    'link_settings': {
                        'libraries': ['-L<(module_root_dir)/build/Release', '-lpdfium'],
                    },
                }],
                ['OS=="linux"', {
                    "sources": [
                        "src/pdfium_linux.cxx",
                    ],
                    'include_dirs': [
                        'externals/linux/include',
                    ],
                }],
                ['OS=="win"', {
                    "sources": [
                        "src/pdfium_win.cxx",
                    ],
                    'include_dirs': [
                        'externals/win/include',
                    ],
                }]
            ],
        }
    ]
}
