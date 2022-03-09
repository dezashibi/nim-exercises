# Package

version       = "0.1.0"
author        = "Navid Dezashibi"
description   = "Web server"
license       = "MIT"
srcDir        = "src"
bin           = @["WebServer"]


# Dependencies

requires "nim >= 1.6.4", "jester", "norm"
