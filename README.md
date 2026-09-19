# WL-DEX

Wayland Compositor for the retarded

## Features

- None

## Layout probs gonna use

```sh
wl-dex/
├── meson.build              
├── meson_options.txt
├── subprojects/
│   └── wlroots.wrap        
├── protocols/
│   ├── meson.build          
│   └── wlr-layer-shell-unstable-v1.xml   
├── include/
│   ├── server.h             # struct server: display, backend, scene, lists
│   ├── output.h
│   ├── toplevel.h
│   ├── popup.h
│   ├── input/
│   │   ├── keyboard.h
│   │   ├── cursor.h
│   │   └── seat.h
│   └── config.h             # keybinds, colours, defaults
├── src/
│   ├── main.c               # arg parsing, startup cmd, run loop
│   ├── server.c             # backend/renderer/allocator/scene init + teardown
│   ├── output.c             # new_output, frame, request_state, destroy
│   ├── shell/
│   │   ├── xdg_toplevel.c   # map/unmap/commit/move/resize requests
│   │   └── xdg_popup.c
│   ├── input/
│   │   ├── keyboard.c       # keymap, modifiers, keybinding dispatch
│   │   ├── cursor.c         # motion, button, axis, interactive grab modes
│   │   └── seat.c           # request_cursor, request_set_selection
│   ├── focus.c              # focus_toplevel, desktop_toplevel_at
│   └── layout/              # add later: tiling/floating strategies
├── README.md
└── .clang-format / .editorconfig
```

## Tips for pulling tinywl apart

- Follow the listeners. Every wl_signal_add in main() starts a code path. Trace each one to its handler to see how events flow through the
  compositor.
- Every listener needs a matching wl_list_remove in the destroy handler. Most wlroots crashes come from missing one. ASan catches it.
- Get debug logs with wlr_log_init(WLR_DEBUG, NULL). They show backend selection, output modes and client lifecycle.
- Run it nested inside your current session, so a crash just closes a window.
- Use WAYLAND_DEBUG=1 on a client (like foot) to see the protocol messages your compositor sends and receives.