//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// optional is just an enum
// uncomment below to show what happens!
//  let a: String? = nil
// x =  Optional<String>.None
// we've set the optional to case none
let b: String? = "hello"
// x = Optional.<String>.Some("hello")
// we've set the optional to case Some of Type String containing the string "Hello"
// We may unwrap this

//var  y = a!
// ---is ---
//switch a{
//    case .some(let value): y = value
//    case .none:
//    break // raise an exception ---CRASH!
//}

//let x: String? = a!

if let y = b {
    // do something with y
    print(b!)
}

// -- is --

switch b {
    case .some(let y): break
// do something with y
    // we're switching on x but if none nothing happens
    case .none:
        break
    // no crash
}

// Optionals can be "chained"
// like in the calc, want to get the text - want to get the value
// if let label... unwrap... if let... unwrap...

var display: UILabel? // iboutlet
if let label = display{
    if let text = label.text{
        let x = text.hashValue
        print ("HASHVALUE")
    }
}

/// BETTER -->

if let x = display?.text?.hashValue{
    print ("MORE HASHVALUES")
}

// would return optional int
// display optional
// text optional


// Optional ??
// also the "defaulting" operator ??

// what if we want to put a string into a UILabel, but if its nil put " " (space) in the UILabel?
// we're providing a default value in case something IS nill

let s: String = "MOREEE HASHVALUES" // may be nil
// at worst may be a space
// so has some value rather than no value
if s != nil {
    display?.text = s
} else {
    display?.text = " "
}

//can be expressed as 
display?.text = s ?? " "

// tuples are a type in swift to build a type in swift out of other types
// creating x

let c: (String, Int, Double) = ("hello", 5, 0.85)
// how to get values out of the double?
// local var names and set to var
let (word, number, value) = c // tuple elements named when accessing the tuple
// this is just putting something into a tuple
print (word)
print (number)
print(value)

// can name each thing in tuple
let d: (w: String,i: Int,v: Double) = ("hello", 5, 0.85)
print(d.w)
print(d.i)
print(d.v)
//can also rename on the fly
let (wrd, num, val) = d
// can ignore some of the values from a tuple (_->)
// can return multiple functions from a value

func getSize() -> (weight: Double, height: Double) {return (250, 80)}

let e = getSize()
print("weight is \(e.weight)")

//range is just two endpoints
// generic
// indexes into something

// start and end index
// a range would be a range<int>
// string range is not int
// range for that would be a Range<String.Index>

// special syntax for specifying a Range: either ... (inclusive)  or ..< (openended)
// for loops would be used with range
let array = ["a", "b", "c", "d"]
let subArray = array[2...3]
let subArray2 = array [2..<3]
for i in 27...104{print(i)}


// classes/struct/enum
// declared same way
// can have properties and functions
// enums cannot have stored properties
// stored can have cases
// all can have initializers

// DIFFERENCES
// inherit class only
// struc doesnt live on heap

//value struc/enum
// copied when passed when argument to a function --
// copied when assgned to diff variable --
// immutable when assigned to a let variable cannot append
// function par are all constant
// copy semantics -- must mark all functions that may mutate functions that may mutate respective functions

// reference types (Classes)
// references are counted are automatically - - no garbage collection
// constant pointers to a class = let can still mutate by calling methods and changing properties
// lives in the heap. 
// when passing a pointer to a class, passing a pointer not a copy

// when to use?
// usually class over struct
// struct for fundamental types - - smaller things that are self contained that are copied by value- value semantics
// big-  choose class

// methods
// full semantics
// naming of methods // calling of methods

// all parameters have internal and external name
// INTERNAL name is the name of the local var you use inside the method
// the EXTERNAL NAME is what the caller uses when they call the method
// you can put an underbar _ if you dont want callers to use an external name at all for a given parameter
// first __ is default
// for other the internal is the external
// any parameters external name can be changed, even forcing the first to have one
// anti to force a first or supress others

// methods are overridable
// possible to mark final, no one can subclass it
// can mark an entire class as final
// both types and instances can have methods and properties
// the type can have functions

var f: Double = 0.5
if f.sign == .minus{
    f = Double.abs(f)
}
//minus is an instance property of f double
// abs is a type method of double
// static func abs(d: Double) ->

// you can also observe changes to a property
// you can observe changes with willset/didset
var someStoredProperty: Int = 42{
    willSet{ //newValue is the newValue
           newValue
}
    didSet{oldValue}
}

//override var inherritedProperty {
//willSet{}
//didSet{}
//}
// var operations: Dictionary <String, Operation> = [...] {
// willSet{ will execute if operation is added/removed}
// didSet{ will execute if operation is added/removed}
// }

