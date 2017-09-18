//
//  APIController.swift
//  PassDataUsingAPIAndFollowMVC
//
//  Created by Appinventiv Technologies on 15/09/17.
//  Copyright © 2017 Appinventiv Technologies. All rights reserved.
//

import Foundation

class APIController {
    
    let networkController = NetworkController()
func sinUPLoginApi(userName:String,passowrd:String,reEnterPassword:String,name:String,email:String,contact:String,gender:String,succeess : @escaping ((Person) -> (Void))) {
    let signUpVcUrl = "https://httpbin.org/post"
    networkController.signUpVcData(url: signUpVcUrl, userName: userName, password: passowrd, reEnterPassword:reEnterPassword, name:name, email:email, contact:contact, gender:gender ) { json in
        let person = Person(jsonData: json)
        succeess(person)
   }
        
    }
}


