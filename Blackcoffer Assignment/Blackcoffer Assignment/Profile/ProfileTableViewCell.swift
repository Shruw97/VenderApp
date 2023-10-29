//
//  ProfileTableViewCell.swift
//  Blackcoffer Assignment
//
//  Created by saurabh wattamwar on 14/10/23.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

   
    @IBOutlet weak var profileTableViewCellView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var locationOfThePerson: UILabel!
    @IBOutlet weak var distanceFromTheProfile: UILabel!
    @IBOutlet weak var profilePurpose: UILabel!
    @IBOutlet weak var messageBox: UILabel!
    @IBOutlet weak var titleInitialLbl: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        profileTableViewCellView.layer.cornerRadius = 20.0
        profileTableViewCellView.layer.borderWidth = 1.0
        profileTableViewCellView.layer.borderColor = UIColor.gray.cgColor
        
        profileImageView.layer.cornerRadius = 20.0
       
    }


    func setData(data : ProfileModel){
        self.profileImageView.image = UIImage(named: data.image)
        self.profileName.text = data.name
        self.locationOfThePerson.text = data.location
        self.distanceFromTheProfile.text = data.distance
        self.profilePurpose.text = data.status
        self.messageBox.text = data.description
        self.titleInitialLbl.text = String(data.name.prefix(2))
    }
    
}
