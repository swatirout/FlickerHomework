//
//  ImageViewExtnsion.swift
//  FlickerDemo
//
//  Created by Swati Rout on 17/08/18.
//  Copyright © 2018 Swati Rout. All rights reserved.
//

import Foundation
import UIKit
let imageCache = NSCache<AnyObject, AnyObject>()
var imageURLString : String?
extension UIImageView {
    public func imageFromServerURL(urlString: String, collectionview : UICollectionView,indexpath : IndexPath) {
    imageURLString = urlString
    
    if let url = URL(string: urlString) {
    
    image = nil
    
    
    if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
    
    self.image = imageFromCache
    
    return
    }
    
    URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
    
    if error != nil{
    print(error as Any)
    
    
    return
    }
    
    DispatchQueue.main.async(execute: {
    
    if let imgaeToCache = UIImage(data: data!){
    
    if imageURLString == urlString {
    self.image = imgaeToCache
    }
    
    imageCache.setObject(imgaeToCache, forKey: urlString as AnyObject)// calls when scrolling
        collectionview.reloadItems(at:[indexpath])    
    }
    })
    }) .resume()
    }
}
}
