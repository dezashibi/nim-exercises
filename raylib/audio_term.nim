import nimraylib_now
import illwill


initAudioDevice()

let music = loadMusicStream("./White_noise.ogg")

playMusicStream(music)

illwillInit(fullscreen = false)

var
    timePlayed = 0.0
    pause = false

60.setTargetFPS

while true:
    music.updateMusicStream()

    var key = getKey()
    case key
    of Key.Space:
        music.stopMusicStream()
        music.playMusicStream()
    of Key.P:
        pause = not pause
        if pause: music.pauseMusicStream()
        else: music.resumeMusicStream()
    of Key.Escape, Key.Q:
        break
    else:
        continue

    timePlayed = music.getMusicTimePlayed()/music.getMusicTimeLength()*400

    if timePlayed > 400: music.stopMusicStream()

    echo $timePlayed

#  De-Initialization
# --------------------------------------------------------------------------------------

music.unloadMusicStream() # Unload music stream buffers from RAM

closeAudioDevice() #  Close audio device
