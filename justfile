set minimum-version := '1.47.0'

meson_defines := "-Dwlroots:xwayland=enabled"

_default:
    @just --list

configure:
    meson setup build {{ meson_defines }}

# Resetup with wipe
wipe:
    meson setup build --wipe {{ meson_defines }}

# Removes build folder and friends
clean:
    rm -rf build
    @echo "all clean!"

# Ninja builds, will configure if gay
build: configure
    ninja -C build