//
//  ExtUIImageView.swift
//  Swift Extensions
//
// Found on: http://stackoverflow.com/questions/28694645/how-to-implement-lazy-loading-of-images-in-table-view-using-swift
// Uses: https://github.com/Haneke/HanekeSwift 
//
//  Created by Emerson Carvalho on 1/15/16.
//  Copyright © 2016 Emerson Carvalho. All rights reserved.
//

import UIKit
import Haneke


extension UIImageView {
    
    func downloadImageFrom(url url:String) {
        self.downloadImageFrom(url: url, contentMode: UIViewContentMode.ScaleAspectFill)
    }

    
    func downloadImageFrom(url url:String, contentMode: UIViewContentMode) {
    
        let cache = Shared.imageCache
        let scale = UIScreen.mainScreen().scale
        let width = self.frame.width * scale
        let height = self.frame.width * scale
        
        let cacheKey = url.hmac(CryptoAlgorithm.SHA1, key: "\(url)_w_\(width)_h_\(height)_s_\(scale)")
        
        cache.fetch(key: cacheKey).onSuccess { cachedImage in
            
            self.contentMode =  contentMode
            self.image = cachedImage
            
            
        }.onFailure { (NSError) -> () in
            
            
            NSURLSession.sharedSession().dataTaskWithURL( NSURL(string:url)!, completionHandler: {
                (data, response, error) -> Void in
                
                var resizedImage : UIImage?
                
                if let data = data {
                    
                    resizedImage = RBSquareImageTo(UIImage(data: data)!, size:  CGSize(width: width, height: height))
                    
                    cache.set(value: resizedImage!, key: cacheKey)
                }
                
                dispatch_async(dispatch_get_main_queue()) {
                    self.contentMode =  contentMode
                    if resizedImage != nil {
                        self.image = resizedImage
                        //print("Downloaded Image: \(url)")
                    }
                }
            }).resume()

        }
    }
}