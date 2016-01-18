//
//  ExtUIButton.swift
//  Swift Extensions
//
//  Created by Emerson Carvalho on 1/17/16.
//  Copyright © 2016 Emerson Carvalho. All rights reserved.
//

import UIKit

extension UIButton {
    
    func centerButtonAndImageWithSpacing(spacing: CGFloat) {
        self.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, spacing)
        self.titleEdgeInsets = UIEdgeInsetsMake(0, spacing, 0, 0)
    }
    
}
