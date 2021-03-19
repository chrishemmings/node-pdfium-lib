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
                    "copies": [
                        {
                            "destination": "<(module_root_dir)/build/Release",
                            "files": ["externals/mac/lib/libpdfium.so"]
                        }
                    ],
                    "libraries": ["<(module_root_dir)/build/Release/libpdfium.so"],
                    'link_settings': {
                        'libraries': ['-L<(module_root_dir)/build/Release', '-lpdfium'],
                    },
                }],
                # ['OS=="win"', {
                #     "sources": [
                #         "src/pdfium_win_<(target_arch).cxx",
                #     ],
                #     'include_dirs': [
                #         'externals/win/<(target_arch)/include',
                #     ],
                #     "copies": [
                #         {
                #             "destination": "<(module_root_dir)/build/Release",
                #             "files": [
                #                 "externals/win/<(target_arch)/lib/pdfium.dll.lib",
                #                 "externals/win/<(target_arch)/bin/pdfium.dll"
                #             ]
                #         }
                #     ],
                #     "libraries": ["<(module_root_dir)/build/Release/libpdfium.dll.lib"],
                # }]
                ['OS=="win"', {
                    "sources": [
                        "src/pdfium_win_x64.cxx",
                    ],
                    'include_dirs': [
                        'externals/win/x64/include',
                    ],
                    "copies": [
                        {
                            "destination": "<(module_root_dir)/build/Release",
                            "files": [
                                "externals/win/x64/lib/pdfium.dll.lib",
                                "externals/win/x64/bin/pdfium.dll"
                            ]
                        }
                    ],
                    "libraries": [
                        "<(module_root_dir)/build/Release/libpdfium.dll.lib"
                        "<(module_root_dir)/build/Release/libpdfium.dll"
                    ],
                }]
            ],
        }
    ]
}
