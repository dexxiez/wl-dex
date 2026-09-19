project('wl-dex', 'c',
        version : '0.1.0',
        meson_version : '>=1.3.0',
        default_options : ['warning_level=2', 'werror=true', 'c_std=c23'])

add_project_arguments(
    '-DWLR_USE_UNSTABLE',
    '-D_POSIX_C_SOURCE=200809L',
    '-Wno-unused-parameter',
    language : 'c',
)

# Dependencies
wlroots = dependency('wlroots-0.20',
                     fallback : 'wlroots', default_options : ['examples=false'],
)
wayland_server = dependency('wayland-server')
wayland_protos = dependency('wayland-protocols')
xkbcommon = dependency('xkbcommon')

# Subdirs
subdir('protocols')

# Executables and Friends
executable('dexland',
           files('src/main.c'),
           protocol_files,
           include_directories : include_directories('include'),
           dependencies : [wlroots, wayland_server, xkbcommon],
           install : true
)
