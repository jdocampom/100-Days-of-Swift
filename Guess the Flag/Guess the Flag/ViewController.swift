//
//  ViewController.swift
//  Guess the Flag
//
//  Created by Juan Diego Ocampo on 27/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var countries = [String]()
    var correctAnswer = 0
    var score = 0
    var timesPlayed = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        
        button1.tag = 0
        button2.tag = 1
        button3.tag = 2
        
        //        button1.layer.borderWidth = 1
        //        button2.layer.borderWidth = 1
        //        button3.layer.borderWidth = 1
        //
        //        button1.layer.borderColor = UIColor.lightGray.cgColor
        //        button2.layer.borderColor = UIColor.lightGray.cgColor
        //        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        correctAnswer = Int.random(in: 0...2)
        title = "\(countries[correctAnswer].uppercased()) - Score: \(score)"
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        var message: String
        timesPlayed += 1
        if timesPlayed <= 9 {
            if sender.tag == correctAnswer {
                score += 1
                title = "Correct"
                message = "Your score is \(score)."
            } else  {
                score -= 1
                title = "Wrong"
                message = "That was the flag of \(countries[sender.tag].capitalized). \nYour score is \(score)."
            }
        } else {
            sender.tag == correctAnswer ? (score = score + 1) : (score = score)
            title = "Game over"
            message = "Your final score is \(score)."
            timesPlayed = 0
            score = 0
        }
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
    }
    
}

