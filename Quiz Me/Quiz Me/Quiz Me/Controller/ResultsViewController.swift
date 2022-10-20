//
//  ResultsViewController.swift
//  Quiz Me
//
//  Created by LaKeisha Wren on 10/19/22.
//

import UIKit



class ResultsViewController: UIViewController {

    @IBOutlet weak var finalScore: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func playAgain(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "goHome", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goHome" {
            let destinationVC = segue.destination as! OptionsViewController
        }
    }
    
    
}
