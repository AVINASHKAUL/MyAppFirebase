//
//  File.swift
//  MyAppFirebase
//
//  Created by Avinash Kaul on 29/09/19.
//  Copyright © 2019 Avinash Kaul. All rights reserved.
//

import Foundation
import Firebase

func isLoggedIn() -> Bool {
    if Auth.auth().currentUser != nil{
        return true
    }
    return false
}

func getCurrentUserEmail() -> String?{
    return Auth.auth().currentUser?.email
}

func presentViewController(fromVC parent:UIViewController,toVC storyBoardID:String ,storyBoardName:String){
    let storyBoard = UIStoryboard(name: storyBoardName, bundle: Bundle.main)
    let viewController = storyBoard.instantiateViewController(withIdentifier: storyBoardID)
    parent.present(viewController, animated: true, completion: nil)
}
