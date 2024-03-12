package rules

import rego.v1

default allow = false

users := {
    "alice":   {"manager": "charlie", "title": "salesperson"},
    "bob":     {"manager": "charlie", "title": "salesperson"},
    "charlie": {"manager": "dave",    "title": "manager"},
    "dave":    {"manager": null,      "title": "ceo"}
}

allow if {
    input.path = ["cars"]
    input.method = "GET"
}

allow if {
    input.path = ["cars"]
    input.method = "POST"
    user_is_manager
}

allow if {
    input.path = ["cars", cardid]
    input.method = "GET"
    user_is_employee
}

user_is_employee if {
    users[input.user]
}

user_is_manager if {
    users[input.user].title != "salesperson"
}












































































































































