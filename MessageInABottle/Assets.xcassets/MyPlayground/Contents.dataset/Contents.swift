import UIKit

let constant: Int = 0

var variable = 12

variable = 10

print(variable + constant)

func function() {
    print(variable * constant)
}

var functionalVar: Int = {
    let number = 2
    return number
}()

func paramter(x: Int) -> Int {
    return x
}

if "hello" == "hello" {
    print("True")
} else {
    print("False")
}

enum sportsTeans {
    case pats
    case jets
    case browns
    case broncos
}

let favoriteTeam: sportsTeans = .jets

switch favoriteTeam {
case .pats:
    print("Great Team")
default:
    print("Would probably lose to the pats")
}

struct User {
    let username: String
    var password: String
    var name: String
    var dob: String
}

let users: [User] = [

User(username: "sdubois18", password: "password", name: "Sam", dob: "6-8-2000"),
User(username: "username", password: "betterPassword", name: "Bob", dob: "something"),

]

for user in users {
    if user.name == "Sam" {
        print("They are really awesome")
    }
}

struct engine {
    var name: String
    var cylinders: Int
    var size: String
}

struct car {
    var engine: engine
    var numberOfDoors: Int
    var model: Int
    var name: String
}

let engineOne = engine(name: "Ford", cylinders: 6, size: "320L")

var carOne = car(engine: engineOne, numberOfDoors: 6, model: 12, name: "F150")

print(carOne.engine.cylinders)



