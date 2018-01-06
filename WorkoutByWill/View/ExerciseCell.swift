//
//  ExerciseCell.swift
//  WorkoutByWill
//
//  Created by Alex Nassif on 1/4/18.
//  Copyright © 2018 alexnassif. All rights reserved.
//

import UIKit

class ExerciseCell: UITableViewCell {

    @IBOutlet weak var exerciseLbl: UILabel!
    @IBOutlet weak var exerciseImage: UIImageView!
    
    func configureCell(exerciseType: String, exerciseImage: UIImage){
        self.exerciseLbl.text = exerciseType
        self.exerciseImage.image = exerciseImage
    }

}
