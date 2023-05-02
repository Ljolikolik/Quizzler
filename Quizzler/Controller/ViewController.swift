//
//  ViewController.swift
//  Quizzler
//
//  Created by Ольга Шовгенева on 14.04.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var thirdAnswer: UIButton!
    @IBOutlet weak var secondAnswer: UIButton!
    @IBOutlet weak var firstAnswer: UIButton!
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.chekAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
         
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
                
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text =  "Score: \(quizBrain.getScore())"
        firstAnswer.setTitle(quizBrain.getAnswer()[0], for: .normal)
        secondAnswer.setTitle(quizBrain.getAnswer()[1], for: .normal)
        thirdAnswer.setTitle(quizBrain.getAnswer()[2], for: .normal)
        firstAnswer.backgroundColor = UIColor.clear
        secondAnswer.backgroundColor = UIColor.clear
        thirdAnswer.backgroundColor = UIColor.clear
    }
}

