//
//  PhotoViewModel.swift
//  FlickerDemo
//
//  Created by Swati Rout on 15/08/18.
//  Copyright © 2018 Swati Rout. All rights reserved.
//

import Foundation

class PhotoViewModel:NSObject{
    var  apiClient = ServiceManager()
    var photus: [[String:Any]]?
   
    func getPhotos(searchwith:String,completion: @escaping () -> Void) {
        apiClient.getPhotos(searchText: searchwith) { (arrayOfAppsDictionaries) in
            DispatchQueue.main.async {
                self.photus = arrayOfAppsDictionaries
                completion()
            }
        }
    }
 func numberOfItemsToDisplay(in section: Int) -> Int {
        return photus?.count ?? 0
    }
    func urltoshow(for indexPath: IndexPath)->String{
 let imageString = String(describing:"https://farm\(photus?[indexPath.row]["farm"] ?? "").static.flickr.com/\(photus?[indexPath.row]["server"] ?? "")/\(photus?[indexPath.row]["id"] ?? "")_\(photus?[indexPath.row]["secret"] ?? "").jpg")
       return imageString
    }
}
