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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dailyCollectionview.delegate = self
        dailyCollectionview.dataSource = self
        
        DataService.instance.getRandomWorkouts(workout: "randomWorkout", day: "monday") { (dailyArray) in
            self.exercises = dailyArray
            self.dailyCollectionview.reloadData()
        }
        // Do any additional setup after loading the view.
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
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
