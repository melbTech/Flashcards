//
//  ViewController.swift/Users/mel/Desktop/intro-to-ios/Flashcards/Flashcards/ViewController.swift
//  Flashcards
//
//  Created by Melvin Santos on 9/13/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var bacgroundView: UIView!
    
    @IBOutlet weak var answerCard: UILabel!
    @IBOutlet weak var questionCard: UILabel!
    @IBOutlet weak var imageLogo: UIImageView!
    
    @IBOutlet weak var germanFlag: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        self.bacgroundView.layer.cornerRadius = 50
        self.bacgroundView.layer.masksToBounds = true
        
        self.questionCard.layer.cornerRadius = 50
        self.questionCard.layer.masksToBounds = true
        
        self.answerCard.layer.cornerRadius = 50
        self.answerCard.layer.masksToBounds = true
        
        
    }
    
    @IBAction func newFlashcard(_ sender: Any) {
        
    }
    
    @IBAction func tappedFlashcard(_ sender: Any) {
        questionCard.isHidden = true
    }
    
    
    func updateFlashcard(question: String, answer: String){
        // Write code here
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // We know the destination of the segue is the Navigation Controller
        let navigationController = segue.destination as! UINavigationController
        
        // We know the Navigation Controller only contains a Creation View Controller
        let creationController = navigationController.topViewController as! CreationViewController
        
        // We set the flashcardsController property to self
        creationController.flashcardsController = self
    }
    
    
}

