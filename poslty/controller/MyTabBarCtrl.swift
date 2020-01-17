//
//  MyTabBarCtrl.swift
//  Poslty
//
//  Created by Moustafa on 12/18/19.
//  Copyright © 2019 Moustafa Ayman Ahmed. All rights reserved.
//

import UIKit
import DeviceKit



class MyTabBarCtrl:  UITabBarController,UITabBarControllerDelegate{

  required init(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)!
     }


     override func viewDidLoad() {
         super.viewDidLoad()
         self.delegate = self
        //self.addCenterButtonWithImage()
//        view.rotatRight()
//        view.blurView()
        setupMiddleButton()
    
   
        tabBar.items?[0].imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -15.0, right: 0)
        tabBar.items?[1].imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -15.0, right: 0)
        tabBar.items?[3].imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -15.0, right: 0)
        tabBar.items?[4].imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -15.0, right: 0)
        
         if self.traitCollection.userInterfaceStyle == .dark
                {
                    UITabBar.appearance().barTintColor=#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                    UITabBar.appearance().tintColor = .systemBlue
                    tabBar.unselectedItemTintColor = .white
                }
                else
                {
                        UITabBar.appearance().barTintColor=#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
                        UITabBar.appearance().tintColor = #colorLiteral(red: 0.06613622955, green: 0.4275063452, blue: 0.3949076168, alpha: 1)
                        tabBar.unselectedItemTintColor = .black
                }
    }

 

    
    
    // TabBarButton – Setup Middle Button
    func setupMiddleButton() {

        let middleBtn = uuubtn(frame: CGRect(x: (self.view.bounds.width / 2)-35, y: -20, width: 70, height: 70))

        let icon:UIImage
        //STYLE THE BUTTON YOUR OWN WAY
        if self.traitCollection.userInterfaceStyle == .dark
        {
            icon = UIImage(named: "d.png")!
        }
        else
        {
            icon = UIImage(named: "li.png")!
        }
        
        middleBtn.setImage(icon, for: .normal)
        middleBtn.imageView?.contentMode = .scaleAspectFit
        middleBtn.layer.cornerRadius=middleBtn.bounds.width/2
        middleBtn.layer.masksToBounds=true
        middleBtn.adjustsImageWhenHighlighted = false
        middleBtn.layer.borderWidth = 0
        
        //add to the tabbar and add click event
        self.tabBar.addSubview(middleBtn)
               middleBtn.addTarget(self, action: #selector(self.menuButtonAction), for: .touchUpInside)
             self.view.layoutIfNeeded()
    }
    

   // Menu Button Touch Action
     @objc func menuButtonAction(sender: uuubtn) {
         self.selectedIndex = 2   //to select the middle tab. use "1" if you have only 3 tabs.
        // sender.shake(duration: 0.5, values: [-1.0, 1.0, -6.0, 6.0, -10.0, 10.0, -12.0, 12.0]);
   //sender.shake()
        sender.layer.borderWidth = 2
        sender.layer.borderColor = #colorLiteral(red: 0.06613622955, green: 0.4275063452, blue: 0.3949076168, alpha: 1)
        sender.shake(duration: 0.5, values: [-6.0, 6.0, -3.0, 3.0, -2.0, 2.0, -3.0, 3.0, 0.0])
        
        sender.adjustsImageWhenDisabled=true
     }
       
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//           let rootView = self.viewControllers![self.selectedIndex] as! UINavigationController
//           rootView.popToRootViewController(animated: true)
    }
   
}





extension UIView{

    func rotatRight(_ isRight:Bool = true,_ duration:CFTimeInterval = 1.5 , _ shouldRepeat:Bool = false) {
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = isRight ? NSNumber(value: Double.pi * 2 as Double) : NSNumber(value: -Double.pi * 2 as Double)
        rotation.duration = duration
        rotation.isCumulative = true
        rotation.repeatCount = shouldRepeat ? Float.greatestFiniteMagnitude : 0
        self.layer.add(rotation, forKey: "rotationAnimation")
    }

    func blurView() {
        self.backgroundColor = UIColor.clear

        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.frame
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        self.insertSubview(blurEffectView, at: 0)
    }
    
    
     @discardableResult
       func applyGradient(colours: [UIColor]) -> CAGradientLayer {
           return self.applyGradient(colours: colours, locations: nil)
       }

       @discardableResult
       func applyGradient(colours: [UIColor], locations: [NSNumber]?) -> CAGradientLayer {
           let gradient: CAGradientLayer = CAGradientLayer()
           gradient.frame = self.bounds
           gradient.colors = colours.map { $0.cgColor }
           gradient.locations = locations
           self.layer.insertSublayer(gradient, at: 0)
           return gradient
       }

}



extension UIView {


    // Using CAMediaTimingFunction
    func shake(duration: TimeInterval = 0.1, values: [CGFloat]) {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")

        // Swift 4.2 and above
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)

        // Swift 4.1 and below
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)


        animation.duration = duration // You can set fix duration
        animation.values = values  // You can set fix values here also
        self.layer.add(animation, forKey: "shake")
    }


    // Using SpringWithDamping
    func shake(duration: TimeInterval = 0.5, xValue: CGFloat = 12, yValue: CGFloat = 0) {
        self.transform = CGAffineTransform(translationX: xValue, y: yValue)
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.transform = CGAffineTransform.identity
        }, completion: nil)

    }


    // Using CABasicAnimation
    func shake(duration: TimeInterval = 0.05, shakeCount: Float = 6, xValue: CGFloat = 12, yValue: CGFloat = 0){
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = duration
        animation.repeatCount = shakeCount
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - xValue, y: self.center.y - yValue))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + xValue, y: self.center.y - yValue))
        self.layer.add(animation, forKey: "shake")
    }

}
