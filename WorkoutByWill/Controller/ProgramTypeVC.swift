//
//  ProgramTypeVC.swift
//  WorkoutByWill
//
//  Created by Alex Nassif on 3/13/18.
//  Copyright © 2018 alexnassif. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuthUI
import FirebaseGoogleAuthUI

class ProgramTypeVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    
    @IBOutlet weak var progressIndicator: UIActivityIndicatorView!
    fileprivate let sectionInsets = UIEdgeInsets(top: 20.0, left: 20.0, bottom: 20.0, right: 20.0)
    fileprivate let itemsPerRow: CGFloat = 2
    @IBOutlet weak var programCollectionView: UICollectionView!
    
    var programArray = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        programCollectionView.dataSource = self
        programCollectionView.delegate = self
        progressIndicator.startAnimating()
        
        let logoContainer = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 40))
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 40))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "logo")
        imageView.image = image
        logoContainer.addSubview(imageView)
        navigationItem.titleView = logoContainer

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let alert = UIAlertController(title: "", message: "No Network Connectivity", preferredStyle: UIAlertControllerStyle.alert)
        DataService.instance.isConnected { (connected) in
            
            if connected {
                
                self.removeAlert(alert: alert)
                DataService.instance.getListofWellnessProgrmas { (wellnessProgramArray, error) in
                    if error == nil{
                        self.programArray = wellnessProgramArray!
                        self.programCollectionView.reloadData()
                        self.progressIndicator.stopAnimating()
                        self.progressIndicator.isHidden = true
                    }else{
                        print(error!)
                    }
                    
                }
                
            }else{
                
                self.checkNetwork(alert: alert)
                self.progressIndicator.stopAnimating()
                self.progressIndicator.isHidden = true
                
            }
            
            
        }
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return programArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "programTypeCell", for: indexPath) as? ProgramTypeCell else {
            return UICollectionViewCell()
        }
        
        let image = UIImage(named: "backhip")
        let exerciseLabel = programArray[indexPath.row]
        cell.configureCell(programType: exerciseLabel, programImage: image!)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "DaySegue", sender: programArray[indexPath.row])
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let productsVC = segue.destination as? DailyWorkoutVC {
            print(sender as! String)
            productsVC.type = sender as! String
        }
    }

}

extension ProgramTypeVC: UICollectionViewDelegateFlowLayout {
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


