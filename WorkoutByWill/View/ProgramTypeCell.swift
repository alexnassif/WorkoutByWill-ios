//
//  ProgramTypeCell.swift
//  WorkoutByWill
//
//  Created by Alex Nassif on 3/13/18.
//  Copyright © 2018 alexnassif. All rights reserved.
//

import UIKit

class ProgramTypeCell: UICollectionViewCell {
    
    @IBOutlet weak var programTypeImage: UIImageView!
    @IBOutlet weak var programTypeLbl: UILabel!
    
    func configureCell(programType: String, programImage: UIImage){
        self.programTypeLbl.text = programType
        self.programTypeImage.image = programImage
    }
}
