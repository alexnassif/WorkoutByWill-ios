//
//  PaidTypeCell.swift
//  WorkoutByWill
//
//  Created by Alex Nassif on 3/16/18.
//  Copyright © 2018 alexnassif. All rights reserved.
//

import UIKit

class PaidTypeCell: UICollectionViewCell {
    
    @IBOutlet weak var paidImage: UIImageView!
    @IBOutlet weak var paidLbl: UILabel!
    
    func configureCell(paidType: String, paidImage: UIImage){
        self.paidLbl.text = paidType
        self.paidImage.image = paidImage
    }
}
