//
//  DailyCellCollectionViewCell.swift
//  WorkoutByWill
//
//  Created by Alex Nassif on 3/14/18.
//  Copyright © 2018 alexnassif. All rights reserved.
//

import UIKit

class DailyCell: UICollectionViewCell {
    
    @IBOutlet weak var dailyImage: UIImageView!
    @IBOutlet weak var exerciseNameLbl: UITextView!
    @IBOutlet weak var repsLbl: UITextView!
    @IBOutlet weak var setsLbl: UITextView!
    @IBOutlet weak var restLbl: UITextView!
    
    func configureCell(exercise: String, sets: String, reps: String, rest: String, image: String){
        self.setsLbl.text = sets
        self.repsLbl.text = reps
        self.restLbl.text = rest
        self.dailyImage.loadImageUsingCacheWithUrlString(urlString: image){_ in 
            
        }
        self.exerciseNameLbl.text = exercise
    }
}
