scanner = dependency('wayland-scanner', native : true)
scanner_bin = find_program(scanner.get_variable('wayland_scanner'), native : true)

protocol_files = []
foreach xml : ['wlr-layer-shell-unstable-v1.xml']
    protocol_files += custom_target(xml.underscorify() + '_h',
                                    input : xml, output : '@BASENAME@-protocol.h',
                                    command : [scanner_bin, 'server-header', '@INPUT@', '@OUTPUT@'])
    protocol_files += custom_target(xml.underscorify() + '_c',
                                    input : xml, output : '@BASENAME@-protocol.c',
                                    command : [scanner_bin, 'private-code', '@INPUT@', '@OUTPUT@'])
endforeach