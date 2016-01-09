//
//  DetailViewController.swift
//  Contacts
//
//  Created by Neshanthan Thevarajah on 2016-01-08.
//  Copyright © 2016 Ninja Garden. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!


    var contact: Contact? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let contact = self.contact {
            if let label = self.detailDescriptionLabel {
                label.text = contact.name.first
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

