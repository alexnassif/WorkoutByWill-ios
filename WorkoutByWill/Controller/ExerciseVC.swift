//
//  ExerciseVC.swift
//  WorkoutByWill
//
//  Created by Alex Nassif on 1/4/18.
//  Copyright © 2018 alexnassif. All rights reserved.
//

import UIKit

class ExerciseVC: UIViewController {

    @IBOutlet weak var exerciseTableView: UITableView!
    
    var exArr = [Category]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exerciseTableView.dataSource = self
        exerciseTableView.delegate = self
        
        let logoContainer = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 40))
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 40))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "logo")
        imageView.image = image
        logoContainer.addSubview(imageView)
        navigationItem.titleView = logoContainer
        exArr = DataService.instance.bpCategories
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = exArr[indexPath.row]._title
        performSegue(withIdentifier: "ExerciseTypeVC", sender: category)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let productsVC = segue.destination as? ExerciseTypeVC {
            productsVC.type = sender as! String
        }
        
    }


}

extension ExerciseVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "exerciseCell") as? ExerciseCell else {
            return UITableViewCell()
        }
        
        let image = UIImage(named: exArr[indexPath.row]._image)
        let exerciseLabel = exArr[indexPath.row]._uiTitle
        cell.configureCell(exerciseType: exerciseLabel, exerciseImage: image!)
        
        return cell
    }
    
    
    
}
