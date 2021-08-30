//
//  ContactPage.swift
//  ContactsApp
//
//  Created by Julien on 24/08/21.
//

import UIKit
class ContactsTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    
    
    
    
    
    @IBOutlet weak var contactTable: UITableView!
    var model=Model()
    
    var validity=Validity()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        contactTable.delegate=self
        contactTable.dataSource=self
        
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.getListCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier:"contact") as! TableViewCell
        cell.name.text=model.contactList[indexPath.row][0]
        cell.phoneno.text=model.contactList[indexPath.row][1]
        cell.indexpath=indexPath
        
        cell.delegate=self
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }

    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        var nameField = UITextField()
        var numberField = UITextField()
        var emailField = UITextField()
        
        let alert=UIAlertController( title: "Add new Contact", message: " ", preferredStyle: .alert)
        let action=UIAlertAction(title: "Add", style: .default) { (action) in
            
            if(!self.validity.isValidName(Input: nameField.text!)){
                let nameErrorAlert=UIAlertController(title: "Username is not Valid", message: "", preferredStyle: .alert)
                let back=UIAlertAction(title: "Back", style: .default) { action in
                    self.dismiss(animated: true) {
                        self.present(alert, animated: true, completion: nil)
                    }
                }
                nameErrorAlert.addAction(back)
                self.present(nameErrorAlert, animated: true, completion: nil)
            }
            
            if(!self.validity.isPhoneNoValid(value:numberField.text!)){
                let phoneNumberErrorAlert=UIAlertController(title: "Phone Number is not valid ", message: "", preferredStyle: .alert)
                let back=UIAlertAction(title: "Back", style: .default) { action in
                    self.dismiss(animated: true) {
                        self.present(alert, animated: true, completion: nil)
                    }
                }
                phoneNumberErrorAlert.addAction(back)
                self.present(phoneNumberErrorAlert, animated: true, completion: nil)
            }
            if(!self.validity.isValidEmail(emailField.text!)){
                let emailErrorAlert=UIAlertController(title: "Not a valid Email", message: "", preferredStyle: .alert)
                let back=UIAlertAction(title: "Back", style: .default) { action in
                    self.dismiss(animated: true) {
                        self.present(alert, animated: true, completion: nil)
                    }
                }
                emailErrorAlert.addAction(back)
                self.present(emailErrorAlert, animated: true, completion: nil)
                
            }
            else{
                self.model.contactList.append([nameField.text!,numberField.text!,emailField.text!])
                self.contactTable.reloadData()
            }
            
            
           
        }
        let cancel=UIAlertAction(title: "Cancel", style: .default) { action in
            self.dismiss(animated: true, completion: nil)
        }
        alert.addTextField { alertTextField in
            alertTextField.placeholder="Contact Name"
            nameField=alertTextField
        }
        
        alert.addTextField { alertTextField in
            alertTextField.placeholder="Contact Number"
            numberField=alertTextField
        }
        alert.addTextField { alertTextField in
            alertTextField.placeholder="Contact Email"
            emailField=alertTextField
        }
        
        alert.addAction(action)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
    
    
}


extension ContactsTableViewController: ContactDelegate{
    func contactingForDeleting(at index: IndexPath) {
        self.model.contactList.remove(at: index.row)
        self.contactTable.reloadData()
        
    }
    
    
    func contactingForEditing(at Index: IndexPath) {
        
        var nameField = UITextField()
        var numberField = UITextField()
        var emailField = UITextField()
        let alert=UIAlertController(title: "Edit Element", message: "", preferredStyle: .alert)
        
        let action=UIAlertAction(title: "Update", style: .default) { action in
            print(Index)
            self.model.contactList[Index.row][0]=nameField.text ?? " "
            self.model.contactList[Index.row][1]=numberField.text ?? " "
            self.model.contactList[Index.row][2]=emailField.text ?? " "
            
            self.contactTable.reloadData()
            
        }
        let cancel=UIAlertAction(title: "Cancel", style: .default) { action in
            self.dismiss(animated: true, completion: nil)
        }
        alert.addTextField { alertTextField in
            alertTextField.placeholder=self.model.contactList[Index.row][0]
            nameField=alertTextField
        }
        alert.addTextField { alertTextField in
            alertTextField.placeholder=self.model.contactList[Index.row][1]
            numberField=alertTextField
        }
        alert.addTextField { alertTextField in
            alertTextField.placeholder=self.model.contactList[Index.row][2]
            emailField=alertTextField
        }
        
        alert.addAction(action)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
        
        
        
        
        
    }
    
}

