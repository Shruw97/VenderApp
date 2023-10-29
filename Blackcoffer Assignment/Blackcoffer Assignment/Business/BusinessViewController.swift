//
//  BusinessViewController.swift
//  Blackcoffer Assignment
//
//  Created by saurabh wattamwar on 14/10/23.
//

import UIKit

class BusinessViewController: UIViewController {

    
    @IBOutlet weak var businessProfilesTableView: UITableView!
    
    var businessProfiles = [BusinessModel]()
   
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        businessProfilesTableView.dataSource = self
        businessProfilesTableView.delegate = self
        
        let nib = UINib(nibName: "BusinessProfileTableViewCell", bundle: .main)
        businessProfilesTableView.register(nib, forCellReuseIdentifier: "BusinessProfileTableViewCell")
        
        addElementsToArray()
        
    }
    
    func addElementsToArray(){
        let business1 = BusinessModel(image: "man2Image", name: "Sunny Patil", location: "Pune|Within 1.5 KM", occupation: "Engineer", discription: "Hi Community! I am available at your service!")
        businessProfiles.append(business1)
        
        let business2 = BusinessModel(image: "womenImage", name: "Snehal Mane", location: "Pune|Within 3.0 KM", occupation: "Tax Analyst", discription: "Hi Community! I am available at your service!")
        businessProfiles.append(business2)
        
        let  business3 = BusinessModel(image: "manImage", name: "Dipali Gole", location: "Pune|WIthin 6.8 KM", occupation: "Digital Marketing", discription: "Hi Community! I am available at your service!")
        businessProfiles.append(business3)
    }

}

extension BusinessViewController : UITableViewDelegate, UITableViewDataSource{
   
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        businessProfiles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let businessPTableViewCell = tableView.dequeueReusableCell(withIdentifier: "BusinessProfileTableViewCell", for:indexPath) as! BusinessProfileTableViewCell
        let temp = businessProfiles[indexPath.row]
        businessPTableViewCell.bProfileName.text = temp.name
        businessPTableViewCell.bLocation.text = temp.location
        businessPTableViewCell.bOccupation.text = temp.occupation
        businessPTableViewCell.bMessageBox.text = temp.discription
        businessPTableViewCell.bprofileImageView.image = UIImage(named: temp.image)
        businessPTableViewCell.fnamelbl.text = String(temp.name.prefix(2))
        
        return businessPTableViewCell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 225.0
    }
    
}
