//: # Lesson 5 Exercises - Defining and Calling Functions

import UIKit

//: __Problem 1.__
//:
//:Earlier we used the method, removeAtIndex() to remove the first letter of a string. This method belongs to the String class. See if you can use this same method to return the last letter of a string.

//:Test out your discovery below by returning the last letter of the String, "bologna".
var word = "bologna"
func removeLastLetterOf(word: String) -> Character {
    var w = word
    return w.removeAtIndex(word.endIndex.predecessor())
}


//: __Problem 2__
//:
//: Write a function called combineLastCharacters. It should take in an array of strings, collect the last character of each string and combine those characters to make a new string to return. Use the strategy you discovered in Problem 1 along with a for-in loop to write combineLastCharacters. Then try it on the nonsenseArray below.
var nonsenseArray = ["bungalow", "buffalo", "indigo", "although", "Ontario", "albino", "%$&#!"]
func combineLastCharactersOf(inputArray:[String]) -> String {
    var result: String = ""
    for word in inputArray {
        result.append(removeLastLetterOf(word))
    }
    return result
}
combineLastCharactersOf(nonsenseArray)
//: __Problem 3__
//:
//: Imagine you are writing an app that keeps track of what you spend during the week. Prices of items purchased are entered into a "price" textfield. The "price" field should only allow numbers, no letters.

//: NSCharacterSet.decimalDigitCharacterSet() is used below to define a set that is only digits. Using that set, write a function that takes in a String and returns true if that string is numeric and false if it contains any characters that are not numbers.

//: __3a.__ Write a signature for a function that takes in a String and returns a Bool

//: __3b.__ Write a for-in loop that checks each character of a string to see if it is a member of the "digits" set. Use the .unicodeScalars property to access all the characters in a string. Hint: the method longCharacterIsMember may come in handy.

let digits = NSCharacterSet.decimalDigitCharacterSet()
let a = "1"
let b = a + "b"
func isNumeric(input: String) -> Bool {
    if input.isEmpty {
        return false
    }
    for char in input.unicodeScalars {
        if !NSCharacterSet.decimalDigitCharacterSet().longCharacterIsMember(char.value) {
            return false
        }
    }
    return true
}
isNumeric(a)
isNumeric(b)
//: __Problem 4__
//:
//: Write a function that takes in an array of dirtyWord strings, removes all of the four-letter words, and returns a clean array.
let dirtyWordsArray = ["phooey", "darn", "drat", "blurgh", "jupiters", "argh", "fudge"]
func removeDirtyWordsIn(inputArray: [String]) -> [String] {
    var cleanArray = [String]()
    for word in inputArray {
        if word.characters.count != 4 {
            cleanArray.append(word)
        }
    }
    return cleanArray
}
removeDirtyWordsIn(dirtyWordsArray)

//: __Problem 5__
//:
//: Write a method, filterByDirector, that belongs to the MovieArchive class.  This method should take in a dictionary of movie titles and a string representing the name of a director and return an array of movies created by that director. You can use the movie dictionary below. To test your method, instantiate an instance of the MovieArchive class and call filterByDirector from that instance.

var movies:Dictionary<String,String> = [ "Boyhood":"Richard Linklater","Inception":"Christopher Nolan", "The Hurt Locker":"Kathryn Bigelow", "Selma":"Ava Du Vernay", "Interstellar":"Christopher Nolan"]

class MovieArchive {
    
    func filterByDirector(director: String, movieDict: [String:String]) -> [String] {
        var result = [String]()
        let filtered = movieDict.filter { $0.1 == director }
        for (movie, _) in filtered {
            result.append(movie)
        }
        return result
    }

}

let myArchive = MovieArchive()
myArchive.filterByDirector("Kathryn Bigelow", movieDict: movies)

