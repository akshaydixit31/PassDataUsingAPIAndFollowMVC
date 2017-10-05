//
//  PersonModel.swift
//  PassDataUsingAPIAndFollowMVC
//
//  Created by Appinventiv Technologies on 15/09/17.
//  Copyright © 2017 Appinventiv Technologies. All rights reserved.
//

import Foundation

enum Gender {
    case Male, Female, Other
}

class Person {
    
    let userName:String
    var name:String
    var email:String
    var contact:String
    let gender:Gender
    
    init(jsonData:JSON) {
        
        self.userName = jsonData["json"]["userName"].stringValue
        self.name = jsonData["json"]["name"].stringValue
        self.email = jsonData["json"]["email"].stringValue
        self.contact = jsonData["json"]["contact"].stringValue
        
        let g = jsonData["json"]["gender"].stringValue
        
        switch g {
            
        case "M": self.gender = .Male
        case "F": self.gender = .Female
        default:  self.gender = .Other
        }
        
    }
    
    
    
}
