//
//  contactWithViewController.swift
//  poslty
//
//  Created by Moustafa on 12/22/19.
//  Copyright © 2019 Moustafa Ayman Ahmed. All rights reserved.
//

import UIKit

class contactWithViewController: UIViewController {

    let alert=AlertStoryboardService()
    override func viewDidLoad() {
        super.viewDidLoad()

        
        


    }
    
    @IBAction func connect(_ sender: uuubtn) {
        let alertVc = alert.alert()
        present(alertVc, animated: true, completion: nil)
    }
    

}
