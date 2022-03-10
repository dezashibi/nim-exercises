import terminal, os, random

let fgColors = [fgBlack, fgRed, fgGreen, fgYellow, fgBlue, fgMagenta, fgCyan, fgWhite]
let bgColors = [bgBlack, bgRed, bgGreen, bgYellow, bgBlue, bgMagenta, bgCyan, bgWhite]

var i = 0
while i < 20:

    setForegroundColor(sample(fgColors))
    setBackgroundColor(sample(bgColors))

    echo "Hello World!"
    inc i
    sleep(100)

system.addQuitProc(resetAttributes)