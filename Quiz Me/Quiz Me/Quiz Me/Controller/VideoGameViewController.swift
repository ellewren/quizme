//
//  VideoGameViewController.swift
//  QuizMe
//
//  Created by LaKeisha Wren on 10/17/22.
//

import UIKit
import AVFoundation

class VideoGameViewController: UIViewController {
    
    
    @IBOutlet weak var userScore: UILabel!
    @IBOutlet weak var currentQuestion: UILabel!
    
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!
    
    @IBOutlet weak var quizProgress: UIProgressView!
    
    @IBOutlet weak var timeRemaining: UILabel!
    
    var timer = Timer()
    var count = 11
    var audio: AVAudioPlayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(updateTimer), userInfo:nil, repeats: true)
        
        updateUI()
        
    }
    
    
    var questionNumber = 0
    var score = 0
    
    let videoGameQuiz = [
    
    Question(q: "What is the best-sellng game console of all time?", a: ["Xbox360", "GameCube", "Dreamcast", "PS2"], correctAnswer: "PS2"),
    Question(q: "What is the most played video game of all time?", a: ["Fortnite", "GTAV", "Madden2", "Super Mario"], correctAnswer: "Fortnite"),
    Question(q: "How many people play Roblox monthly?", a: ["3 million", "150 million", "2 billion", "320 million"], correctAnswer: "150 million"),
    Question(q: "Pacman was designed to resemble which food?", a: ["Pizza", "Orange", "Doughnut", "Egg"], correctAnswer: "Pizza"),
    Question(q: "What's the world record for the all-time highest score in Super Mario Bros?", a: ["1,435,100", "2,034,456", "13,234,543", "342,333"], correctAnswer: "1,435,100"),
    Question(q: "Who was the main character in Grand Theft Auto: San Andreas?", a: ["Trevor Philips", "Niko Bellic", "Carl Johnson", "Cedric Jackson"], correctAnswer: "Carl Johnson"),
    Question(q: "Who invited the video game?", a: ["William Higinbotham", "Jim Harthwright", "Allen Cartm", "Bill Benjamin"], correctAnswer: "William Higinbotham"),
    Question(q: "What was the first 3D Mario game?", a: ["Super Mario Sunshine", "Super Mario 64", "Super Mario Bros. 3", "Paper Mario"], correctAnswer: "Super Mario 64"),
    Question(q: "What is the best selling videogame of all time?", a: ["Minecraft", "Tetris", "Wii Sports", "PUBG"], correctAnswer: "Tetris"),
    Question(q: "What is the name of the final course of all Mario Kart video games?", a: ["Bowser's Castle", "Rainbow Road", "Waluigi Pinball", "Mushroom Gorge"], correctAnswer: "Rainbow Road"),
    Question(q: "Mario originated as a character in which video game?", a: ["Donkey Kong", "Super Mario Bros", "Zelda", "Pacman"], correctAnswer: "Donkey Kong"),
    Question(q: "Nintendo began as a company that sold which products?", a: ["Software", "Computers", "Playing cards", "Televisions"], correctAnswer: "Playing cards"),
    Question(q: "Which was the first Nintendo console for optical discs?", a: ["Wii", "Switch", "Nintendo 64", "The GameCube"], correctAnswer: "The GameCube"),
    Question(q: "What was the first video game in the world called?", a: ["Tetris", "Pong", "Tank", "Space Race"], correctAnswer: "Pong"),
    Question(q: "What was the 3rd game in the Zelda series", a: ["The Legend of Zelda", "A Link to the Past", "Link's Awakening", "Ocarina of Time"], correctAnswer: "A Link to the Past")
    
    ]
    

    func getQuestionText() -> String {
        return videoGameQuiz[questionNumber].text
    }
    
    func getAnswers() -> [String] {
        return videoGameQuiz[questionNumber].answers
    }
    
    func getProgress() -> Float {
        return Float(questionNumber) / Float(videoGameQuiz.count)
    }
    
    
    func getScore() -> Int {
        return score
    }
    
    func nextQuestion() {
        
        if questionNumber + 1 < videoGameQuiz.count {
            questionNumber += 1
        } else {
            self.performSegue(withIdentifier: "endVideoGameQuiz", sender: self)
            timer.invalidate()
            audio.stop()
        }
    }

    
    func checkAnswer(userAnswer: String) -> Bool {

        if userAnswer == videoGameQuiz[questionNumber].rightAnswer {
            score += 1
            return true
        } else {
            return false
        }
    }
    
    
    
    
    
    
    @IBAction func answerSelected(_ sender: UIButton) {
        
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = checkAnswer(userAnswer: userAnswer)
        
        if userGotItRight {
            
            let url = Bundle.main.url(forResource: "correct_answer", withExtension: "mp3")
            audio = try! AVAudioPlayer(contentsOf: url!)
            audio.play()
        } else {
            let url = Bundle.main.url(forResource: "wronganswer", withExtension: "mp3")
            audio = try! AVAudioPlayer(contentsOf: url!)
            audio.play()
        }
        nextQuestion()
        restartTimer()
        
        
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateUI() {
        
        currentQuestion.text = getQuestionText()
        
        let answerChoices = getAnswers()
        answer1.setTitle(answerChoices[0], for: .normal)
        answer2.setTitle(answerChoices[1], for: .normal)
        answer3.setTitle(answerChoices[2], for: .normal)
        answer4.setTitle(answerChoices[3], for: .normal)
        
        quizProgress.progress = getProgress()
        userScore.text = "Score: \(getScore())"
        
        
    }
    
    @objc func updateTimer() {
        count -= 1
        if count > 0 {
            timeRemaining.text = "\(count)"
            
        } else {
            timer.invalidate()
            timeRemaining.text = "0"
            let url = Bundle.main.url(forResource: "wronganswer", withExtension: "mp3")
            audio = try! AVAudioPlayer(contentsOf: url!)
            audio.play()
            nextQuestion()
            updateUI()
            restartTimer()
            
            
        }
    }
    
    @objc func restartTimer() {
        timer.invalidate()
        count = 11
        timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(updateTimer), userInfo:nil, repeats: true)
        count -= 1
        if count > 0 {
            timeRemaining.text = "\(count)"
        }
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "endVideoGameQuiz" {
            let destinationVC = segue.destination as! ResultsViewController
            
            
        }
        
    }
}
    
    
    
    



