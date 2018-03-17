//
//  PaidVC.swift
//  WorkoutByWill
//
//  Created by Alex Nassif on 3/16/18.
//  Copyright © 2018 alexnassif. All rights reserved.
//

import UIKit

class PaidVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return paidWorkoutsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "paidTypeCell", for: indexPath) as! PaidTypeCell
        
        let workoutName = paidWorkoutsArray[indexPath.row]
        let image = UIImage(named: "backhip")
        cell.configureCell(paidType: workoutName, paidImage: image!)
        
        return cell
    }
    

    @IBOutlet weak var paidCollectionView: UICollectionView!
    var paidWorkoutsArray = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        paidCollectionView.delegate = self
        paidCollectionView.dataSource = self
        DataService.instance.getPaidWorkouts { (paidWorkouts) in
            self.paidWorkoutsArray = paidWorkouts
            self.paidCollectionView.reloadData()
        }
        // Do any additional setup after loading the view.
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
