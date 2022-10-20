//
//  OptionsViewController.swift
//  QuizMe
//
//  Created by LaKeisha Wren on 10/17/22.
//

import UIKit
import AVFoundation

class OptionsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func animalsQuiz(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "goToAnimals", sender: self)
    }
    
    @IBAction func musicQuiz(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "goToMusic", sender: self)
    }
    
    @IBAction func videogameQuiz(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "goToVideoGames", sender: self)
    }
    
    @IBAction func moviesQuiz(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "goToMovies", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToAnimals" {
            let destinationVC = segue.destination as! AnimalViewController
        }
        else if segue.identifier == "goToMovies" {
            let destinationVC = segue.destination as! MoviesViewController
        }
        else if segue.identifier == "goToMusic" {
            let destinationVC = segue.destination as! MusicViewController
        }
        else { segue.identifier == "goToVideoGames"
            let destinationVC = segue.destination as! VideoGameViewController
        }
        
    }
    

}
