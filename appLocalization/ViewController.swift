//
//  ViewController.swift
//  appLocalization
//
//  Created by HARSHID PATEL on 25/07/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lable: UILabel!
    
    @IBOutlet weak var piker: UIPickerView!
    
    var language = ["English","Hindi","Gujrati"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension ViewController: UIPickerViewDelegate,UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return language.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return language[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if language[row] == "English"{
            changeLanguage(lang: "en")
        }
        else if language[row] == "Hindi"{
            changeLanguage(lang: "hi")
        }
        else{
            changeLanguage(lang: "gu-IN")
        }
    }
    
    func changeLanguage(lang: String){
        lable.text = "title".localizeString(String: lang)
    }
}
    
    extension String{
        func localizeString(String: String)->String{
            let path = Bundle.main.path(forResource: String, ofType: "lproj")
            let bundel = Bundle(path: path!)
            
            return  NSLocalizedString(self, tableName: nil, bundle: bundel!,value: "", comment: "")
    }
}
