import threadpool
var data = "Hello world"

proc countData(param: string) =
    for i in 0..<param.len:
        stdout.write($i)
    echo()

spawn countData(data)
spawn countData(data)

sync()