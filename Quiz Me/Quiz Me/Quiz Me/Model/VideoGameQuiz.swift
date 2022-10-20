//
//  TheQuiz.swift
//  QuizMe
//
//  Created by LaKeisha Wren on 10/13/22.
//

import Foundation
import UIKit

struct VideoGameQuiz {
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToAnimals" {
            let destinationVC = segue.destination as! AnimalViewController
        }
    }
    
    
}
