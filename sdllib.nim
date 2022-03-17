#[
    install mingw msys64
    download sdl from here: https://www.libsdl.org/download-2.0.php
    extract and copy contents of x86_64-w64-mingw32 to the installation folder like C:\msys64\mingw64
]#

when defined(Windows):
    const libName* = "SDL2.dll"
elif defined(Linux):
    const libName* = "libSDL2.so"
elif defined(MacOsX):
    const libName* = "libSDL2.dylib"

type
    SdlWindow = object
    SdlWindowPtr* = ptr SdlWindow
    SdlRenderer = object
    SdlRendererPtr* = ptr SdlRenderer

{.push dynlib: libName.}
proc init*(flags: uint32): cint {.importc: "SDL_Init".}
proc createWindowAndRenderer*(width, height: cint, window_flags: cuint,
        window: var SdlWindowPtr,
        renderer: var SdlRendererPtr): cint {.importc: "SDL_CreateWindowAndRenderer".}
proc pollEvent*(event: pointer): cint {.importc: "SDL_PollEvent".}
proc setDrawColor*(renderer: SdlRendererPtr, r, g, b,
        a: uint8): cint {.importc: "SDL_SetRenderDrawColor", discardable.}
proc present*(renderer: SdlRendererPtr) {.importc: "SDL_RenderPresent".}
proc clear*(renderer: SdlRendererPtr) {.importc: "SDL_RenderClear".}
proc drawLines*(renderer: SdlRendererPtr, points: ptr tuple[x, y: cint],
        count: cint): cint {.importc: "SDL_RenderDrawLines", discardable.}
{.pop.}

const INIT_VIDEO* = 0x00000020
