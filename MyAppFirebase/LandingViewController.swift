//
//  LandingViewController.swift
//  MyAppFirebase
//
//  Created by Avinash Kaul on 29/09/19.
//  Copyright © 2019 Avinash Kaul. All rights reserved.
//

import UIKit

import FirebaseDatabase
class LandingViewController:BaseViewController{
    
    var ref:DatabaseReference{
        return Database.database().reference()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if isLoggedIn(){
            //ref.child("games").child("1").setValue([["name":"first","score":10],["name":"second","score":30,"AgeLimit":18]])
            //ref.child("games").setValue([["name":"first","score":10],["name":"second","score":30,"AgeLimit":18]])
            //ref.child("games/1/0/score").setValue(80)
            //ref.child("games/1/score").removeValue()
            
            /*
            ref.child("games").observeSingleEvent(of: .value) { (snapshot) in
                //this is just snapshot of values, changing the values here won't reflect on server
                let val = snapshot.value as? [[String:Any]]
                print(val ?? "No value")
            }
            ref.child("games/0").observeSingleEvent(of: .value) { (snapshot) in
                let val = snapshot.value as? [String:Any]
                print(val ?? "No value")
            }
            */
            //Update different child attributes in single call
            /*
            let childUpdates = ["games/0/name":"Game 1", "games/1/name": "Game 2", "games/0/score":nil] as [String:Any]
            ref.updateChildValues(childUpdates)
            */
            
            ref.child("games/0").runTransactionBlock({ (data) -> TransactionResult in
                if var game = data.value as? [String:Any]{
                    game["name"] = "transaction name"
                    game["updatedAt"] = "\(Date())"
                    data.value = game
                }
                return TransactionResult.success(withValue: data)
            }) { (error, success, snapshot) in
                if success{
                    print(snapshot?.value)
                }else{
                    print(error?.localizedDescription)
                }
            }
            /*
            ref.child("games/0/name").observe(.value, with: ({
                (snapshot) in
                let val = snapshot.value as? String
                print(val ?? "No value")
            }))
            */
 
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        ref.child("games/0/name").removeAllObservers()
    }
}
