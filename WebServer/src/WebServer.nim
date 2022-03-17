import htmlgen
import jester
import norm/[model, sqlite]
import json

type
    Employee = ref object of Model
        firstName, lastName: string
        company: Company
    Company = ref object of Model
        name: string

func newCompany(name = ""): Company =
    Company(name: name)

func newEmployee(firstName = "", lastName = "", company = newCompany()): Employee =
    Employee(firstName: firstName, lastName: lastName, company: company)

let dbConn = open(":memory:", "", "", "")

routes:
    get "/":
        resp h1("Welcome to Employee Central")
    post "/deploy":
        dbConn.createTables(newEmployee())
        var eCorp = newCompany("ECopr")
        var foobar = newCompany("FooBar")
        var employees = [newEmployee("Navid", "Dezashibi", eCorp), newEmployee(
                "James", "Hetfield", foobar)]
        dbConn.insert(employees)
        resp "Deployment Complete"
    get "/employees":
        var employees = @[newEmployee()]
        dbConn.select(employees, "Employee.firstName = ?", "Navid")
        resp %*employees
