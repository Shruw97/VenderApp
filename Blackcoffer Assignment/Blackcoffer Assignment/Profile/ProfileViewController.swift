//
//  ProfileViewController.swift
//  Blackcoffer Assignment
//
//  Created by saurabh wattamwar on 12/10/23.
//

import UIKit

class ProfileViewController: UIViewController {

   
    @IBOutlet weak var profileTableView: UITableView!
    
    var profiles = [ProfileModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        profileTableView.dataSource = self
        profileTableView.delegate = self
        
        let nib = UINib(nibName: "ProfileTableViewCell", bundle: .main)
        self.profileTableView.register(nib, forCellReuseIdentifier: "ProfileTableViewCell")
        
        addelementsToArray()
        
    }
    
    func addelementsToArray(){
        let person1 = ProfileModel.init(name: "Anita Bharule", location: "Pune|Ux Designer", distance: "Within 400-500 m", status: "Coffee|Business|Friendship", description: "Hi community! I am open to new connections!!", image:"" )
        profiles.append(person1)
        
        let person2 = ProfileModel.init(name: "Prasad Konde", location: "Pune|Engineer", distance: "Within 1 KM", status: "Coffee|Business|Friendship", description: "Hi community! I am open to new connections!!", image:"manImage")
        profiles.append(person2)
        
        let person3 = ProfileModel.init(name: "Amita Patil", location: "Pune|Student", distance: "Within 1.3 KM", status: "Coffee|Business|Friendship", description: "Hi community! I am open to new connections!!", image: "man2Image")
        profiles.append(person3)
    }
   
}

extension ProfileViewController : UITableViewDelegate, UITableViewDataSource{
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profiles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.profileTableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as! ProfileTableViewCell
        
        let temp = profiles[indexPath.row]
        cell.setData(data: temp)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 225.0
    }
    
    
}
