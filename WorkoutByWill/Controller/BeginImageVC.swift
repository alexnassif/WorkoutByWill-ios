//
//  BeginImageVC.swift
//  WorkoutByWill
//
//  Created by Alex Nassif on 1/16/18.
//  Copyright © 2018 alexnassif. All rights reserved.
//

import UIKit

class BeginImageVC: UIViewController {

    @IBOutlet weak var beginImage: UIImageView!
    
    var imageName: String!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //beginImage.image = UIImage(named: imageName)
        if let profileImageUrl = imageName {
            let url = URL(string: profileImageUrl)
            URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                DispatchQueue.main.async {
                    self.beginImage.image = UIImage(data: data!)
                }
            }).resume()
        }
        
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
