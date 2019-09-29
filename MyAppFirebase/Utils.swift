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

func presentViewController(fromVC parent:UIViewController,toVcStoryBoardID:String ,storyBoardName:String){
    let viewController = getViewController(fromStoryBoard: storyBoardName, vcStoryBoardID: toVcStoryBoardID)
    parent.present(viewController, animated: true, completion: nil)
}

func getViewController(fromStoryBoard storyBoardName:String, vcStoryBoardID:String)-> UIViewController{
    let storyBoard = UIStoryboard(name: storyBoardName, bundle: Bundle.main)
    return storyBoard.instantiateViewController(withIdentifier: vcStoryBoardID)
}
