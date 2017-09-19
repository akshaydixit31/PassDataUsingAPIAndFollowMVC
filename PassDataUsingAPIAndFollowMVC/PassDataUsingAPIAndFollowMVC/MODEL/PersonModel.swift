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
        
        self.userName = jsonData["form"]["userName"].stringValue
        self.name = jsonData["form"]["name"].stringValue
        self.email = jsonData["form"]["email"].stringValue
        self.contact = jsonData["form"]["contact"].stringValue
        
        let g = jsonData["form"]["gender"].stringValue
        
        switch g {
            
        case "M": self.gender = .Male
        case "F": self.gender = .Female
        default:  self.gender = .Other
        }
        
    }
    
    
    
}
