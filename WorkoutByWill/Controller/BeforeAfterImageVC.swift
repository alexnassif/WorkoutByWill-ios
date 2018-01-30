//
//  BeforeAfterImageVC.swift
//  WorkoutByWill
//
//  Created by Alex Nassif on 1/8/18.
//  Copyright © 2018 alexnassif. All rights reserved.
//

import UIKit

class BeforeAfterImageVC: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    var imageB: String!
    var imageA: String!
    
    lazy var imageViewControllers: [UIViewController] = {
        
        return [self.newVC(viewController: "beginImageVC"),
                self.newVC(viewController: "afterImageVC")]
    }()
    
    
    var pageControl = UIPageControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        self.delegate = self
        
        
        // This sets up the first view that will show up on our page control
        if let firstViewController = imageViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
        configurePageControl()        // Do any additional setup after loading the view.
    }
    
    func newVC(viewController: String) -> UIViewController {
        
        
        if(viewController == "afterImageVC"){
            let afterImageVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: viewController) as! AfterImageVC
            afterImageVC.imageName = imageA
            return afterImageVC
        }
        else{
            let beforeImageVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: viewController) as! BeginImageVC
            beforeImageVC.imageName = imageB
            return beforeImageVC
        }
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController = pageViewController.viewControllers![0]
        self.pageControl.currentPage = imageViewControllers.index(of: pageContentViewController)!
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = imageViewControllers.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        // User is on the first view controller and swiped left to loop to
        // the last view controller.
        guard previousIndex >= 0 else {
            return imageViewControllers.last
            // Uncommment the line below, remove the line above if you don't want the page control to loop.
            // return nil
        }
        
        guard imageViewControllers.count > previousIndex else {
            return nil
        }
        
        return imageViewControllers[previousIndex]
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = imageViewControllers.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let imageViewControllersCount = imageViewControllers.count
        
        // User is on the last view controller and swiped right to loop to
        // the first view controller.
        guard imageViewControllersCount != nextIndex else {
            return imageViewControllers.first
            // Uncommment the line below, remove the line above if you don't want the page control to loop.
            // return nil
        }
        
        guard imageViewControllersCount > nextIndex else {
            return nil
        }
        
        return imageViewControllers[nextIndex]
        
    }
    
    func configurePageControl() {
        // The total number of pages that are available is based on how many available colors we have.
        print(UIScreen.main.bounds.maxY)
        pageControl = UIPageControl(frame: CGRect(x: 0, y: 200, width: UIScreen.main.bounds.width, height: 50))
        self.pageControl.numberOfPages = imageViewControllers.count
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = UIColor.black
        self.pageControl.pageIndicatorTintColor = UIColor.white
        self.pageControl.currentPageIndicatorTintColor = UIColor.red
        self.view.addSubview(pageControl)
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
