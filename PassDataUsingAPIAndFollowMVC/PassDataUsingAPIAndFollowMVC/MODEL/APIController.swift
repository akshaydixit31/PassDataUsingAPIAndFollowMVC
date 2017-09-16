//
//  APIController.swift
//  PassDataUsingAPIAndFollowMVC
//
//  Created by Appinventiv Technologies on 15/09/17.
//  Copyright © 2017 Appinventiv Technologies. All rights reserved.
//

import Foundation


func sinUPLoginApi(userName:String,passowrd:String,reEnterPassword:String,name:String,email:String,contact:String,gender:String) -> Person{
    let signUpVcUrl = "https://httpbin.org/post"
    let ob:Person =  signUpVcData(url: signUpVcUrl, userName: userName, password: passowrd, reEnterPassword:reEnterPassword, name:name, email:email, contact:contact, gender:gender )
    return ob
}


