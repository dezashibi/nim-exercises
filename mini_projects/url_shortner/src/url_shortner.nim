import jester, asyncdispatch, htmlgen, json, os, strutils, strformat, db_sqlite

# hostname can be something configurable "http://ni.m:5000"
let hostname = "localhost:5000"
var theDb: DbConn

if not fileExists("/tmp/mytest.db"):
  theDb = open("/tmp/mytest.db", "", "", "")
  theDb.exec(sql("""create table urls (
      id        INTEGER PRIMARY KEY,
      url       VARCHAR(255) NOT NULL
    )"""
  ))
else:
  theDb = open("/tmp/mytest.db", "", "", "")

routes:
  get "/home":
    var htmlout = """
    <html>
      <title>NIM SHORT</title>
      <head>
        <script
      src="https://code.jquery.com/jquery-3.3.1.min.js"
      integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
      crossorigin="anonymous"></script>
      <script>
        function postData(url, data) {
          // Default options are marked with *
          return fetch(url, {
            body: JSON.stringify(data), // must match 'Content-Type' header
            cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
            credentials: 'same-origin', // include, same-origin, *omit
            headers: {
              'user-agent': 'Mozilla/4.0 MDN Example',
              'content-type': 'application/json'
            },
            method: 'POST', // *GET, POST, PUT, DELETE, etc.
            mode: 'cors', // no-cors, cors, *same-origin
            redirect: 'follow', // manual, *follow, error
            referrer: 'no-referrer', // *client, no-referrer
          })
          .then(resp => resp.json())
      }
      $(document).ready(function() {
        $('#btnsubmit').on('click', function(e){
          e.preventDefault();
          postData('/shorten', {url: $("#url").val()})
          .then( data => {
            let id = data["id"]
            $("#output").html(`<a href="%%hostname/${id}">Shortlink: ${id}</a>`);
           });
      });
    });
      </script>
      </head>
      <body>
          <div>
            <form>
              <label>URL</label>
              <input type="url" name="url" id="url" />
              <button id="btnsubmit" type="button">SHORT!</button
            </form>
          </div>
          <div id="output">
          </div>
      </body>
    </html>

    """
    htmlout = htmlout.replace("%%hostname", hostname)
    resp htmlout

  post "/shorten":
    let url = parseJson(request.body).getOrDefault("url").getStr()
    if not url.isEmptyOrWhitespace():
      var id = theDb.getValue(sql"SELECT id FROM urls WHERE url=?", url)
      echo "ID: " & $id
      if id.isEmptyOrWhitespace():
        id = $theDb.tryInsertId(sql"INSERT INTO urls (url) VALUES (?)", url)
      var jsonResp = $(%*{"id": id})
      echo "RESP JSON: ", jsonResp
      resp Http200, jsonResp
    else:
      resp Http400, "Pleasenspecify url in the posted data."

  get "/@Id":
    let url = theDb.getValue(sql"SELECT url FROM urls WHERE id=?", @"Id")
    if url.isEmptyOrWhitespace():
      resp Http404, "Don't know that url"
    else:
      redirect url

runForever()
theDb.close()
