//
//  Validity.swift
//  ContactsApp
//
//  Created by Julien on 30/08/21.
//

import Foundation
import UIKit
class Validity{
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    func isPhoneNoValid(value: String) -> Bool {
        let PHONE_REGEX = "^\\d{10}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result = phoneTest.evaluate(with: value)
        return result
    }
    func isValidName(Input:String) -> Bool {
        let RegEx = "^\\w{6,18}$"
        let Test = NSPredicate(format:"SELF MATCHES %@", RegEx)
        return Test.evaluate(with: Input)
    }
    
    func isValidNameAlertAction(input:String,controller:ContactsTableViewController,alert:UIAlertController){
        if(!self.isValidName(Input: input)){
            let nameErrorAlert=UIAlertController(title: "Username is not Valid", message: "", preferredStyle: .alert)
            let back=UIAlertAction(title: "Back", style: .default) { action in
                controller.dismiss(animated: true) {
                    controller.present(alert, animated: true, completion: nil)
                }
            }
            nameErrorAlert.addAction(back)
            controller.present(nameErrorAlert, animated: true, completion: nil)
        }
        
    }
    
    func isValidPhoneAlertAction(input:String,controller:ContactsTableViewController,alert:UIAlertController){
        if(!self.isPhoneNoValid(value:input)){
            let phoneNumberErrorAlert=UIAlertController(title: "Phone Number is not valid ", message: "", preferredStyle: .alert)
            let back=UIAlertAction(title: "Back", style: .default) { action in
                controller.dismiss(animated: true) {
                    controller.present(alert, animated: true, completion: nil)
                }
            }
            phoneNumberErrorAlert.addAction(back)
            controller.present(phoneNumberErrorAlert, animated: true, completion: nil)
        }
    }
    
    func isValidEmailAlertAction(input:String,controller:ContactsTableViewController,alert:UIAlertController){
        
        if(!self.isValidEmail(input)){
            let emailErrorAlert=UIAlertController(title: "Not a valid Email", message: "", preferredStyle: .alert)
            let back=UIAlertAction(title: "Back", style: .default) { action in
                controller.dismiss(animated: true) {
                    controller.present(alert, animated: true, completion: nil)
                }
            }
            emailErrorAlert.addAction(back)
            controller.present(emailErrorAlert, animated: true, completion: nil)
            
        }
    }
    
}
