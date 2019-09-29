//
//  BaseViewController.swift
//  MyAppFirebase
//
//  Created by Avinash Kaul on 29/09/19.
//  Copyright © 2019 Avinash Kaul. All rights reserved.
//

import UIKit

class BaseViewController:UIViewController{
    
    
    func showAlert(msg:String, title:String){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true) {
            print("Ok button clicked")
        }
    }
    
    @objc func dismissKeyboard (_ sender: UITapGestureRecognizer){
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    
}
