//
//  ExerciseDetailVC.swift
//  WorkoutByWill
//
//  Created by Alex Nassif on 1/9/18.
//  Copyright © 2018 alexnassif. All rights reserved.
//

import UIKit

class ExerciseDetailVC: UIViewController {

    @IBOutlet weak var howTitleLbl: UILabel!
    
    @IBOutlet weak var whyTitleLbl: UILabel!
    @IBOutlet weak var howLbl: UITextView!
    @IBOutlet weak var whyLbl: UITextView!
    
    var exercise: Exercise!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.howLbl.text = exercise._how
        self.whyLbl.text = exercise._why
        navigationItem.title = exercise._name
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "imageSegue") {
            let BaImageVC = segue.destination as! BeforeAfterImageVC
            BaImageVC.images = exercise._images
        }
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
