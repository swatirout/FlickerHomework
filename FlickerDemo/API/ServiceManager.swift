//
//  ServiceManager.swift
//  FlickerDemo
//
//  Created by Swati Rout on 15/08/18.
//  Copyright © 2018 Swati Rout. All rights reserved.
//

import Foundation

class ServiceManager :NSObject{
  var   vc =   ViewController()
    var finalImageArray = [[String:Any]]()
     func  getPhotos(searchText:String,completion: @escaping ([[String:Any]]?) -> Void) {
        // Set up the URL request
        if (Reachability.isConnectedToNetwork()){

        let url : NSString = String(describing:"https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=864587c43a94a25b73781e484e232641& format=json&nojsoncallback=1&safe_search=1&text=\(searchText )") as NSString
        let urlStr : NSString =
            url.addingPercentEscapes(using: String.Encoding.utf8.rawValue)! as NSString
        let searchURL : URL = URL(string: urlStr as String)!
        let urlRequest = URLRequest(url: searchURL)
        // set up the session
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        // make the request
        let task = session.dataTask(with: urlRequest) {
            (data, response, error) in
            // check for any errors
            guard error == nil else {
                print("error calling GET")
                print(error!)
                return
            }
            // make sure we got data
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            // parse the result as JSON
            do {
                guard let totalResponse = try JSONSerialization.jsonObject(with: responseData, options: [])
                    as? [String: Any] else {
                        print("error trying to convert data to JSON")
                        return
                }
                guard let totalPhotos = totalResponse["photos"] as? [String:Any] else {
                    print("Could not get photos from JSON")
                    return
                }
                if let photoarr = totalPhotos["photo"] as? [[String:Any]]{
                    completion(photoarr)
                }
                else {
                    return
                }
                
            } catch  {
                print("error trying to convert data to JSON")
                return
            }
        }
        task.resume()
        return
    }else{
         
    print("No internet")
    }
    }
    
}
