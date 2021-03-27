//
//  GallonsViewController.swift
//  WorldTrotter
//
//  Created by Ethan Roberts on 03/27/21.
//

import UIKit

class GallonsViewController: UIViewController, UITextFieldDelegate {
    

    @IBOutlet var gallonField: UITextField!
    @IBOutlet var literField: UILabel!
    
    var galValue: Measurement<UnitVolume>? {
        didSet {
            updateFeetLabel()
        }
    }
    var litersValue: Measurement<UnitVolume>? {
        if let gallonVal = galValue {
            return gallonVal.converted(to: .liters)
        } else {
            return nil
        }
    }
    
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 3
        return nf
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ConversionViewController loaded its view.")
        updateFeetLabel()
    }
    


    
    @IBAction func literChanged(_ textField: UITextField) {
        if let text = textField.text, let value = Double(text) {
            galValue = Measurement(value: value, unit: .gallons)
        } else {
            galValue = nil
        }
    }
    
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        gallonField.resignFirstResponder()
    }
    
    
    
    func updateFeetLabel() {
        if let literValue = litersValue {
            literField?.text =
                numberFormatter.string(from: NSNumber(value: literValue.value))
        } else {
            literField?.text = "???"
        }
    }
    
    
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {

        let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
        let replacementTextHasDecimalSeparator = string.range(of: ".")
        if existingTextHasDecimalSeparator != nil, replacementTextHasDecimalSeparator != nil {
            return false
        } else {
            return true
        }
    }
}



