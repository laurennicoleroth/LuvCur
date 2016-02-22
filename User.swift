//
//  User.swift
//  LuvCur
//
//  Created by Lauren Nicole Roth on 2/16/16.
//  Copyright © 2016 LuvCur. All rights reserved.
//

import Foundation

struct User {
    let id: String
    let name: String
    private let pfUser: PFUser
    
    func getPhoto(callback: (UIImage) -> ()) {
        let imageFile = pfUser.objectForKey("picture") as! PFFile
        
        imageFile.getDataInBackgroundWithBlock({
            data, error in
            if let data = data {
                callback(UIImage(data: data)!)
            }
        })
    }
}

func pfUserToUser(user: PFUser) -> User {
    return User(id: user.objectId!, name: user.objectForKey("firstName") as! String, pfUser: user)
}

func currentUser() -> User? {
    if let user = PFUser.currentUser() {
        return pfUserToUser(user)
    }
    return nil
}

func fetchUnviewedUsers(callback: ([User] -> ())) {
    
    PFQuery(className: "Action")
        .whereKey("byUser", equalTo: PFUser.currentUser()!.objectId!).findObjectsInBackgroundWithBlock({
            objects, error in
            
            print(objects!)
            let viewedUsers = (objects!).map({$0.objectForKey("toUser")!})
            print(viewedUsers)
            
            PFUser.query()!
                .whereKey("objectId", notEqualTo: PFUser.currentUser()!.objectId!)
                .whereKey("objectId", notContainedIn: viewedUsers)
                .findObjectsInBackgroundWithBlock({
                    objects, error in
                    
                    if let pfUsers = objects as? [PFUser] {
                        let users = pfUsers.map({pfUserToUser($0)})
                        callback(users)
                    }
                })
        })
}

func saveSkip(user: User) {
    let skip = PFObject(className: "Action")
    skip.setObject(PFUser.currentUser()!.objectId!, forKey: "byUser")
    skip.setObject(user.id, forKey: "toUser")
    skip.setObject("skipped", forKey: "type")
    skip.saveInBackgroundWithBlock(nil)
}

func saveLike(user: User) {
    PFQuery(className: "Action")
        .whereKey("byUser", equalTo: user.id)
        .whereKey("toUser", equalTo: PFUser.currentUser()!.objectId!)
        .whereKey("type", equalTo: "liked")
        .getFirstObjectInBackgroundWithBlock({
            object, error in
            
            var matched = false
            
            if object != nil {
                matched = true
                object!.setObject("matched", forKey: "type")
                object!.saveInBackgroundWithBlock(nil)
            }
            
            let match = PFObject(className: "Action")
            match.setObject(PFUser.currentUser()!.objectId!, forKey: "byUser")
            match.setObject(user.id, forKey: "toUser")
            match.setObject(matched ? "matched" : "liked", forKey: "type")
            match.saveInBackgroundWithBlock(nil)
        })
}

