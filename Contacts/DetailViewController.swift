//
//  DetailViewController.swift
//  Contacts
//
//  Created by Neshanthan Thevarajah on 2016-01-08.
//  Copyright © 2016 Ninja Garden. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var cell: UILabel!
    @IBOutlet weak var street: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var state: UILabel!
    @IBOutlet weak var zip: UILabel!
    
    var contact: Contact? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let contact = self.contact {
            if let name = self.name, email = self.email, phone = self.phone, cell = self.cell,
            street = self.street, city = self.city, state = self.state, zip = self.zip {
                name.text = contact.name.title + " " + contact.name.first + " " + contact.name.last
                email.text = contact.email
                phone.text = contact.phone
                cell.text = contact.cell
                street.text = contact.location.state
                city.text = contact.location.city
                state.text = contact.location.state
                zip.text = String(contact.location.zip)
            }
            if var thumbnail = self.thumbnail {
                thumbnail.image = contact.thumbnail
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }
}

