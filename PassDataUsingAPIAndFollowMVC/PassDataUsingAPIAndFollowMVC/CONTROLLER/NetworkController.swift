//
//  NetworkController.swift
//  PassDataUsingAPIAndFollowMVC
//
//  Created by Appinventiv Technologies on 15/09/17.
//  Copyright © 2017 Appinventiv Technologies. All rights reserved.
//

import Foundation
class NetworkController{
func signUpVcData(signUpUrl:String,
                  dictData: [String: String],
                  success : @escaping ((JSON) -> (Void))) {
    
    let request = NSMutableURLRequest(url: NSURL(string:signUpUrl)! as URL,
                                      cachePolicy: .useProtocolCachePolicy,
                                      timeoutInterval: 10.0)
    
    let postData = NSMutableData(data: "userName=\(dictData["userName"] ?? "")".data(using: String.Encoding.utf8)!)
    print(dictData["userName"] ?? "")
    postData.append("&password=\(dictData["password"] ?? "")".data(using: String.Encoding.utf8)!)
    postData.append("&reEnterPassword=\(dictData["reEnterPassword"] ?? "")".data(using: String.Encoding.utf8)!)
    postData.append("&name=\(dictData["name"] ?? "")".data(using: String.Encoding.utf8)!)
    postData.append("&email=\(dictData["email"] ?? "")".data(using: String.Encoding.utf8)!)
    postData.append("&contact=\(dictData["contact"] ?? "")".data(using: String.Encoding.utf8)!)
    postData.append("&gender=\(dictData["gender"] ?? "")".data(using: String.Encoding.utf8)!)
    request.httpMethod = "POST"
    request.httpBody = postData as Data
    
        URLSession.shared.dataTask(with: request as URLRequest,
                                   completionHandler: { (data, response, error) -> Void in
        if let err = error{
            print(err)
        }
        guard let data = data else{
            fatalError("Data is not return by json")
        }
        success(JSON(data))
        }).resume()
    }
}
