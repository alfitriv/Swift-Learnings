import UIKit

var multiplyClosure = { (a: Int, b: Int) -> Int in
    return a * b
}

let result = multiplyClosure(4,2)


func multiplyFunction(a: Int, b: Int) {
    a * b
}

let result2 = multiplyFunction(a: 4, b: 2)


//mini-exercises

//“Create a constant array called names that contains some names as strings. Any names will do — make sure there’s more than three. Now use reduce to create a string that is the concatenation of each name in the array.”

//Closure way
let names = ["mila", "mochi", "candy"]

names.reduce("", +)

//Imperative way
var text = ""
for name in names {
     text += name
}
print(text)

extension Array {
    func reduce2<Result>(initialResult: Result, nextPartialResult: (Result, Element) -> Result) -> Result {
        var accumulation = initialResult
        for element in self {
            accumulation = nextPartialResult(accumulation, element)
        }
        return accumulation
    }
    
}

names.reduce2(initialResult: "", nextPartialResult: +)





let numbers = [1,2,3,4]

numbers.map { (number) -> String in
    return String(number)
}

//Make your own map function to transform name array to person object

extension Array {
    
    func map2<T>(transform: (Element) -> T) -> [T]  {
        var newArray: [T] = []
        for element in self {
            newArray.append(transform(element))
        }
        
        return newArray
    }
}

struct Person {
    var name: String
}

names.map2 { (name) -> Person in
    return Person(name: name)
}

//names.filter { (name) -> Bool in
//
//}

//Understanding on value and reference types

var person1 = Person(name: "Mila")
var person2 = person1
person2.name = "Mochi"
person1.name


class Animal {
    var type: String
    
    init(type: String) {
        self.type = type
    }
}

var cat = Animal(type: "mammal")
var cat2 = cat
cat2.type = "reptile"

//“Using the same names array, first filter the array to contain only names that are longer than four characters, and then create the same concatenation of names as in the above exercise. (Hint: You can chain these operations together.)”
var newNames = ""
names.filter { (name) -> Bool in
    if name.count > 4 {
        newNames += name
        print(newNames)
        return true
    } else {
        return false
    }
}

// TODO: Fix the filter2 function since it is still incorrect
extension Array {
    func filter2(_ isIncluded: (Element) -> Bool) -> [Element] {
        var newArray: [Element] = []
        for element in self {
            if true {
                isIncluded(element)
                newArray = [element]
            }
    }
        return newArray
    }
}

names.filter2 { (name) -> Bool in
    name.count > 4
}

names.filter { (name) -> Bool in
    name.count > 4
}

//3. “Create a constant dictionary called namesAndAges that contains some names as strings mapped to ages as integers. Now use filter to create a dictionary containing only people under the age of 18.”

let namesAndAges = ["mila":27, "mochi": 1, "candy": 1]

namesAndAges.filter { (arg) -> Bool in
    var newArg = [String: Int]()
    let (key, value) = arg
    if arg.value < 18 {
        //insert or append to newArg
        print(arg)
        return true
    } else {
        return false
    }
}

//“Using the same namesAndAges dictionary, filter out the adults (those 18 or older) and then use map to convert to an array containing just the names (i.e. drop the ages).”

//TODO: Need to investigate why it prints name 4 times
namesAndAges.filter { (key, value) -> Bool in
    if value > 18 {
        print(key.map({ (name) -> String in
            return key
        }))
        
        return true
    }
    return false
}
