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

//1. Specify a set of conditions for your methods.
//2. Bind variables to optionals and use those variables in the rest of your method's body.

func stringFromData(data: NSData?) -> String? {
    
    guard let data = data,
    let str = NSString(data: data, encoding: NSUTF8StringEncoding)
        where data.length > 0 else {
            return nil
    }
    
    return String(str)
    
}

if let _ = stringFromData(nil){
    print("Got the string")
} else {
    print("No string came back")
}

//guard let data = NSString(string: "Foo")
//    .dataUsingEncoding(NSUTF8StringEncoding) where data.length > 0 else{
//        return
//}
//
//if let str = stringFromData(data){
//    print("Got the string \(str)")
//} else {
//    print("No string came back")
//}

func exmaple3(firstName firstName: String?, lastName: String?, age:UInt8?){
    
    guard let firstName = firstName, let lastName = lastName, _ = age where
        firstName.characters.count > 0 && lastName.characters.count > 0 else {
            return
    }
    
    print(firstName, " ", lastName)
}

//1.3 Ensuring the Execution of Code Blocks Before Exiting Methods
// You want to ensure that some code always gets executed, for instance to do some cleanup.
// Use the defer syntax.

enum Errors2: ErrorType{
    case EmptyString
}

func imageForString(str: String, size: CGSize) throws -> UIImage{
    
    defer{
        UIGraphicsEndImageContext()
    }
    
    UIGraphicsBeginImageContextWithOptions(size, true, 0)
    
    if str.characters.count == 0{
        throw Errors2.EmptyString
    }
    
    //draw the string here ...
    
    return UIGraphicsGetImageFromCurrentImageContext()
}

do{
    let i = try imageForString("Foo", size: CGSize(width: 100, height: 50))
    print(i)
} catch let excep{
    print(excep)
}

//1.4 Checking for API Availability
// You want to check whether a specific API is available on the host device running your code.
// USe the #available syntax.

enum Errors3 : ErrorType{
    case EmptyData
}

func bytesFromData(data: NSData) throws -> [UInt8]{
    
    if (data.length == 0){
        throw Errors3.EmptyData
    }
    
    var buffer = [UInt8](count: data.length, repeatedValue: 0)
    
    if #available(iOS 8.1, *){
        data.getBytes(&buffer, length: data.length)
    } else {
        data.getBytes(&buffer)
    }
    
    return buffer
}

func example1(){
    
    guard let data = "Foo".dataUsingEncoding(NSUTF8StringEncoding) else {
        return
    }
    
    do{
        let bytes = try bytesFromData(data)
        print("Data = \(bytes)")
    } catch {
        print("Failed to get bytes")
    }
}















