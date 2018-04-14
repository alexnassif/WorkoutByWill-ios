//
//  DataService.swift
//  WorkoutByWill
//
//  Created by Alex Nassif on 1/2/18.
//  Copyright © 2018 alexnassif. All rights reserved.
//

import Foundation
import Firebase
import Firebase
import FirebaseAuthUI

let DB_BASE =  Database.database().reference()

class DataService {

    static let instance = DataService()
    
    private var _REF_BASE = DB_BASE
    private var _REF_EXERCISES = DB_BASE.child("exercises")
    private var _REF_WORKOUTS = DB_BASE.child("workouts")
    let _bpCategories = [Category(title: "neckandshoulders", uiTitle: "Neck and Shoulders", image: "neckshoulder"),
                         Category(title: "kneeandankle", uiTitle: "Knee and Ankle", image: "kneeankle"),
                         Category(title: "lowerbackandhip", uiTitle: "Lower Back and Hip", image: "backhip")]
    var bpCategories: [Category]{
        return _bpCategories
    }
    var REF_BASE: DatabaseReference {
        return _REF_BASE
    }
    
    var REF_EXERCISES: DatabaseReference {
        return _REF_EXERCISES
    }
    
    var REF_WORKOUTS: DatabaseReference {
        return _REF_WORKOUTS
    }
    func isConnected(completionHandler : @escaping (_ connected: Bool) -> ()) {
        let connectedRef = Database.database().reference(withPath: ".info/connected")
        print(connectedRef)
        connectedRef.observe(.value, with: { snapshot in
            completionHandler((snapshot.value as? Bool)!)
        })
    }
    func getListofWellnessProgrmas(handler: @escaping (_ programs: [String]?, _ error: Error?) -> ()){
        
        let individualRef = REF_BASE.child("wellnessprograms")
        var listWorkouts = [String]()
        //print(individualRef)
        
        individualRef.observeSingleEvent(of: .value, with: { (paidSnapshot) in
            let paidSnapshot = paidSnapshot.children.allObjects as!
                [DataSnapshot]
            
            for ex in paidSnapshot {
                listWorkouts.append(ex.value as! String)
            }
            handler(listWorkouts, nil)
        }) {(error) in handler(nil, error)}
        
    }
    
    func getRandomWorkouts(workout: String, day: String, handler: @escaping (_ exercises: [ExerciseDetail]) -> ()) {
        let wk_child_ref = _REF_BASE.child(workout).child(day)
        
        var dailyArray = [ExerciseDetail]()
        wk_child_ref.observeSingleEvent(of: .value) { (dailySnapshot) in
            guard let dailySnapshot = dailySnapshot.children.allObjects as?
                [DataSnapshot] else {return}
            for day in dailySnapshot {
                let exerciseName = day.childSnapshot(forPath: "exerciseName").value as! String
                let reps = day.childSnapshot(forPath: "reps").value as! String
                let rest = day.childSnapshot(forPath: "rest").value as! String
                let sets = day.childSnapshot(forPath: "sets").value as! String
                let category = day.childSnapshot(forPath: "category").value as! String
                let imageLocation = day.childSnapshot(forPath: "image").value as! String
                let keyName = day.key
                let exerciseDetail = ExerciseDetail(keyName: keyName, exerciseName: exerciseName, reps: reps, rest: rest, sets: sets, category: category, imageLocation: imageLocation)
                dailyArray.append(exerciseDetail)
            }
            handler(dailyArray)
        }
        
        
    }
    func getPaidWorkoutDayDetail(workout: String, day: String, handler: @escaping (_ exercises: [ExerciseDetail]) -> ()) {
        let wk_child_ref = _REF_BASE.child((Auth.auth().currentUser?.uid)!).child(workout).child(day)
        
        var dailyArray = [ExerciseDetail]()
        wk_child_ref.observeSingleEvent(of: .value) { (dailySnapshot) in
            guard let dailySnapshot = dailySnapshot.children.allObjects as?
                [DataSnapshot] else {return}
            for day in dailySnapshot {
                let exerciseName = day.childSnapshot(forPath: "exerciseName").value as! String
                let reps = day.childSnapshot(forPath: "reps").value as! String
                let rest = day.childSnapshot(forPath: "rest").value as! String
                let sets = day.childSnapshot(forPath: "sets").value as! String
                let category = day.childSnapshot(forPath: "category").value as! String
                let imageLocation = day.childSnapshot(forPath: "image").value as! String
                let keyName = day.key
                let exerciseDetail = ExerciseDetail(keyName: keyName, exerciseName: exerciseName, reps: reps, rest: rest, sets: sets, category: category, imageLocation: imageLocation)
                dailyArray.append(exerciseDetail)
            }
            handler(dailyArray)
        }
        
        
    }
    
    func getAllExercises(type: String, handler: @escaping (_ exercises: [Exercise]) -> ()) {
        let ex_child_ref = _REF_EXERCISES.child(type)
        print(ex_child_ref)
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
    func getPaidWorkouts(handler: @escaping (_ exercises: [String]) -> ()) {
        let individualRef = _REF_BASE.child((Auth.auth().currentUser?.uid)!).child("listWorkouts")
        var listWorkouts = [String]()
        
        individualRef.observeSingleEvent(of: .value) { (paidSnapshot) in
            guard let paidSnapshot = paidSnapshot.children.allObjects as?
                [DataSnapshot] else {return}
            
            for ex in paidSnapshot {
                listWorkouts.append(ex.value as! String)
            }
            handler(listWorkouts)
        }
        
    }
        
        
    func getSingleExercise(category: String, keyName: String, handler: @escaping (_ exercise: Exercise)-> ()){
        let ex_child_ref = _REF_EXERCISES.child(category).child(keyName)
        
        ex_child_ref.observeSingleEvent(of: .value) { (exerciseSnapshot) in
            
            let name = exerciseSnapshot.childSnapshot(forPath: "name").value as! String
            let why = exerciseSnapshot.childSnapshot(forPath: "why").value as! String
            let how = exerciseSnapshot.childSnapshot(forPath: "how").value as! String
            let images = exerciseSnapshot.childSnapshot(forPath: "images").value as! [String]
            let ex = Exercise(name: name, how: how, why: why, images: images)
            handler(ex)
        }
    }
    
    
}

