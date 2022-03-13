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

var server = newServer()
