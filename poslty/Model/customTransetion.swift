//
//  customTransetion.swift
//  Poslty
//
//  Created by Moustafa on 12/20/19.
//  Copyright © 2019 Moustafa Ayman Ahmed. All rights reserved.
//

import UIKit

class customTransetion: NSObject,UIViewControllerAnimatedTransitioning {
    var isPresenting=false
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toViewController=transitionContext.viewController(forKey: .to)else{return}
        guard let fromViewController=transitionContext.viewController(forKey: .from)else{return}
        let container=transitionContext.containerView
        
        let finalWidth=toViewController.view.bounds.width * 0.5
        let finalHeight=toViewController.view.bounds.height
        
        if isPresenting
        {
            container.addSubview(toViewController.view)
            
            toViewController.view.frame=CGRect(x: finalWidth, y: 0, width: finalWidth, height: finalHeight)
        }
        

        
        let transform={
            toViewController.view.transform=CGAffineTransform(translationX: -finalWidth, y: 0)
        }
        
        let identity={
            fromViewController.view.transform = .identity
        }
        
        let duration=transitionDuration(using: transitionContext)
        let isCanceld=transitionContext.transitionWasCancelled
        UIView.animate(withDuration: duration, animations: {
            self.isPresenting ? transform() : identity()
        }) { (_) in
            transitionContext.completeTransition(!isCanceld)
        }
    }
    

}
