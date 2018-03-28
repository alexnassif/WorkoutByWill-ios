//
//  DailyPaidVC.swift
//  WorkoutByWill
//
//  Created by Alex Nassif on 3/22/18.
//  Copyright © 2018 alexnassif. All rights reserved.
//

import UIKit

class DailyPaidVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var progressIndicator: UIActivityIndicatorView!
    @IBOutlet weak var dailyCollectionview: UICollectionView!
    
    @IBOutlet weak var dailySegment: UISegmentedControl!
    private(set) public var exercises = [ExerciseDetail]()
    fileprivate let sectionInsets = UIEdgeInsets(top: 0, left: 10.0, bottom: 5.0, right: 10.0)
    
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
        self.progressIndicator.startAnimating()
        DataService.instance.getPaidWorkoutDayDetail(workout: type, day: "monday") { (dailyArray) in
            self.exercises = dailyArray
            self.dailyCollectionview.reloadData()
            
            self.progressIndicator.stopAnimating()
            self.progressIndicator.isHidden = true
                
            
            
        }
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        
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
            cell.configureCell(exercise: exerciseDetail._exerciseName, sets: exerciseDetail._sets, reps: exerciseDetail._reps, rest: exerciseDetail._rest, image: exerciseDetail._imageLocation)
            
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

extension DailyPaidVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        //2
        let paddingSpace = sectionInsets.left
        let availableWidth = view.frame.width - paddingSpace
        
        
        return CGSize(width: availableWidth, height: availableWidth / 4)
    }
    
    //3
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    // 4
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
    
}