// lazy initialization 
// vars will not actually happen untill called
lazy var CalculatorBrain()
lazy var someProperty: Type{
    // construct the value of someProperty here
    return<the constructed value>
    // initialize this by executing code here
}()

lazy var myProperty = self.initializeMyProperty()
// satisfies must init all your props
// must all be vars
// dependencies

// ARRAYS

var h = Array<String>()
// is the same thing as...
var i = [String]()
// [T]() calling initializer with no arguments. creating instance
let animals = ["Giraffe","Cow", "Dog", "Bird"]
animals.append("Ostrich")// wont compile -- LET...but if var---then yus
animals.animal = animals[5] // index out of bounds

// enumerating
for animal in animals {
print(animal)
}

// very pythonic

// methods on arrays
// filter(includeElement: (T)->bool) -[T]
let bigNumbers = [2,34, 3984, 1, 3].filter({$0>20})
//map creates a new array by transforming each to different. transformed
//closure, when last part of func, doesnt need parenth
let stringgs = [String] = [1,2,3].map{String($0)}
// reduce, reduces single array to a single result.
let sum: Int =[1,2,3].reduce(0){$0+$1}


//DICTIONARY
var pac10 = [String: Int]()
pac10 = ["Stanford": 1, "Cal": 10]
for (key,value) in pac10{
    print ("\(key) = \(value)")
}

// String -- unicode...uh...yeah
var characters: String.CharacterView{get}
// looks like an array of char

// NSObject
// base class for all Objective - C classes
// no base class for all Swift
// obc must be of all NSObject
// legal to subclass in swift

// NSNumber
// obj=c no such thing as ?? number? 
// in obj c - array of objects, double int must be wrapped properly
// solves problem of wrapping structs from c

// NSData
// unstructured data, pass data
// save restore transmit

// initialization
// when init method needed?
// init methods are not common because properties have defaults set using =
// can use lazy
// optionals
// 
// sometimes may need one because you cant use those mechanisms

// you get some "free"
// structs get "free" inits
// if you provide own inits, you stop get the "free one"

// legality
// can set property even reset
// can set constant properties (properties declared with let) -- rare though
// can call one other init method
// can call superclass inits

// there are RULES
// things you must do
// by the time its done
// all properties must have values
// there are two types of init methods, convenience inits and designated inits

// you must initialize all properties introduced by your class before calling a superclass init
// a designated must and can ONLU call a designated init that is in its immediate superclass
// you must call a superclass init befoe you you assign a value to an inherited prop

//          designated                                     convenience
//
//            Desig init                                     Convenience init
//              Designated Properties                          init in own class
//                Super init
//                  Super properties
//                                                                            
//
// conven init must and only call within its own class
// mst call that before it can set any property values
// calling other inits must be complete before you can access props or invoke methods


/// inheriting init
// if you dont implement any designated inits you'll inherit all superclass designated
// if you override all of your superclass, you inherit all convenience
// implements no you inherit all of superclass init
// any init inherited qualifies to satisfy any of the rules

// required init
// class can mark one or more require -- must implement
// any subclass must implement

// Failable init
// declared with a? or ! after init it returns optional 

// creating objects
// usually can create via its type name

//AnyObject is a specialtype
// commonly used for compatability
// ID - pointer for object of unknown class
// Any vs AnyObject - AnyObect points to any class- any to ANYTHING
// sometimes transitioning to MVCs

// the sender that initiated the transition,
// the sender has to be AnyObject
func touchDigit(sender: AnyObject) // could have been a button or slider since UIButton
// or when you want to return an object and you dont want the caller to know its class
var cookie: AnyObject

// How do we use a var of type AnyObject?
// use the as? keyword to coerce
let ao: AnyObject =...
if let foo = ao as? SomeClass{
    // here there's going to be a local variable foo of Type SomeClass
} else {
    
}

// example

@IBAction func touchDigit(sender: AnyObject){ //sender is AnyObject, not specifying type
    if let sendingButton = sender as? UIButton { // if sendingButton is UIButton then cast as UIButton
        let digit = sendingButton.CurrentTitle //
    }
} else if let sendingSlider = sender as? UISlider { //if sendingButton is UISlider then cast as UISlider
    let digit = String(Int(sendingSlider.value))
}

// property list
// NSUserDefaults
// storage mechanism for prop list data
// small database for things like  settings
setObject(AnyObject, forKey:String)
objectForKey(String)->...

// creating
// shared class with shared
let defaults = NSUserDefaults.standardUserDefaults()
//Then read and write
defaults.objectforkey
defaults
//def!.syncronize()
//wanted to get the program the