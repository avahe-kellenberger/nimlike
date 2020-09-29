# Package

version = "0.1.0"
author = "Avahe Kellenberger"
description = "nimlike"
license = "GPLv2"

# Deps
requires "nim >= 1.2.0"
requires "nico >= 0.2.5"

srcDir = "src"

task runr, "Runs nimlike for current platform":
 exec "nim c -r -d:release -o:nimlike src/main.nim"

task rund, "Runs debug nimlike for current platform":
 exec "nim c -r -d:debug -o:nimlike src/main.nim"

task release, "Builds nimlike for current platform":
 exec "nim c -d:release -o:nimlike src/main.nim"

task debug, "Builds debug nimlike for current platform":
 exec "nim c -d:debug -o:nimlike_debug src/main.nim"

task web, "Builds nimlike for current web":
 exec "nim js -d:release -o:nimlike.js src/main.nim"

task webd, "Builds debug nimlike for current web":
 exec "nim js -d:debug -o:nimlike.js src/main.nim"

task deps, "Downloads dependencies":
 exec "curl https://www.libsdl.org/release/SDL2-2.0.12-win32-x64.zip -o SDL2_x64.zip"
 exec "unzip SDL2_x64.zip"
