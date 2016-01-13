//
//  NetworkController.swift
//  Contacts
//
//  Created by Neshanthan Thevarajah on 2016-01-13.
//  Copyright © 2016 Ninja Garden. All rights reserved.
//

import CoreData
import UIKit

class NetworkController {
    func fetchUsers() {
        request(.GET, "http://api.randomuser.me/?results=500").responseString() { (response) -> Void in
            if let jsonString = response.result.value {
                let json = JSON.parse(jsonString)
                let users = json["results"].array!
                for user in users {
                    self.parseAndSaveUser(user)
                }
//                self.downloadImages()
            }
        }
    }
    
    func parseAndSaveUser(user: JSON) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let entity = NSEntityDescription.entityForName("Contact", inManagedObjectContext: managedContext)
        
        let contact = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        contact.setValue(user["user"]["cell"].string, forKey: "cell")
        contact.setValue(user["user"]["location"]["city"].string, forKey: "city")
        contact.setValue(user["user"]["email"].string, forKey: "email")
        contact.setValue(user["user"]["gender"].string, forKey: "gender")
        contact.setValue(user["user"]["name"]["last"].string, forKey: "last")
        contact.setValue(user["user"]["phone"].string, forKey: "phone")
        contact.setValue(user["user"]["location"]["state"].string, forKey: "state")
        contact.setValue(user["user"]["location"]["street"].string, forKey: "street")
        contact.setValue(user["user"]["name"]["title"].string, forKey: "title")
        
        let first = user["user"]["name"]["first"].string
        contact.setValue(first, forKey: "first")
        contact.setValue(String(first!.characters.first!), forKey: "firstInitial")
        if let zip = user["user"]["location"]["zip"].string {
            contact.setValue(zip, forKey: "zip")
        } else {
            contact.setValue(String(user["user"]["location"]["zip"].int!), forKey: "zip")
        }
        
        contact.setValue(user["user"]["picture"]["thumbnail"].string, forKey: "thumbnailURL")
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
//    func downloadImages() {
//        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//        let managedContext = appDelegate.managedObjectContext
//        for object in fetchedResultsController.fetchedObjects! {
//            let thumbnail = object.valueForKey("thumbnailURL")!.description
//            request(.GET, thumbnail).responseData() { response in
//                object.setValue(response.result.value, forKey: "thumbnail")
//                do {
//                    try managedContext.save()
//                } catch let error as NSError {
//                    print("Could not save \(error), \(error.userInfo)")
//                }
//            }
//        }
//    }
}