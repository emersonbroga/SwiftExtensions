//
//  ExtUITableView.swift
//  Swift Extensions
//
//  Created by Emerson Carvalho on 1/7/16.
//  Copyright © 2016 Emerson Carvalho. All rights reserved.
//

import UIKit

extension UITableView {
    func indexPathForView (view : UIView) -> NSIndexPath? {
        let location = view.convertPoint(CGPointZero, toView:self)
        return indexPathForRowAtPoint(location)
    }
}