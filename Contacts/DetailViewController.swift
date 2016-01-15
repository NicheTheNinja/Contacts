//
//  DetailViewController.swift
//  Contacts
//
//  Created by Neshanthan Thevarajah on 2016-01-08.
//  Copyright © 2016 Ninja Garden. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    let thumbnail = UIImageView()
    let name = UILabel()
    let email = UIButton(type: .System)
    let phone = UIButton(type: .System)
    let cell = UIButton(type: .System)
    let street = UILabel()
    let city = UILabel()
    let state = UILabel()
    let zip = UILabel()
    
    var contact: Contact? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        
        let viewsDictionary = ["name": name, "email": email, "phone": phone, "cell": cell, "street": street,
            "city": city, "state": state, "zip": zip, "thumbnail": thumbnail]
        
        for (_ , view) in viewsDictionary {
            view.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(view)
        }
        
        if let contact = self.contact {
            name.text = contact.name.title + " " + contact.name.first + " " + contact.name.last
            email.setTitle(contact.email, forState: .Normal)
            email.addTarget(self, action: "email:", forControlEvents: .TouchUpInside)
            phone.setTitle(contact.phone, forState: .Normal)
            phone.addTarget(self, action: "call:", forControlEvents: .TouchUpInside)
            cell.setTitle(contact.cell, forState: .Normal)
            cell.addTarget(self, action: "call:", forControlEvents: .TouchUpInside)
            street.text = contact.location.street
            city.text = contact.location.city
            state.text = contact.location.state
            zip.text = String(contact.location.zip)
            thumbnail.image = contact.thumbnail
        }

        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|-[thumbnail(80)]-[name]-|",
            options: [],
            metrics: nil,
            views: viewsDictionary))

        let string = "V:|-[name]-[email][phone][cell]-[street][city][state][zip]"
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(string,
            options: [.AlignAllLeft, .AlignAllRight],
            metrics: nil,
            views: viewsDictionary))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-[thumbnail(80)]",
            options: [],
            metrics: nil,
            views: viewsDictionary))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
        self.view.backgroundColor = UIColor.whiteColor()
    }
    
    // This will not work in the simulator. However if tested on a physical device
    // the dialer should open and automatically dial the number
    func call(button: UIButton) {
        UIApplication.sharedApplication().openURL(NSURL(string: "tel://" + button.titleLabel!.text!)!)
    }

    // This will not work in the simulator. However if tested on a physical device
    // the native mail client should open and set the to address to the emaill adress
    func email(button: UIButton) {
        UIApplication.sharedApplication().openURL(NSURL(string: "mailto:" + contact!.email)!)
    }
}

