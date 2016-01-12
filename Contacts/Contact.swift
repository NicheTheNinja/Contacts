//
//  Contact.swift
//  Contacts
//
//  Created by Neshanthan Thevarajah on 2016-01-08.
//  Copyright © 2016 Ninja Garden. All rights reserved.
//

import Foundation
import UIKit

enum Gender {
    case Male
    case Female
    case Unknown
}

struct Name {
    var title: String
    var first: String
    var last: String
    var firstInitial: String
    
    init(object: AnyObject) {
        title = object.valueForKey("title")!.description
        first = object.valueForKey("first")!.description
        last =  object.valueForKey("last")!.description
        firstInitial = String(first.characters.first!)
    }
}

struct Location {
    var street: String
    var city: String
    var state: String
    var zip: String
    
    init(object: AnyObject) {
        street = object.valueForKey("street")!.description
        city = object.valueForKey("city")!.description
        state = object.valueForKey("state")!.description
        zip = object.valueForKey("zip")!.description
    }
}

class Contact {
    let gender: Gender
    let name: Name
    let location: Location
    let email: String
    let phone: String
    let cell: String
    var thumbnail: UIImage?
    
    init(object: AnyObject) {
        switch object.valueForKey("gender")!.description {
        case "male":
            gender = .Male
        case "female":
            gender = .Female
        default:
            gender = .Unknown
        }
        
        name = Name(object: object)
        location = Location(object: object)
        email = object.valueForKey("email")!.description
        phone = object.valueForKey("phone")!.description
        cell  = object.valueForKey("cell")!.description
        let data = object.valueForKey("thumbnail") as? NSData
        if let data = data {
            thumbnail = UIImage(data: data)
        }
    }
}