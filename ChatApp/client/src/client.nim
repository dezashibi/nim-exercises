import os, threadpool, asyncdispatch, asyncnet
import protocol

proc connect(socket: AsyncSocket, serverAddr: string) {.async.} =
    echo("Connecting to ", serverAddr)
    await socket.connect(serverAddr, 7687.Port)
    echo("Connected!")

    while true:
        let line = await socket.recvLine()
        let parsed = parseMessage(line)
        echo(parsed.username, " said ", parsed.message)

echo("Chat application started")
if paramCount() < 2:
    quit("Please specify the server address, e.g. ./client localhost username")

let serverAddr = paramStr(1)
let username = paramStr(2)
var socket = newAsyncSocket()

asyncCheck connect(socket, serverAddr)
var messageFlowVar = spawn stdin.readLine()

while true:
    if messageFlowVar.isReady():
        let text = ^messageFlowVar
        if text == ".exit":
            break
        let message = createMessage(username, text)
        asyncCheck socket.send(message)
        messageFlowVar = spawn stdin.readLine()

    asyncdispatch.poll()
