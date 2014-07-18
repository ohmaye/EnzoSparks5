// Playground - noun: a place where people can play

import UIKit

let array = [ 1, 2, 3, 4, 5, 6]
array.map { (i) -> Int in return i * 3 }

func incrementor(inc : Int) -> () -> Int {
    var value : Int = 0
    func incrementor() -> Int {
        value += inc
        return value
    }
    return incrementor
}

let f = incrementor(10)
f()
f()
f()
let a = incrementor(20)
a()
a()
f()
f()
a()
let b = a
b()
a()
b()
