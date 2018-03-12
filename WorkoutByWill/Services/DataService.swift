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
    func getRandomWorkouts(type: String, handler: @escaping (_ exercises: [Exercise]) -> ()) {
        let wk_child_ref = _REF_BASE.child(type)
        
    }
    func getAllExercises(type: String, handler: @escaping (_ exercises: [Exercise]) -> ()) {
        let ex_child_ref = _REF_EXERCISES.child(type)
        var exerciseArray = [Exercise]()
        ex_child_ref.observeSingleEvent(of: .value) { (exerciseSnapshot) in
            guard let exerciseSnapshot = exerciseSnapshot.children.allObjects as?
                [DataSnapshot] else {return}
            for exercise in exerciseSnapshot{
                let name = exercise.childSnapshot(forPath: "name").value as! String
                let how = exercise.childSnapshot(forPath: "how").value as! String
                let why = exercise.childSnapshot(forPath: "why").value as! String
                let images = exercise.childSnapshot(forPath: "images").value as! [String]
                let ex = Exercise(name: name, how: how, why: why, images: images)
                exerciseArray.append(ex)
            }
            handler(exerciseArray)
            
        }
    }
}
