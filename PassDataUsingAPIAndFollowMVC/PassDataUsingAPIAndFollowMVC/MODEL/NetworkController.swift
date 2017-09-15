//
//  NetworkController.swift
//  PassDataUsingAPIAndFollowMVC
//
//  Created by Appinventiv Technologies on 15/09/17.
//  Copyright © 2017 Appinventiv Technologies. All rights reserved.
//

import Foundation

func signUpVcData(url:String,userName:String,password:String) -> Person{
    var ob = Person(userName: userName, passWord: password)
    let request = NSMutableURLRequest(url: NSURL(string:url)! as URL,
                                      cachePolicy: .useProtocolCachePolicy,
                                      timeoutInterval: 10.0)
    let postData = NSMutableData(data: "UserName=\(userName)".data(using: String.Encoding.utf8)!)
        postData.append("&Password=\(password)".data(using: String.Encoding.utf8)!)
        request.httpMethod = "POST"
        request.httpBody = postData as Data
        URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
        if let err = error{
            print(err)
        }
        
            let signUpInformation = JSON(data!)
           
            
            ob = Person(userName: signUpInformation["form"]["UserName"].string!, passWord: signUpInformation["form"]["Password"].string!)
            
        }).resume()
    return ob
}
