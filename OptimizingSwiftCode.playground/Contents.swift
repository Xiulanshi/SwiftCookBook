//: Playground - noun: a place where people can play

import UIKit

//1.9 Optimizing your swift code
// You want to adopt some simple practices that can make your swift code run much faster than before.
// 1. Enable whole module optimization on your code.
// 2. Use value types (such as structs) instead of reference types where possible.
// 3. Consider using final for classes, methods, and variables that aren't going to be overridden.
// 4. Use the CFAbsolutTimeGetCurrent function to profile your app inside your code.
// 5. Always use Instruments to profile your code and find bottlenecks.

class Person{
    let name: String
    let age: Int
    init(name: String, age: Int){
        self.name = name
        self.age = age
    }
}

func exmaple1(){
    
    var x = CFAbsoluteTimeGetCurrent()
    var array = [Person]()
    
    for _ in 0..<100000{
        array.append(Person(name: "Foo", age: 30))
    }
    
    //go through the times as well
    for n in 0..<array.count{
        let _ = array[n]
    }
    
    x = (CFAbsoluteTimeGetCurrent() - x) * 1000.0
    
    print("Took \(x) milliseconds")
}

//exmaple1()

struct PersonStruct {
    let name: String
    let age: Int
}

func example2(){
    var x = CFAbsoluteTimeGetCurrent()
    
    var array = [PersonStruct]()
    
    for _ in 0..<1000000{
        array.append(PersonStruct(name: "Foo", age: 30))
    }
    
    //go through the items as well
    for n in 0..<array.count{
        let _ = array[n]
    }
    
    x = (CFAbsoluteTimeGetCurrent() - x) * 1000.0
    
    print("Took \(x) milliseconds")
}

//example2()

class Animal{
    func move(){
        if "Foo".characters.count > 0{
            //some code
        }
    }
}

class Dog: Animal{
    
}

func exmaple3(){
    var x = CFAbsoluteTimeGetCurrent()
    var array = [Dog]()
    for n in 0..<100000{
        array.append(Dog())
        array[n].move()
    }
    x = (CFAbsoluteTimeGetCurrent() - x) * 1000.0
    print("Took \(x) milliseconds")
}

//exmaple3()

class AnimalOptimized {
    final func move(){
        if "Foo".characters.count > 0{
            //some code
        }
    }
}

class DogOptimized: AnimalOptimized {
    
}

func example4(){
    var x = CFAbsoluteTimeGetCurrent()
    var array = [DogOptimized]()
    for n in 0..<100000{
        array.append(DogOptimized())
        array[n].move()
    }
    x = (CFAbsoluteTimeGetCurrent() - x) * 1000.0
    print("Took \(x) milliseconds")
}









