//
//  ExtUIView.swift
//  Swift Extensions
//
//  Created by Emerson Carvalho on 1/17/16.
//  Copyright © 2016 Emerson Carvalho. All rights reserved.
//

import UIKit

extension UIView {
    
    func animationShake() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.duration = 0.6
        animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
        layer.addAnimation(animation, forKey: "shake")
    }
    
    func animationTapped(scale: CGFloat = 1.4){
        
        transform = CGAffineTransformMakeScale(scale, scale)
        
        UIView.animateWithDuration(0.33, delay: 0.01, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.AllowUserInteraction, animations: {
            
            self.transform = CGAffineTransformIdentity
            
        }, completion: nil)
    }
    
}

