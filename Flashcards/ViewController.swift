//
//  ViewController.swift/Users/mel/Desktop/intro-to-ios/Flashcards/Flashcards/ViewController.swift
//  Flashcards
//
//  Created by Melvin Santos on 9/13/22.
//

import UIKit

struct Flashcard
{
    var question: String
    var answer: String
}

class ViewController: UIViewController
{
    
    @IBOutlet weak var card: UIView!
    
    @IBOutlet weak var answerCard: UILabel!
    @IBOutlet weak var questionCard: UILabel!
    @IBOutlet weak var imageLogo: UIImageView!
    
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var prevButton: UIButton!
    
    // Array to store all the flashcards
    var flashcards = [Flashcard]()
    
    // Current flashcard index
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Read saved flashcards
        readSavedFlashcards()
        
        // Adding our intial flashcard if needed
        if flashcards.count == 0 {
            updateFlashcard(question: "What is the capital of Brazil?", answer: "Brasilia")
        } else {
            updateLabels()
            updateNextPrevButtons()
        }
        
        // Adding radius
        self.questionCard.layer.cornerRadius = 50
        self.questionCard.layer.masksToBounds = true
        
        self.card.layer.shadowRadius = 15.0
        self.card.layer.shadowOpacity = 0.2
        
        self.answerCard.layer.cornerRadius = 50
        self.answerCard.layer.masksToBounds = true
        
    }
    
    @IBAction func tappedFlashcard(_ sender: Any) {
        flipFlashcard()
    }
    
    func flipFlashcard()
    {
        UIView.transition(with: questionCard, duration: 0.3, options: .transitionFlipFromRight, animations: {
            if (!self.questionCard.isHidden) {
                self.questionCard.isHidden = true
            } else {
                self.questionCard.isHidden = false
            }
        })
    }
    
    @IBAction func didTapOnNext(_ sender: Any)
    {
        currentIndex = currentIndex + 1 // Increse current index
        
        updateNextPrevButtons() // Update buttons
        animateCardLeft(direction: "left")
    }
    
    @IBAction func didTapOnPrev(_ sender: Any)
    {
        currentIndex = currentIndex - 1 // Increse current index
        
        updateNextPrevButtons() // Update buttons
        animateCardLeft(direction: "right")
    }
    
    @IBAction func newFlashcard(_ sender: Any)
    {
        
    }
    
    func animateCardLeft(direction: String)
    {
        var dir = CGFloat.init(0.0)
        
        if direction == "left" {
            dir = -1.0
        } else {
            dir = 1.0
        }
        
       
        UIView.animate(withDuration: 0.3, animations: {
            self.card.transform = CGAffineTransform.identity.translatedBy(x: dir * 400.0, y: 0.0)
        }) { (finished) in
            self.updateLabels()
            self.animateCardRight(direction: direction)
        }
    }
    
    func animateCardRight(direction: String)
    {
        var dir = CGFloat.init(0.0)
        
        if direction == "left" {
            dir = -1.0
        } else {
            dir = 1.0
        }
        
        card.transform = CGAffineTransform.identity.translatedBy(x: dir * -400.0, y: 0.0)
        UIView.animate(withDuration: 0.3, animations: {
            self.card.transform = CGAffineTransform.identity
        })
    }
    
    
    func updateFlashcard(question: String, answer: String)
    {
        // Write code here
        let flashcard = Flashcard(question: question, answer: answer)

        // Adding flashcards in the flashcards array
        flashcards.append(flashcard)
        print("Added new flashcard")
        
        print("Added a new Flashcard, take a look - > ", flashcards)
        
        currentIndex = flashcards.count - 1  // Update current index
        print("We now have \(flashcards.count) flashcards") // Logging to the console
        
        
        // Update buttons
        updateNextPrevButtons()
        // Update labels
        updateLabels()
    }
    
    func updateLabels()
    {
        // Get current flashcard
        let currentFlashcard = flashcards[currentIndex]
        
        // Update labels
        questionCard.text = currentFlashcard.question
        answerCard.text = currentFlashcard.answer
    }
    
    func updateNextPrevButtons()
    {
        // Disable next button if at the end
        if currentIndex == flashcards.count - 1 {
            nextButton.isEnabled = false
        } else {
            nextButton.isEnabled = true
        }
        
        // Disable prev button if at the beginning
        if currentIndex == 0 {
            prevButton.isEnabled = false
        } else {
            prevButton.isEnabled = true
        }
    }
    
    func saveAllFlashcardsToDisk()
    {
        // From flashcard array to dictionary array
        let dictionaryArray = flashcards.map {(card) -> [String: String] in
            return ["question": card.question, "answer": card.answer]
        }
        
        // Save array on disk using userDefaults
        UserDefaults.standard.set(flashcards, forKey: "flashcards")
        
        // Log it
        print("Flashcards saved to UserDefaults")
    }
    
    func readSavedFlashcards()
    {
       // Read dictionary array from disk (if any)
        if let dictionaryArray = UserDefaults.standard.array(forKey: "flashcards") as? [[String: String]]{
            
            let savedCards = dictionaryArray.map { (dictionary) -> Flashcard in return Flashcard(question: dictionary["question"]!, answer: dictionary["answer"]!)
                
            }
            
            // Put all these cards in our flashcards array
            flashcards.append(contentsOf: savedCards)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        // We know the destination of the segue is the Navigation Controller
        let navigationController = segue.destination as! UINavigationController
        
        // We know the Navigation Controller only contains a Creation View Controller
        let creationController = navigationController.topViewController as! CreationViewController
        
        // We set the flashcardsController property to self
        creationController.flashcardsController = self
    }
}

