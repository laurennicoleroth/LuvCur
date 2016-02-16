//
//  ViewController.swift
//  LuvCur
//
//  Created by Lauren Nicole Roth on 2/16/16.
//  Copyright © 2016 LuvCur. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController
{
    // MARK - Outlets
    @IBOutlet weak var cardStackView: UIView!
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var yesButton: UIButton!
    
    // MARK - Card
    struct Card {
        let cardView: CardView
        let swipeView: SwipeView
        let user: User
    }
    
    var backCard: Card?
    var frontCard: Card?
    
    private func createCard(user: User) -> Card {
        let cardView = CardView()
        
        cardView.name = user.firstName
        cardView.image = user.setDefaultImage()
        
        let swipeView = SwipeView(frame: createCardFrame(frontCardTopMargin))
        swipeView.delegate = self
        swipeView.innerView = cardView
        return Card(cardView: cardView, swipeView: swipeView, user: user)
    }
    
    // MARK: View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    // MARK: Draw UI
    
    let frontCardTopMargin: CGFloat = 0
    let backCardTopMargin: CGFloat = 10
    
    func updateUI() {
        cardStackView.backgroundColor = UIColor.redColor()

    }
    
    private func createCardFrame(topMargin: CGFloat) -> CGRect {
        return CGRect(x: 0, y: topMargin, width: cardStackView.frame.width, height: cardStackView.frame.height)
    }
    
    //MARK: Users
    
    var users: [User]?
    
    private func fetchUnviewedUsers() {
        print("fetching unviewed users")
//        self.cardStackView.addSubview(self.frontCard!.swipeView)
//        self.cardStackView.insertSubview(self.backCard!.swipeView, belowSubview: self.frontCard!.swipeView)
    }
    
    //MARK: Animate Cards
    
    @IBAction func noButtonPressed() {
        //swipe left
        if let card = frontCard {
            card.swipeView.swipeDirection(.Left)
        }
    }
    
    @IBAction func yesButtonPressed() {
        //swipe right
    }
    
    private func popCard() {
       
    }
}

// MARK: SwipeViewDelegate

extension CardsViewController: SwipeViewDelegate {
    
    func swipedLeft() {
        if let frontCard = frontCard {
//            frontCard.swipeView.removeFromSuperview()
//            saveSkip(frontCard.user)
//            switchCards()
        }
    }
    
    func swipedRight() {
        if let frontCard = frontCard {
//            frontCard.swipeView.removeFromSuperview()
//            saveLike(frontCard.user)
//            switchCards()
        }
    }
    
}

