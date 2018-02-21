//
//  HangmanViewController.swift
//  Hangman
//
//  Created by Daniel Shiferaw on 2/20/18.
//  Copyright © 2018 iOS DeCal. All rights reserved.
//s
import UIKit

class HangmanViewController: UIViewController {
    
    var solutions: [Character] = []
    
    var trial_index: Int = 0
    
    @IBOutlet weak var textDisplay: UITextField!
    
    var _numOfIncorrectGuesses: Int = 0
    
    @IBAction func restartButtonClicked(_ sender: Any) {
        viewDidLoad()
    }
    
    @IBAction func exitButtonClicked(_ sender: Any) {
        exit(0)
    }
    
    @IBOutlet weak var stage: UIImageView!
    
    @IBOutlet weak var incorrectGuesses: UILabel!
    
    @IBOutlet weak var numOfIncorrectGuesses: UILabel!
    
    @IBOutlet weak var guess: UITextField!
    
    @IBAction func Guess(_ sender: Any) {
        
        if let validInput = guess.text {
            if (Character(validInput) == solutions[trial_index]) {
                //guess is correct
                if let validTextDisplay = textDisplay.text {
                    textDisplay.text = replace(word: validTextDisplay, c: solutions[trial_index])
                    trial_index = trial_index + 1
                    return
                }
                //guess is incorrect
                incorrectGuesses.text = String(incorrectGuesses.text! + validInput)
                if let n:String = numOfIncorrectGuesses.text {
                    if let num = Int(n) {
                        numOfIncorrectGuesses.text = String(num + 1)
                    }
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textDisplay.text = " "
        incorrectGuesses.text = "Incorrect Guesses: "
        numOfIncorrectGuesses.text = "0"
        guess.text = " "
        let hangmanGame = HangmanGame()
        textDisplay.text = hangmanGame.getManipulatedString()
        solutions = hangmanGame.getSolution()
        numOfIncorrectGuesses.text = "\(_numOfIncorrectGuesses)"
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func replace(word: String, c: Character) -> String {
        var toArray = Array(word)
        var count:Int = 0
        while !(count < word.count && !(toArray[count] == "-")) { count = count + 1 }
        toArray[count] = c
        return String(toArray)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
