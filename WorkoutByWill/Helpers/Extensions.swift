//
//  Extensions.swift
//  WorkoutByWill
//
//  Created by Alex Nassif on 3/26/18.
//  Copyright © 2018 alexnassif. All rights reserved.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    
    func loadImageUsingCacheWithUrlString(urlString: String, completion: @escaping (Bool)-> ()){
        self.image = nil
        if let cachedImage = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = cachedImage
            completion(true)
        }
        
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            if error != nil {
                print(error!)
                completion(false)
            }
            DispatchQueue.main.async {
                if let downloadedImage = UIImage(data: data!){
                    imageCache.setObject(downloadedImage, forKey: urlString as AnyObject)
                    self.image = UIImage(data: data!)
                    completion(true)
                }else{
                    completion(false)
                }
                
            }
        }).resume()
    }
}
