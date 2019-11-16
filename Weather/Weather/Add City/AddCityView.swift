//
//  AddCityView.swift
//  Weather
//
//  Created by logesh on 11/9/19.
//  Copyright © 2019 logesh. All rights reserved.
//

import UIKit
import Foundation

protocol AddCityViewdelegate {
    func addCityName(city : String)
    func cancelView()
}


//MARK: - Class
class AddCityView: UIView {
    
    
    //MARK: - Outlets
    var delegate : AddCityViewdelegate?
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var titleBar: UINavigationItem!
    @IBOutlet weak var cityTextField: UITextField!
    @IBAction func cancelButton(_ sender: Any) {
        self.delegate?.cancelView()
    }
    @IBAction func saveButton(_ sender: Any) {
        self.contentView.endEditing(true)
        if cityTextField.text != " "{
            self.delegate?.addCityName(city: cityTextField.text!)
        }
    }
    
    //MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initScreen()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.initScreen()
    }
    
    //MARK: - Function
    private func initScreen()
       {
           Bundle.main.loadNibNamed("AddCityView", owner: self, options: nil)
           self.contentView.frame = self.bounds
           self.contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
           self.titleBar.title = "ADD CITY"
           self.addSubview(contentView)
    }
}

//MARK: - TextField Delegate Funciton
extension AddCityView : UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
