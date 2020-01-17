//
//  btnstyle.swift
//  poslty
//
//  Created by Moustafa on 12/21/19.
//  Copyright © 2019 Moustafa Ayman Ahmed. All rights reserved.
//

import UIKit

class uuubtn: UIButton {

    @IBInspectable var cornerrediousbtn:CGFloat=5.0{
         didSet{
             self.layer.cornerRadius=cornerrediousbtn
//            self.layer.backgroundColor=#colorLiteral(red: 0.8417463488, green: 0.9826546308, blue: 0.9714596483, alpha: 1)
//            self.tintColor=#colorLiteral(red: 0.06613622955, green: 0.4275063452, blue: 0.3949076168, alpha: 1)
         }
     }
     
     
     
     override  func awakeFromNib() {
         self.setupview()
     }
     override func prepareForInterfaceBuilder() {
         self.prepareForInterfaceBuilder()
         self.setupview()
     }
    func setupview(){
        self.layer.cornerRadius=cornerrediousbtn
    }



}
