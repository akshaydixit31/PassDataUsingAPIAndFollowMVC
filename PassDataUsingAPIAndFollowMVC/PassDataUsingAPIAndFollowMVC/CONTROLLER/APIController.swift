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
    
    func signUp(dictData: [String: String],
                success : @escaping ((Person) -> (Void))) {
        
        let signUpUrl = "https://httpbin.org/post"
        networkController.signUpVcData(signUpUrl: signUpUrl,
                                       dictData: dictData,
                                       success: {(jsonData) in
                                        
                                        let person = Person(jsonData: jsonData)
                                        success(person)
                                        
        })
        
    }
}


