//
//  RefineViewController.swift
//  Blackcoffer Assignment
//
//  Created by saurabh wattamwar on 10/10/23.
//

import UIKit

class RefineViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource,UITextFieldDelegate {
   
    
    @IBOutlet weak var coffeeBtn: RoundedButtons!
    @IBOutlet weak var tfield: UITextField!
    @IBOutlet weak var slideValue: UISlider!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var statusTxtField2nd: UITextField!
    @IBOutlet weak var noOfText: UILabel!
    
   
    let listOfcurrentStatus = ["Available | Hey Let Us Connect", "Away | Stay Discrete And Watch", "Busy | Do Not Disturb | Will Catch up Later", "SOS | Emergency! Need Assistance!HELP"]
    var pickerview = UIPickerView()
    let toolbar = UIToolbar()
    
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // textfield
        let mycolor = UIColor.black
        tfield.borderStyle = .roundedRect
        tfield.layer.borderWidth = 1
        tfield.layer.borderColor = mycolor.cgColor
        
        pickerview.delegate = self
        pickerview.dataSource = self
        pickerview.backgroundColor = .white
        pickerview.sizeToFit()
        tfield.inputView = pickerview
        
        statusTxtField2nd.delegate = self
        
        toolbar.sizeToFit()
        let donebutton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneButtonTapped))
        toolbar.items = [donebutton]
        tfield.inputAccessoryView = toolbar
        
        
        // slider
        slideValue.minimumValue = 1.0
        slideValue.maximumValue = 100.0
        slideValue.value = 50.0
        slideValue.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
        
        // show text count on label
        statusTxtField2nd.addTarget(self, action: #selector(textfieldDidChange), for: .editingChanged)
        
        
    }
   
    @IBAction func refibnedDropDownButoon(_ sender: Any) {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.tintColor = .white
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
      
        print("replacementString \(string)")
        
        if string == ""{
            return true
        }
        
        let currentText = statusTxtField2nd.text
        let numberOfchar = 5
    
        if currentText!.count >= numberOfchar{
            return false
        }
        return true
        
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        listOfcurrentStatus.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return listOfcurrentStatus[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        tfield.text = listOfcurrentStatus[row]
        print("didSelectRow")
       
    }
    
    @objc func doneButtonTapped(){
        tfield.text = listOfcurrentStatus[pickerview.selectedRow(inComponent: 0)]
        tfield.resignFirstResponder()
    }
    
    @objc func sliderValueChanged(){
        let sliderValue = slideValue.value
        valueLabel.text = String(format: "%.1f", sliderValue)
        valueLabel.textColor = .black
    }
    
    @objc func textfieldDidChange(_textfield: UITextField){
        if let text = statusTxtField2nd.text{
            noOfText.text = "\(text.count)"
        }else{
            noOfText.text = "0"
        }
            
    }
    
    
    
}


