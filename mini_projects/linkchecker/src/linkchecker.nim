import os, httpclient
import strutils
import times
import asyncdispatch

type
    LinkCheckResult = ref object
        link: string
        state: bool

proc checkLink(link: string): LinkCheckResult =
    var client = newHttpClient()
    try:
        return LinkCheckResult(link: link, state: client.get(link).code == Http200)
    except:
        return LinkCheckResult(link: link, state: false)

proc sequentialLinkChecker(links: seq[string]): void =
    for index, link in links:
        if link.strip() != "":
            let result = checkLink(link)
            echo result.link, " is ", result.state

let links = @["https://www.google.com.eg", "https://yahoo.com",
        "https://reddit.com", "https://none.nonadasdet", "https://github.com", ""]

proc checkLinkAsync(link: string): Future[LinkCheckResult] {.async.} =
    var client = newAsyncHttpClient()

    let future = client.get(link)
    yield future
    if future.failed:
        return LinkCheckResult(link: link, state: false)
    else:
        let resp = future.read()
        return LinkCheckResult(link: link, state: resp.code == Http200)

proc asyncLinksChecker(links: seq[string]) {.async.} =
    # clients.maxRedirects = 0
    var futures = newSeq[Future[LinkCheckResult]]()
    for index, link in links:
        if link.strip() != "":
            futures.add(checkLinkAsync(link))

    # waiter -> call async proc from sync proc, await -> call async proc from asyc proc
    let done = await all(futures)
    for x in done:
        echo x.link, " is ", x.state

proc run(files: seq[string]) =
    echo "LINKS: " & $links
    echo "SEQUENTIAL:: "
    var t = epochTime()
    sequentialLinkChecker(links)
    echo epochTime() - t
    echo "ASYNC:: "
    t = epochTime()
    waitFor asyncLinksChecker(links)
    echo epochTime() - t

proc main() =
    echo "Param count: ", paramCount()

    if paramCount() == 1:
        let linksfile = paramStr(1)
        var f = open(linksfile, fmRead)
        let links = readAll(f).splitLines()
        run(links)
    else:
        run(links)

main()
