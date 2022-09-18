//
//  ViewController.swift
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
        
        self.germanFlag.layer.cornerRadius = 10
        self.germanFlag.layer.masksToBounds = true
        
        germanFlag.isHidden = true
        

    }
    
    
    @IBAction func tappedFlashcard(_ sender: Any) {
        questionCard.isHidden = true
        germanFlag.isHidden = false
    }
    
    
}

