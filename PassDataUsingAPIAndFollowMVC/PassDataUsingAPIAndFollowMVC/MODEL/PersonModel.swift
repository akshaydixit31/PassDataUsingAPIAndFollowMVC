//
//  PersonModel.swift
//  PassDataUsingAPIAndFollowMVC
//
//  Created by Appinventiv Technologies on 15/09/17.
//  Copyright © 2017 Appinventiv Technologies. All rights reserved.
//

import Foundation

class Person {
    let userName:String
    let passWord:String
    let reEnterPassword:String
    let name:String
    let email:String
    let contact:String
    let gender:String
    
    init(jsonData:JSON){
        self.userName = jsonData["form"]["userName"].stringValue
        self.passWord = jsonData["form"]["password"].stringValue
         self.reEnterPassword = jsonData["form"]["reEnterPassword"].stringValue
        self.name = jsonData["form"]["name"].stringValue
        self.email = jsonData["form"]["email"].stringValue
        self.contact = jsonData["form"]["contact"].stringValue
        self.gender = jsonData["form"]["gender"].stringValue
    }
}
