//
//  NetworkController.swift
//  PassDataUsingAPIAndFollowMVC
//
//  Created by Appinventiv Technologies on 15/09/17.
//  Copyright © 2017 Appinventiv Technologies. All rights reserved.
//

import Foundation
class NetworkController{
func signUpVcData(url:String,userName:String,password:String,reEnterPassword:String,name:String,email:String,contact:String,gender:String, succeess : @escaping ((JSON) -> (Void))) {
    
    let request = NSMutableURLRequest(url: NSURL(string:url)! as URL,
                                      cachePolicy: .useProtocolCachePolicy,
                                      timeoutInterval: 10.0)
    let postData = NSMutableData(data: "UserName=\(userName)".data(using: String.Encoding.utf8)!)
        postData.append("&Password=\(password)".data(using: String.Encoding.utf8)!)
        postData.append("&ReEnterPassword=\(reEnterPassword)".data(using: String.Encoding.utf8)!)
        postData.append("&Name=\(name)".data(using: String.Encoding.utf8)!)
        postData.append("&Email=\(email)".data(using: String.Encoding.utf8)!)
        postData.append("&Contact=\(contact)".data(using: String.Encoding.utf8)!)
        postData.append("&Gender=\(gender)".data(using: String.Encoding.utf8)!)
        request.httpMethod = "POST"
        request.httpBody = postData as Data
        URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
        if let err = error{
            print(err)
        }
            
            succeess(JSON(data!))
            
    }).resume()
    }
}
