//
//  CallViewController.swift
//  poslty
//
//  Created by Moustafa on 12/22/19.
//  Copyright © 2019 Moustafa Ayman Ahmed. All rights reserved.
//

import UIKit

class CallViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func call1Click(_ sender: UIButton) {
        let num = "01003078570"
        print("num 1")
        call(num: num)
        
    }
    
    @IBAction func call2Click(_ sender: UIButton) {
        let num = "01003078570"
        print("num 2")
        call(num: num)
    }
    
    func call(num:String)
    {
//        guard let url=URL(string: "telprompt://\(num)")else{return}
//
//        UIApplication.shared.openURL(url)
//
        
        let url:NSURL=URL(string:"tel://\(num)")! as NSURL
         UIApplication.shared.open(url as URL)
    }
    
//    override var prefersStatusBarHidden: Bool
//        {
//        return true
//    }

}
