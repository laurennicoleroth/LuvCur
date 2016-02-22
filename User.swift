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
    var image: UIImage?
    
    init(id: String, firstName: String, lastName: String, gender: String, image: UIImage) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.gender = gender
        self.image = image
    }

    func setDefaultImage() -> UIImage {
        self.image = UIImage(named: "default-user")
        return self.image!
    }
    
    func fetchUnviewedUsers(callback: ([User] -> ())) {
        
//        PFQuery(className: "Action")
//            .whereKey("byUser", equalTo: PFUser.currentUser()!.objectId!).findObjectsInBackgroundWithBlock({
//                objects, error in
//                
//                print(objects!)
//                let viewedUsers = (objects!).map({$0.objectForKey("toUser")!})
//                print(viewedUsers)
//                
//                PFUser.query()!
//                    .whereKey("objectId", notEqualTo: PFUser.currentUser()!.objectId!)
//                    .whereKey("objectId", notContainedIn: viewedUsers)
//                    .findObjectsInBackgroundWithBlock({
//                        objects, error in
//                        
//                        if let pfUsers = objects as? [PFUser] {
//                            let users = pfUsers.map({pfUserToUser($0)})
//                            callback(users)
//                        }
//                    })
//            })
    }
}

