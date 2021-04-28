//
//  ViewController.swift
//  Bitcoin Price Tracker
//
//  Created by Ethan Roberts on 04/01/21.
//
//  NOTE:  This app was created with the help of deepesh deshmukh open-source repository at:  https://github.com/Deepesh22/Bitcoin-Price-Tracker-iOS/blob/master/README.md

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let apiKey = "f9dbdc3a6ea58162cfb75547960f9032e6679444b4363682597d98f9089bee5c"
    
    let cryptoURL : String = "https://min-api.cryptocompare.com/data/price?fsym=BTC&tsyms="
 
    
    // This must be named in this way since this is the abbreviations used by cryptocompare.  Do not change abbreviations
    let currencyType = ["None", "AUD", "CAD", "EUR", "GBP", "INR", "JPY", "USD"]
    
    var bitcoinPrice : JSON = []
    var appendedURL : String = ""
    
    @IBOutlet weak var bitcoinPriceLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    
    @IBAction func refreshBitcoinData(_ sender: UIButton) {
        getBitcoinPrice(url: appendedURL)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.appendedURL = createFinalURL()
        currencyPicker.delegate = self
        currencyPicker.dataSource = self
        getBitcoinPrice(url: appendedURL)
    }
    
    
    func updatePriceLabel(currency : String){
        bitcoinPriceLabel.text = bitcoinPrice[currency].stringValue + " " + currency
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencyType.count
    }
    
    
    // this function is used to show the different currency names inside the picker
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencyType[row]
    }
    

    func createFinalURL() -> String{
        let joinedString = currencyType.joined(separator : ",")
        let finalURL = cryptoURL + joinedString + "&api_key=" + apiKey
        return finalURL
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCurrency = currencyType[row]
        if selectedCurrency == "None"{
            bitcoinPriceLabel.text = "Select a Currency"
        }
        else{
            updatePriceLabel(currency : selectedCurrency)
        }
    }

    func getBitcoinPrice(url: String){
        AF.request(url).responseJSON { response in
            if case .success(let value) = response.result {
                self.bitcoinPrice = JSON(value)
            }
            else{
                self.bitcoinPriceLabel.text = "Connection Error!"
            }
        }
    }
}

