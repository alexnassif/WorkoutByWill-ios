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
    fileprivate let sectionInsets = UIEdgeInsets(top: 20.0, left: 20.0, bottom: 20.0, right: 20.0)
    fileprivate let itemsPerRow: CGFloat = 2
    override func viewDidLoad() {
        super.viewDidLoad()
        paidCollectionView.delegate = self
        paidCollectionView.dataSource = self
        DataService.instance.getPaidWorkouts { (paidWorkouts) in
            self.paidWorkoutsArray = paidWorkouts
            self.paidCollectionView.reloadData()
        }
        let logoContainer = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 40))
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 40))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "logo")
        imageView.image = image
        logoContainer.addSubview(imageView)
        navigationItem.titleView = logoContainer
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

extension PaidVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        //2
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    //3
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    // 4
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
    
}
