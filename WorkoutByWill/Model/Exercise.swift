//
//  Exercise.swift
//  WorkoutByWill
//
//  Created by Alex Nassif on 1/2/18.
//  Copyright © 2018 alexnassif. All rights reserved.
//

import Foundation

class Exercise {
    
    private var ex_name: String
    private var ex_how: String
    private var ex_why: String
    private var ex_image: String
    
    init(name: String, how: String, why: String, image: String) {
        self.ex_name = name
        self.ex_how = how
        self.ex_why = why
        self.ex_image = image
    }
    
    var name: String {
        return ex_name
    }
    var how: String {
        return ex_how
    }
    var why: String{
        return ex_why
    }
    var image: String{
        return ex_image
    }
    
}
