//
//  DataService.swift
//  WorkoutByWill
//
//  Created by Alex Nassif on 1/2/18.
//  Copyright © 2018 alexnassif. All rights reserved.
//

import Foundation
import Firebase

let DB_BASE =  Database.database().reference()

class DataService {
    
    static let instance = DataService()
    
    private var _REF_BASE = DB_BASE
    private var _REF_EXERCISES = DB_BASE.child("exercises")
    private var _REF_WORKOUTS = DB_BASE.child("workouts")
    
    var REF_BASE: DatabaseReference {
        return _REF_BASE
    }
    
    var REF_EXERCISES: DatabaseReference {
        return _REF_EXERCISES
    }
    
    var REF_WORKOUTS: DatabaseReference {
        return _REF_WORKOUTS
    }
    
    func getAllExercises(handler: @escaping (_ exercises: [Exercise]) -> ()) {
        
        var exerciseArray = [Exercise]()
        REF_EXERCISES.observeSingleEvent(of: .value) { (exerciseSnapshot) in
            guard let exerciseSnapshot = exerciseSnapshot.children.allObjects as?
                [DataSnapshot] else {return}
            for exercise in exerciseSnapshot{
                let name = exercise.childSnapshot(forPath: "name").value as! String
                let how = exercise.childSnapshot(forPath: "how").value as! String
                let why = exercise.childSnapshot(forPath: "why").value as! String
                let imageBefore = exercise.childSnapshot(forPath: "imageBefore").value as! String
                let imageAfter = exercise.childSnapshot(forPath: "imageAfter").value as! String
                let ex = Exercise(name: name, how: how, why: why, image: imageBefore)
                exerciseArray.append(ex)
            }
            handler(exerciseArray)
            
        }
    }
}
