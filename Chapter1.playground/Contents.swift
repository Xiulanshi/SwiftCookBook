//: Playground - noun: a place where people can play

import UIKit

//1.1 Handling Errors in Swift.

//how to throw and handle exception in swift?
// To throw an exception, use the throw syntax. To catch exception, use the do, try, catch syntax.
enum Errors : ErrorType{
    case EmptyFirstName
    case EmptyLastName
}

func fullNameFromFirstName(firstName: String, lastName: String) throws -> String {
    
    if firstName.characters.count == 0 {
        throw Errors.EmptyFirstName
    }
    
    if lastName.characters.count == 0 {
        throw Errors.EmptyLastName
    }
    
    return firstName + " " + lastName
}


do{
    let fullName = try fullNameFromFirstName("Foo", lastName: "Bar")
    print(fullName)
} catch {
    print("An error occurred")
}


do{
    let fullName = try fullNameFromFirstName("Foo", lastName: "Bar")
    print(fullName)
}
catch let err as Errors{
    //Handle this specific type of error here
    print(err)
}
catch let ex as NSException{
    //handle exceptions here
    print(ex)
}
catch {
    //otherwise, do this
}

//1.2 Specifying Preconditions for Methods
// You want to make sure a set of conditions are met before continuing with the flow of your method.
// Use the guard syntax.

