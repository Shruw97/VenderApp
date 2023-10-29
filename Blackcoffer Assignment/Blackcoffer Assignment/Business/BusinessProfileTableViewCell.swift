//
//  BusinessProfileTableViewCell.swift
//  Blackcoffer Assignment
//
//  Created by saurabh wattamwar on 14/10/23.
//

import UIKit

class BusinessProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var bprofileImageView: UIImageView!
    @IBOutlet weak var bProfileName: UILabel!
    @IBOutlet weak var bLocation: UILabel!
    @IBOutlet weak var bOccupation: UILabel!
    @IBOutlet weak var bMessageBox: UILabel!
    @IBOutlet weak var boxView: UIView!
    @IBOutlet weak var callBtn: UIButton!
    @IBOutlet weak var contactBtn: UIButton!
    @IBOutlet weak var fnamelbl: UILabel!
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        boxView.layer.cornerRadius = 10.0
        bprofileImageView.layer.cornerRadius = 20.0
        boxView.layer.borderWidth = 1.0
        boxView.layer.borderColor = UIColor.gray.cgColor
        
        callBtn.layer.cornerRadius = callBtn.frame.width/2
        contactBtn.layer.cornerRadius = contactBtn.frame.width/2
    }
   
}
