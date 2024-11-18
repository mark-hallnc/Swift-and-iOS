//
//  ViewController.swift
//  HallFinalProject
//
//  Created by user186956 on 4/28/21.
//

import UIKit

class ViewController: UIViewController {

    //initialize variables
    var quotesViewed = 0
    var quote = ""
    var backgroundImage: UIImageView!//
        
    //outlets for label and text box
    @IBOutlet var quoteView: UITextView!
    @IBOutlet var totalCounter: UILabel!
    
    
    //arrays to hold quotes
    var workQuotesArray = ["\"Whatever you do, do it well.\" – Walt Disney", "\"Determine your priorities and focus on them.\" – Eileen McDargh", "\"Be so good they can’t ignore you.\"– Steve Martin", "\"Never let your emotions overpower your intelligence.\"– Drake", "\"There is no substitute for hard work.\"– Thomas Edison"]
    var playQuotesArray = ["\"Never regret anything that made you smile.\"– Mark Twain", "\"Simplicity is the ultimate sophistication.\" – Leonardo da Vinci", "\"Tough times never last but tough people do.\" – Robert H. Schiuller", "\"To live will be an awfully big adventure.\"– Peter Pan", "\"The meaning of life is to give life meaning.\"- Ken Hudgins", "\"Happiness depends upon ourselves.\"- Aristotle"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quoteView.text = " "                //set quote area to empty when program starts
        startNewGame()                      //call start new game func
        quoteView.backgroundColor = .clear  //set the background of the quote view to clear at start
        //set background image at start
        backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "dock")
        backgroundImage.contentMode = UIView.ContentMode.center
        self.view.insertSubview(backgroundImage, at: 0)
       
    }
    //method for when user taps work button.
    @IBAction func workTapped(_ sender: UIButton) {
        quotesViewed += 1                   //add one to the total quotes viewed
        workQuotesArray.shuffle()           //shuffle the array to get a different quote
        quote = workQuotesArray[0]          //get the first quote in the array after shuffling
        quoteView.text = quote              //send quote to the quote view
        backgroundImage.image = UIImage(named: "work1") //set the background image to office image
        quoteView.backgroundColor = .systemGray4        //set quote background to grey so letters dont blend with image
        startNewRound()                                 //call startNewRound method

    }
    //method for when user taps play button.
    @IBAction func playTapped(_ sender: UIButton) {
        quotesViewed += 1                   //add one to the total quotes viewed
        playQuotesArray.shuffle()           //shuffle the array to get a different quote
        quote = playQuotesArray[0]          //get the first quote in the array after shuffling
        quoteView.text = quote              //send quote to the quote view
        backgroundImage.image = UIImage(named: "nature1") //set the background image to nature image
        quoteView.backgroundColor = .systemGray4          //set quote background to grey so letters dont blend with image
        startNewRound()                                   //call startNewRound method
        
    }
    //start from the beginning.
    func startNewGame() {
        quotesViewed = 0                            //set label for number of quotes to zero
        totalCounter.text = String(quotesViewed)    //display the zero
        quoteView.backgroundColor = .clear          //change quote view background to clear
        startNewRound()                             //call the startNewRound method
        
        
    }
    //method to end after 3 turns
    func startNewRound() {
        totalCounter.text = String(quotesViewed)    //show number of quotes viewed
        if quotesViewed == 3 {                      //check if user has viewed 3 quotes
            gameOver()                              //if they have call gameOver method
        }
    }
   //after user has viewed 3 quotes...
    func gameOver() {
        
        
        quoteView.text = ""                         //remove text from quote view
        totalCounter.text = ""                      //change number of quotes viewed to empty
        
        //alert to let user know they've reached the limit
        let alert = UIAlertController(title: "You've reached the daily limit!", message: "Go live life!", preferredStyle: .alert)
    
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
    
        alert.addAction(action)
    
        present(alert, animated: true, completion: nil)
    
        
        startNewGame()                       //start from the beginning. 
        
          
            
        
        
    }
    
}

