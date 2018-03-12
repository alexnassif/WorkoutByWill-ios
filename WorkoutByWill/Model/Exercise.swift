//
//  Exercise.swift
//  WorkoutByWill
//
//  Created by Alex Nassif on 1/2/18.
//  Copyright © 2018 alexnassif. All rights reserved.
//

import Foundation

class Exercise {
    
    private var name: String
    private var how: String
    private var why: String
    private var images: [String]
    
    init(name: String, how: String, why: String, images: [String]) {
        self.name = name
        self.how = how
        self.why = why
        self.images = images
    }
    
    var _name: String {
        return name
    }
    var _how: String {
        return how
    }
    var _why: String{
        return why
    }
    var _images: [String]{
        return images
    }
    
}
