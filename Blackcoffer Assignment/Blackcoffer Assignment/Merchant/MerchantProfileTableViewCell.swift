//
//  MerchantProfileTableViewCell.swift
//  Blackcoffer Assignment
//
//  Created by saurabh wattamwar on 14/10/23.
//

import UIKit

class MerchantProfileTableViewCell: UITableViewCell {

 
    @IBOutlet weak var merchantImageView: UIImageView!
    @IBOutlet weak var merchantName: UILabel!
    @IBOutlet weak var merchantLocation: UILabel!
    @IBOutlet weak var merchantMessageBox: UILabel!
    @IBOutlet weak var boxView: UIView!
    @IBOutlet weak var callBtn: UIButton!
    @IBOutlet weak var addContactbtn: UIButton!
    @IBOutlet weak var showlocationBtn: UIButton!
    @IBOutlet weak var fnameLbl: UILabel!
    

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        boxView.layer.cornerRadius = 10.0
        boxView.layer.borderColor = UIColor.gray.cgColor
        boxView.layer.borderWidth = 1.0
        //        boxView.layer.shadowOffset = CGSize(width: 20.0, height: 20.0)
        boxView.layer.shadowColor = UIColor.black.cgColor
        boxView.layer.shadowRadius = 5.0
        merchantImageView.layer.cornerRadius = 20.0
        merchantImageView.layer.shadowColor = UIColor.black.cgColor
        
        callBtn.layer.cornerRadius = callBtn.frame.width/2
        addContactbtn.layer.cornerRadius = addContactbtn.frame.width/2
        showlocationBtn.layer.cornerRadius = showlocationBtn.frame.width/2
        
    }
    
}
