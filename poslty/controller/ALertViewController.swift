//
//  ALertViewController.swift
//  poslty
//
//  Created by Moustafa on 12/21/19.
//  Copyright © 2019 Moustafa Ayman Ahmed. All rights reserved.
//

import UIKit

class ALertViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func WhatAppClick(_ sender: uuubtn) {
        print("WhatAppClick")
    }
    
    @IBAction func messengerClick(_ sender: uuubtn) {
        print("messengerClick")
    }
    
    @IBAction func gmailClick(_ sender: uuubtn) {
        print("gmailClick")
    }
    
    @IBAction func cancel(_ sender: uuubtn) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
