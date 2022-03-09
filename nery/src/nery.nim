import macros
import fusion/matching

type
    Id* = object
        name*, alias*, prefix*: string
    NeryKind* = enum
        nkSelect
    Order* = enum
        asc, desc
    OrderBy* = object
        id*: Id
        order*: Order
    Nery* = ref object
        id*: Id
        orderBy*: seq[OrderBy]
        case kind*: NeryKind
        of nkSelect:
            columns*: seq[Id]

proc neryImpl(body: NimNode): Nery =
    result = Nery()

    if body.matches(StmtList[Command[@kind is Ident(), @table]] | StmtList[Command[@kind is Ident(), @table, StmtList[all @stmts]]]):
        # echo "matches"
        case kind.strVal:
        of "select":
            # echo "Do Something"
            result.kind = nkSelect
            if table.matches(@tableName is Ident()):
                result.id = Id(name: tableName.strVal)
            if table.matches(infix[@asinf is Ident(), @tableName is Ident(), @tableAlias is Ident()]):
                result.id = Id(name: tableName.strVal, alias: tableAlias.strVal)

            for stmt in stmts:
                if stmt.matches(@col is Ident()):
                    result.columns.add(Id(name: col.strVal))
                if stmt.matches(infix[@asinf is Ident(), @col is Ident(), @alias is Ident()]):
                    result.columns.add(Id(name: col.strVal, alias: alias.strVal))
                if stmt.matches(Call[@id is Ident(), @subStmtList]):
                    if id.strVal == "orderBy":
                        for subStmt in subStmtList:
                            if subStmt.matches(@col is Ident()):
                                result.orderBy.add(OrderBy(id: Id(name: col.strVal), order: asc))
                            
                            if subStmt.matches(Command[@col is Ident(), @order is Ident()]):
                                let o = case order.strVal:
                                    of "asc": asc
                                    of "desc": desc
                                    else:
                                        error("Invalid order " & order.strVal)
                                        return
                                result.orderBy.add(OrderBy(id: Id(name: col.strVal), order: o))

        else:
            error("Invalid Kind")
            return

macro nery*(body: untyped): untyped =
    # echo body.treeRepr
    result = newLit(neryImpl(body))