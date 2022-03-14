import asyncdispatch, asyncnet

type
    Client = ref object
        socket: AsyncSocket
        netAddr: string
        id: int
        connected: bool

    Server = ref object
        socket: AsyncSocket
        clients: seq[Client]

proc newServer(): Server =
    ## Constructor for creating a new ``Server``.
    Server(socket: newAsyncSocket(), clients: @[])

proc `$`(client: Client): string =
    ## Convert a ``Client``'s information into a string.
    $client.id & "(" & client.netAddr & ")"

proc processMessages(server: Server, client: Client) {.async.} =
    while true:
        let line = await client.socket.recvLine()
        if line.len == 0:
            echo(client, " disconnected!")
            client.connected = false
            client.socket.close()
            return

        echo(client, " sent: ", line)

        # send the message to other clients.
        for c in server.clients:
            # Don't send it to the client that sent this or to a client that is
            # disconnected.
            if c.id != client.id and c.connected:
                await c.socket.send(line & "\c\l")

proc loop(server: Server, port = 7687) {.async.} =
    server.socket.bindAddr(port.Port)
    server.socket.listen()

    echo("Listening on localhost:", port)

    while true:
        let (netAddr, clientSocket) = await server.socket.acceptAddr()
        echo("Accepted connection from ", netAddr)
        let client = Client(
            socket: clientSocket,
            netAddr: netAddr,
            id: server.clients.len,
            connected: true
        )
        server.clients.add(client)
        asyncCheck processMessages(server, client)

when isMainModule:
    var server = newServer()
    echo("Server initiated!")
    waitFor loop(server)
