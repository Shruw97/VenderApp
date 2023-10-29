//
//  ViewController.swift
//  Blackcoffer Assignment
//
//  Created by saurabh wattamwar on 10/10/23.
//

import UIKit

class ViewController: UIViewController {

   
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
    }

    override func viewDidAppear(_ animated: Bool) {
        let refineVC = RefineViewController(nibName:"RefineViewController" , bundle: nil)
        self.present(refineVC, animated: true)
    }

   
  
}

