import asyncdispatch, asyncfile

proc readFiles() {.async.} =
    var file = openAsync("./test.txt", fmReadWriteExisting)
    let data = await file.readAll()
    echo(data)
    echo("End of file reading")
    await file.write("Hello!\n")
    file.close()

waitFor readFiles()
