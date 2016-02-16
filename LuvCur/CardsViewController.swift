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
        let user: User
    }
    
    let frontCardTopMargin: CGFloat = 0
    let backCardTopMargin: CGFloat = 10
    
    

}

