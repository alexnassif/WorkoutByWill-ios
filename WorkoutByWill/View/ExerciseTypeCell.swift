//
//  ExerciseTypeCell.swift
//  WorkoutByWill
//
//  Created by Alex Nassif on 1/4/18.
//  Copyright © 2018 alexnassif. All rights reserved.
//

import UIKit

class ExerciseTypeCell: UICollectionViewCell {
    
    @IBOutlet weak var exerciseTypeImage: UIImageView!
    @IBOutlet weak var exerciseTypeLbl: UILabel!
    
    func configureCell(exerciseType: String, exerciseImage: UIImage){
        self.exerciseTypeLbl.text = exerciseType
        self.exerciseTypeImage.image = exerciseImage
    }
    
}
