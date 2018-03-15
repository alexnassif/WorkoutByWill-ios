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
    
    var type: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
