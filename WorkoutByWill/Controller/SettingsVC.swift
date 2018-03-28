//
//  SettingsVC.swift
//  WorkoutByWill
//
//  Created by Alex Nassif on 3/27/18.
//  Copyright © 2018 alexnassif. All rights reserved.
//

import UIKit
import FirebaseAuthUI

class SettingsVC: UIViewController {

    @IBAction func signoutBtn(_ sender: Any) {
        let alert = UIAlertController(title: "", message: "You sure you want to Sign-out?", preferredStyle: UIAlertControllerStyle.alert)
        
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "Sign-out", style: UIAlertActionStyle.destructive, handler: { action in
            
            let firebaseAuth = Auth.auth()
            do {
                try firebaseAuth.signOut()
                let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "tabController")
                UIApplication.shared.keyWindow?.rootViewController = loginViewController
            } catch let signOutError as NSError {
                print ("Error signing out: %@", signOutError)
            }
            
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
