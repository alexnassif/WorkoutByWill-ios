//
//  ExerciseDetail.swift
//  WorkoutByWill
//
//  Created by Alex Nassif on 3/14/18.
//  Copyright © 2018 alexnassif. All rights reserved.
//

import Foundation

class ExerciseDetail {
    
    private var keyName: String
    private var exerciseName: String
    private var reps: String
    private var sets: String
    private var rest: String
    private var category: String
    private var imageLocation: String
    
    init(keyName: String, exerciseName: String,
         reps: String, rest: String, sets: String,
         category: String, imageLocation: String){
        self.keyName = keyName
        self.exerciseName = exerciseName
        self.reps = reps
        self.rest = rest
        self.sets = sets
        self.category = category
        self.imageLocation = imageLocation
    
    }
    var _imageLocation: String {
        return imageLocation
    }
    var _keyName: String {
        return keyName
    }
    var _reps: String {
        return reps
    }
    var _rest: String{
        return rest
    }
    var _sets: String{
        return sets
    }
    var _exerciseName: String {
        return exerciseName
    }
    var _category: String {
        return category
    }
    
}
