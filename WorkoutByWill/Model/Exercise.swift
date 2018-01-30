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
    private var imageBefore: String
    private var imageAfter: String
    
    init(name: String, how: String, why: String, imageB: String, imageA: String) {
        self.name = name
        self.how = how
        self.why = why
        self.imageBefore = imageB
        self.imageAfter = imageA
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
    var _imageBefore: String{
        return imageBefore
    }
    var _imageAfter: String{
        return imageAfter
    }
    
}
