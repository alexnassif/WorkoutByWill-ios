//
//  Category.swift
//  WorkoutByWill
//
//  Created by Alex Nassif on 3/22/18.
//  Copyright © 2018 alexnassif. All rights reserved.
//

import Foundation

class Category {
    
    private var title: String
    private var uiTitle: String
    private var image: String
    
    init(title: String, uiTitle: String, image: String) {
        self.title = title
        self.uiTitle = uiTitle
        self.image = image
    }
    
    var _title: String {
        return title
    }
    var _uiTitle: String {
        return uiTitle
    }
    var _image: String{
        return image
    }
    
}
