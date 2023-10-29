//
//  ExploreViewController.swift
//  Blackcoffer Assignment
//
//  Created by saurabh wattamwar on 12/10/23.
//

import UIKit

class ExploreViewController: UIViewController {

   // take a view container to define frame of pageViewController else the pageviewcontroller will overlap the entire screen - in func pageViewSetUp
    @IBOutlet weak var containerView: UIView!
    
    var segmentedViewControllers = [UIViewController]()
    
    // To give scroll effect to viewcontrollers
    let pageViewController = UIPageViewController.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
    
    let businessProfileVC = BusinessViewController.init(nibName: "BusinessViewController", bundle: .main)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Howdy Shruti !!"
        self.tabBarItem.title = "Explore"
        // to change the color of back button in navigationbar
        let textattributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textattributes
        
        let personalProfileVC = ProfileViewController.init(nibName: "ProfileViewController", bundle: .main)
        let businessProfileVC = BusinessViewController.init(nibName: "BusinessViewController", bundle: .main)
        let merchantProfileVC = MerchantViewController.init(nibName: "MerchantViewController", bundle: .main)
        
        segmentedViewControllers = [personalProfileVC,businessProfileVC,merchantProfileVC]
        
        // set initial viewController
        let firstViewController = segmentedViewControllers.first
        pageViewController.setViewControllers([firstViewController!], direction: .forward, animated: true)
        
        pageViewController.dataSource = self
        pageViewController.delegate = self
        
        pageViewSetUp()

        
    }
   
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
        //Note : To show bottom tabbar when we come back to exploreVC from refineVC
    }
    
    @IBAction func goToRefine(_ sender: UIBarButtonItem) {
        let refineVC = RefineViewController(nibName: "RefineViewController", bundle: .main)
       
        tabBarController?.tabBar.isHidden = true // hide tabbar on navigating to refineVC
        self.navigationController?.pushViewController(refineVC, animated: true)
           
    }
    
    
    @IBAction func segmentBarCLicked(_ sender: UISegmentedControl) {
       let selectedViewController = segmentedViewControllers[sender.selectedSegmentIndex]
            pageViewController.setViewControllers([selectedViewController], direction: .forward, animated: true)
    }
    
    func pageViewSetUp(){
        self.addChild(pageViewController) // To supress error in console
        pageViewController.view.frame = CGRect(x: 0, y: 0, width: containerView.frame.width, height: containerView.frame.height) // set frame of containerview to pageviewcontroller's view
        pageViewController.view.backgroundColor = UIColor.white
        
        self.containerView.addSubview(pageViewController.view)
    }
}


extension ExploreViewController : UIPageViewControllerDataSource,UIPageViewControllerDelegate{
   
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = segmentedViewControllers.firstIndex(of: viewController),index > 0 else{
            return nil
        }
        return segmentedViewControllers[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = segmentedViewControllers.firstIndex(of: viewController),index < segmentedViewControllers.count - 1 else {
            return nil
        }
        return segmentedViewControllers[index + 1]
    }
    
    
}
