//
//  MerchantViewController.swift
//  Blackcoffer Assignment
//
//  Created by saurabh wattamwar on 14/10/23.
//

import UIKit

class MerchantViewController: UIViewController {

    @IBOutlet weak var merchantProfileTableView: UITableView!
    
    var merchantProfiles = [MerchantModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        merchantProfileTableView.dataSource = self
        merchantProfileTableView.delegate = self
        
        
        let nib = UINib(nibName: "MerchantProfileTableViewCell", bundle: .main)
        self.merchantProfileTableView.register(nib, forCellReuseIdentifier: "MerchantProfileTableViewCell")
        
        addElementsToArray()
        
        
    }
    
    func addElementsToArray(){
        let merchant1 = MerchantModel(name: "Burger King", location: "Pune|Within 2.0 KM", description: "Hi Community! We have great deals for you.Check us out!", image:"man2Image" )
        merchantProfiles.append(merchant1)
        
        let merchant2 = MerchantModel(name: "Optimum Health", location: "Pune|Within 1 KM", description: "Hi Community! We have great deals for you.Check us out!", image:"manImage")
        merchantProfiles.append(merchant2)
        
        let merchant3 = MerchantModel(name: "Fnp: Florist In Pune", location: "Pune|Within 1.1 KM", description: "Hi Community! We have great deals for you.Check us out!", image: "womenImage")
        merchantProfiles.append(merchant3)
    }

}

extension MerchantViewController : UITableViewDataSource,UITableViewDelegate{
    
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        merchantProfiles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let merchantTableViewCell = tableView.dequeueReusableCell(withIdentifier: "MerchantProfileTableViewCell", for: indexPath) as! MerchantProfileTableViewCell
        let temp = merchantProfiles[indexPath.row]
        merchantTableViewCell.merchantName.text = temp.name
        merchantTableViewCell.merchantLocation.text = temp.location
        merchantTableViewCell.merchantMessageBox.text = temp.description
        merchantTableViewCell.merchantImageView.image = UIImage(named: temp.image)
        merchantTableViewCell.fnameLbl.text = String(temp.name.prefix(2))
       
        return merchantTableViewCell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 225.0
    }
}
