//
//  ViewController.swift
//  MyAppFirebase
//
//  Created by Avinash Kaul on 28/09/19.
//  Copyright © 2019 Avinash Kaul. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: BaseViewController {

    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var btnSignUp: UIButton!
    
    
    @IBAction func onSignUpBtnClicked(_ sender: Any) {
        if let email = tfEmail.text, let password = tfPassword.text{
            Auth.auth().createUser(withEmail: email, password: password, completion:{(response,error) in
                if let response = response{
                    print(response.user.email ?? "No email")
                    print(Auth.auth().currentUser?.uid ?? "No userId")
                }
                if let error = error{
                    print("Login failed due to \(error.localizedDescription)")
                }
            })
        }else{
            //TODO: handle this
           
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

