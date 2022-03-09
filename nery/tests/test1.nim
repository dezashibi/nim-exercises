# This is just an example to get you started. You may wish to put all of your
# tests into a single file, or separate them into multiple `test1`, `test2`
# etc. files (better names are recommended, just make sure the name starts with
# the letter 't').
#
# To run these tests, simply execute `nimble test`.

import unittest

import nery

test "Without Columns":
    let res = nery:
        select myDbTable
    assert res.id.name == "myDbTable"
    assert res.columns == @[]


test "With Columns":
    let res = nery:
        select myDbTable:
            col1
            col2
    assert res.id.name == "myDbTable"
    assert res.columns == @[Id(name: "col1"), Id(name: "col2")]


test "Columns with alias":
    let res = nery:
        select myDbTable:
            col1 as myCol1
            col2
    assert res.id.name == "myDbTable"
    assert res.columns == @[Id(name: "col1", alias: "myCol1"), Id(name: "col2")]


test "Table with alias":
    let res = nery:
        select myDbTable as aliasTable:
            col1
            col2
    assert res.id.name == "myDbTable"
    assert res.id.alias == "aliasTable"
    assert res.columns == @[Id(name: "col1"), Id(name: "col2")]


test "Order By test":
    let res = nery:
        select myDbTable:
            col1
            col2
            orderBy:
                col3
                col4 asc
                col5 desc
    assert res.id.name == "myDbTable"
    assert res.columns == @[Id(name: "col1"), Id(name: "col2")]
    assert res.orderBy == @[OrderBy(id: Id(name: "col3"), order: asc), OrderBy(id: Id(name: "col4"), order: asc), OrderBy(id: Id(name: "col5"), order: desc)]