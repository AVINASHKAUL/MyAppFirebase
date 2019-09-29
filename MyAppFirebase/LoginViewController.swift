//
//  LoginViewController.swift
//  MyAppFirebase
//
//  Created by Avinash Kaul on 29/09/19.
//  Copyright © 2019 Avinash Kaul. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController:BaseViewController{
    
    @IBOutlet weak var tfEmail: UITextField!
    
    @IBOutlet weak var tfPassword: UITextField!
    
    @IBOutlet weak var btnLogin: UIButton!
    
    @IBAction func onLoginBtnClicked(_ sender: Any) {
        if !isLoggedIn(){
            if let email = tfEmail.text, let password = tfPassword.text{
                Auth.auth().signIn(withEmail: email, password: password) { (response, error) in
                    if let response = response{
                        print("Email of current user is \(response.user.email ?? "Email not found")")
                        presentViewController(fromVC: self, toVcStoryBoardID: "LandingViewController", storyBoardName: "Main")
                    }
                    
                    if let error = error{
                        self.showAlert(msg: error.localizedDescription, title: "Error")
                    }
                }
            }
        }else{
            presentViewController(fromVC: self, toVcStoryBoardID: "LandingViewController", storyBoardName: "Main")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
