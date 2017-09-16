//
//  PersonModel.swift
//  PassDataUsingAPIAndFollowMVC
//
//  Created by Appinventiv Technologies on 15/09/17.
//  Copyright © 2017 Appinventiv Technologies. All rights reserved.
//

import Foundation

class Person {
    var userName:String
    var passWord:String
    var reEnterPassword:String
    var name:String
    var email:String
    var contact:String
    var gender:String
    init(userName:String,passWord:String,reEnterPassword:String,name:String,email:String,contact:String,gender:String){
        self.userName = userName
        self.passWord = passWord
         self.reEnterPassword = reEnterPassword
        self.name = name
        self.email = email
        self.contact = contact
        self.gender = gender
    }
}
