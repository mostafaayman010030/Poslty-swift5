//
//  textFieldStyle.swift
//  poslty
//
//  Created by Moustafa on 12/22/19.
//  Copyright © 2019 Moustafa Ayman Ahmed. All rights reserved.
//

import UIKit

class textFieldStyle: UITextField {

   func customizeView() {
        //backgroundColor = #colorLiteral(red: 0.9959436059, green: 0.9896478057, blue: 1, alpha: 0.25)
        layer.cornerRadius = 5.0
        //textAlignment = .center
        
        //clipsToBounds = true
        
        if let p = placeholder {
            let place = NSAttributedString(string: p, attributes: [.foregroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)])
            attributedPlaceholder = place
            textColor = #colorLiteral(red: 0, green: 0.311464915, blue: 0.3625023961, alpha: 1)
        }
    }

}
