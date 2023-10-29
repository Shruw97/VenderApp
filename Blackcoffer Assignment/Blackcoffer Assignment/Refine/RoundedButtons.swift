//
//  RoundedButtons.swift
//  Blackcoffer Assignment
//
//  Created by saurabh wattamwar on 10/10/23.
//

import UIKit

class RoundedButtons: UIButton {
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    
    var isBtnSelected : Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 10.0
        layer.borderColor = UIColor.init(red: 21.0/255, green: 45/255, blue: 63/255, alpha: 1).cgColor
        layer.borderWidth = 1
        self.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
    }
    
    @objc func buttonTapped(){
        if isBtnSelected{
            isBtnSelected = false
            showSelectedColor(selected: false)
            
        }else{
            isBtnSelected = true
            showSelectedColor(selected: true)
        }
    }
    
    func showSelectedColor(selected : Bool){
        
        if selected{
            backgroundColor = UIColor.init(red: 21.0/255, green: 45/255, blue: 63/255, alpha: 1)
        }else{
            backgroundColor = UIColor.clear
        }
    }
}
