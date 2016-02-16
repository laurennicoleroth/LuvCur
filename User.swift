//
//  User.swift
//  LuvCur
//
//  Created by Lauren Nicole Roth on 2/16/16.
//  Copyright © 2016 LuvCur. All rights reserved.
//

import Foundation
import UIKit

class User
{
    var id: String
    var firstName: String
    var lastName: String
    var gender: String
    var image: UIImage? {
        get {
            return self.image
        }
        set {
            self.image = UIImage(named: "default-user")
        }
    }
    
    init(id: String, firstName: String, lastName: String, gender: String, image: UIImage) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.gender = gender
        self.image = image
    }

}

