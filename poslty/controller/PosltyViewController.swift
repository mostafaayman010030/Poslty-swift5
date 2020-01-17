//
//  PosltyViewController.swift
//  Poslty
//
//  Created by Moustafa on 12/19/19.
//  Copyright © 2019 Moustafa Ayman Ahmed. All rights reserved.
//

import UIKit

class PosltyViewController: UITabBarController {


    override func viewDidLoad() {
        super.viewDidLoad()


    }
    

    let trans=customTransetion()
    @IBAction func menue(_ sender: UIBarButtonItem) {
       guard let menueVC=storyboard?.instantiateViewController(identifier: "MTVC") else{return}
        if trans.isPresenting == false
        {
            menueVC.modalPresentationStyle = .overCurrentContext
             menueVC.transitioningDelegate=self
            present(menueVC, animated: true, completion: nil)
        }
        else
        {
            self.dismiss(animated: true, completion: nil)
        }
        
        
    }
    

}
extension PosltyViewController:UIViewControllerTransitioningDelegate
{
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        trans.isPresenting=true
        return trans
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        trans.isPresenting=false
        return trans
    }
     
    
    
}
