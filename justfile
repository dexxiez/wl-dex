set minimum-version := '1.47.0'

meson_defines := "-Dwlroots:xwayland=enabled"
meson_debug_defines := "-Db_sanitize=address,undefined -Db_lundef=false"

_default:
    @just --list

# Configure build dir; target is "debug" or "release"
configure target="debug":
    meson setup build --buildtype={{ target }} {{ meson_defines }} {{ if target == "debug" { meson_debug_defines } else if target == "release" { "" } else { error("target must be 'debug' or 'release'") } }}

reconfigure target="debug":
    meson setup build --reconfigure --buildtype={{ target }} {{ meson_defines }} {{ if target == "debug" { meson_debug_defines } else if target == "release" { "" } else { error("target must be 'debug' or 'release'") } }}

# Resetup with wipe
wipe target="debug":
    meson setup build --wipe --buildtype={{ target }} {{ meson_defines }} {{ if target == "debug" { meson_debug_defines } else if target == "release" { "" } else { error("target must be 'debug' or 'release'") } }}

# Removes build folder and friends
clean:
    rm -rf build
    @echo "all clean!"

# Ninja builds, will configure if gay
build target="debug": (configure target)
    ninja -C build
