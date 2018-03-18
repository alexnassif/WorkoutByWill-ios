//
//  DailyWorkoutVC.swift
//  WorkoutByWill
//
//  Created by Alex Nassif on 3/14/18.
//  Copyright © 2018 alexnassif. All rights reserved.
//

import UIKit

class DailyWorkoutVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var dailyCollectionview: UICollectionView!
    
    @IBOutlet weak var dailySegment: UISegmentedControl!
    private(set) public var exercises = [ExerciseDetail]()
    var type: String!
    
    @IBAction func changeDay(_ sender: Any) {
        
        let index = dailySegment.selectedSegmentIndex
        var day = "monday"
        switch index {
        case 0:
            day = "monday"
        case 1:
            day = "tuesday"
        case 2:
            day = "wednesday"
        case 3:
            day = "thursday"
        case 4:
            day = "friday"
        case 5:
            day = "saturday"
        case 6:
            day = "sunday"
        default:
            day = "monday"
        }
        
        DataService.instance.getRandomWorkouts(workout: type, day: day) { (dailyArray) in
            self.exercises = dailyArray
            self.dailyCollectionview.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        dailyCollectionview.delegate = self
        dailyCollectionview.dataSource = self
        
        DataService.instance.getRandomWorkouts(workout: type, day: "monday") { (dailyArray) in
            self.exercises = dailyArray
            self.dailyCollectionview.reloadData()
        }
        // Do any additional setup after loading the view.
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let exerciseDetail = exercises[indexPath.row]
        
        DataService.instance.getSingleExercise(category: exerciseDetail._category, keyName: exerciseDetail._keyName) { (ex) in
            let exerciseDetailVC = self.storyboard!.instantiateViewController(withIdentifier: "ExerciseDetailVC")
                as! ExerciseDetailVC
            exerciseDetailVC.exercise = ex
            self.navigationController!.pushViewController(exerciseDetailVC, animated: true)
            
        }
        
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return exercises.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dailyCell", for: indexPath) as? DailyCell{
            
            let exerciseDetail = exercises[indexPath.row]
            let url = URL(string: exerciseDetail._imageLocation)
            URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                DispatchQueue.main.async {
                    
                    cell.configureCell(exercise: exerciseDetail._exerciseName, sets: exerciseDetail._sets, reps: exerciseDetail._reps, rest: exerciseDetail._rest, image: UIImage(data: data!)!)
                    
                }
            }).resume()
            
            
            return cell
            
        }
        
        return DailyCell()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
