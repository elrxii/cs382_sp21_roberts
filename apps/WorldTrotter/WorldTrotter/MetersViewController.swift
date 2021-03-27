//
//  MetersViewController.swift
//  WorldTrotter
//
//  Created by Ethan Roberts on 03/27/21.
//

import UIKit

class MetersViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var footField: UITextField!
    @IBOutlet var meterField: UILabel!
    
    var feetValue: Measurement<UnitLength>? {
        didSet {
            updateGallonLabel()
        }
    }
    var metersValue: Measurement<UnitLength>? {
        if let feetVal = feetValue {
            return feetVal.converted(to: .meters)
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
        updateGallonLabel()
    }
    


    @IBAction func meterChanged(_ textField: UITextField) {
        if let text = textField.text, let value = Double(text) {
            feetValue = Measurement(value: value, unit: .feet)
        } else {
            feetValue = nil
        }
    }
    
    
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        footField.resignFirstResponder()
    }
    
    
    
    func updateGallonLabel() {
        if let metersValue = metersValue {
            meterField?.text =
                numberFormatter.string(from: NSNumber(value: metersValue.value))
        } else {
            meterField?.text = "???"
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


