//
//  APIController.swift
//  PassDataUsingAPIAndFollowMVC
//
//  Created by Appinventiv Technologies on 15/09/17.
//  Copyright © 2017 Appinventiv Technologies. All rights reserved.
//

import Foundation


func sinUPLoginApi(userName:String,passowrd:String) -> Person{
    let signUpVcUrl = "https://httpbin.org/post"
    let ob:Person =  signUpVcData(url: signUpVcUrl, userName: userName, password: passowrd)
    return ob
}


