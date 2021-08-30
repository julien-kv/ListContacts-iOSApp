//
//  ViewController.swift
//  ContactsApp
//
//  Created by Julien on 24/08/21.
//

import UIKit

class LoginPageController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var pwd: UITextField!
    @IBOutlet weak var incorrectpwd: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        incorrectpwd.text=""
        // Do any additional setup after loading the view.
    }

    @IBAction func loginButtonPressed(_ sender: Any) {
        
        if(username.text=="julienjthomas@gmail.com" && pwd.text=="12345678"){
        self.performSegue(withIdentifier: "gotowelcome", sender: self)
            
            username.text=""
            pwd.text=""
        }
        else{
            incorrectpwd.text="Incorrect password..please try again"
            username.text=""
            pwd.text=""
        }
        
        
    }
    
}

