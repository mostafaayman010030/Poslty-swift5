//
//  socialMediaViewController.swift
//  poslty
//
//  Created by Moustafa on 12/23/19.
//  Copyright © 2019 Moustafa Ayman Ahmed. All rights reserved.
//

import UIKit

class socialMediaViewController: UIViewController {

    @IBOutlet weak var faceBtn: uuubtn!
    @IBOutlet weak var instaBtn: uuubtn!
    @IBOutlet weak var twitterBtn: uuubtn!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        faceBtn.addTarget(self, action: Selector(("faceBook")), for: .touchUpInside)
         instaBtn.addTarget(self, action: Selector(("instagram")), for: .touchUpInside)
         twitterBtn.addTarget(self, action: Selector(("twitter")), for: .touchUpInside)
    }
    
    @IBAction func faceBook(_ sender: Any) {
//        UIApplication.shared.openURL(NSURL(string: "http://www.google.com")! as URL)
        let url:NSURL=URL(string:"https://www.facebook.com/mostafaayman010030")! as NSURL
        UIApplication.shared.open(url as URL)
        
    }
    
    
    @IBAction func instagram(_ sender: Any) {
        
        let url:NSURL=URL(string:"https://www.instagram.com/mostafa_ayman00/")! as NSURL
              UIApplication.shared.open(url as URL)
    }
    
    
    
    @IBAction func twitter(_ sender: Any) {
        
        let url:NSURL=URL(string:"http://www.google.com")! as NSURL
              UIApplication.shared.open(url as URL)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
