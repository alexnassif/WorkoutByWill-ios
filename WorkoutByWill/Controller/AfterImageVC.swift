//
//  AfterImageVC.swift
//  WorkoutByWill
//
//  Created by Alex Nassif on 1/16/18.
//  Copyright © 2018 alexnassif. All rights reserved.
//

import UIKit

class AfterImageVC: UIViewController {

    @IBOutlet weak var afterImage: UIImageView!
    var imageName: String!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        afterImage.image = UIImage(named: imageName)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
