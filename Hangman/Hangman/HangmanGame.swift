//
//  HangmanGame.swift
//  Hangman
//
//  Created by Daniel Shiferaw on 2/20/18.
//  Copyright © 2018 iOS DeCal. All rights reserved.
//

import Foundation

class HangmanGame {
    
    init() {}
    
    var original_string: String = ""
    
    var missingCharacters:[Character]=[]
    
    func generateString() -> String {
        let hangmanPhrases = HangmanPhrases()
        
        // Generate a random phrase for the user to guess
        let phrase: String = hangmanPhrases.getRandomPhrase()
        return phrase
    }
    
    //Generates a random number
    func generateRandomNumber(to: Int) -> Int {
        var chars = Array(getOriginalString())
        while (true) {
            let random = Int(arc4random_uniform(UInt32(to)))
            if (chars[random] != " ") { return random }
        }
    }
    
    //Generates a String with missing characters
    func generateManipulatedString(word:String) -> String {
        var indexesOfMissingCharacters:[Int]=[]
        var generatedNumbers:[Int]=[]
        for _ in 0...getNumOfMissingCharacters(w: word) {
            var rand = generateRandomNumber(to: word.count)
            while (generatedNumbers.contains(rand)) {
                rand = generateRandomNumber(to: word.count)
            }
            generatedNumbers.append(rand)
            indexesOfMissingCharacters.append(rand)
        }
        var chars:[Character] = Array(word)
        for i in indexesOfMissingCharacters {
            missingCharacters.append(chars[i-1])
            chars[i-1] = "-"
        }
        return String(chars)
     }
    
    
    //Returns how many characters in the String should be missing
    func getNumOfMissingCharacters(w: String) -> Int {
        let length = w.count
        if length < 4 { return 2 }
        else if length < 8 { return 3 }
        else if length < 15 { return 5 }
        else { return 7 }
    }
    
    //Returns a manipulated String
    func getManipulatedString() -> String {
        original_string = generateString()
        return generateManipulatedString(word: original_string)}
    
    //Returns solution
    func getSolution() -> [Character] {
        return missingCharacters
    }
    
    func getOriginalString() -> String {
        return original_string
    }
    
    
    
}
