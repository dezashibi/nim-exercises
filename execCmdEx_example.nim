import osproc

when defined(windows):
    let (ver, _) = execCmdEx("cmd /C ver")
else:
    let (ver, _) = execCmdEx("uname -sr")

echo("My operting system is: ", ver)
