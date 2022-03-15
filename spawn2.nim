import threadpool, os

let lineFlowVar = spawn stdin.readLine()
while not lineFlowVar.isReady:
    echo("No input received.")
    echo("Will check again in 3 seconds.")
    sleep(3000)

echo("Input received: ", ^lineFlowVar)