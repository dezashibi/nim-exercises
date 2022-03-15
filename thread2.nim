type
    ThreadData = tuple[param: string, param2: int]

var data = "Hello World"

proc showData(data: ThreadData) {.thread.} =
    echo(data.param, data.param2)

var thread: Thread[ThreadData]
createThread[ThreadData](thread, showData, (param: data, param2: 10))
joinThread(thread)
