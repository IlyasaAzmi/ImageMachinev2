//
//  ViewController.swift
//  ImageMachinev2
//
//  Created by Ilyasa Azmi on 12/03/20.
//  Copyright © 2020 Ilyasa Azmi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var typeTextField: UITextField!
    @IBOutlet weak var setTextButton: UIButton!
    @IBOutlet weak var machineNameLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
    }
    
    //MARK: Text Field Delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        machineNameLabel.text = textField.text
    }
    
    
    //MARK: Actions
    @IBAction func setTextButtonPressed(_ sender: UIButton) {
        machineNameLabel.text = "Default Machine"
    }
    
    
}

