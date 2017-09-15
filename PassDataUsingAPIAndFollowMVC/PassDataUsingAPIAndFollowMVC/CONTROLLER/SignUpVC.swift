//
//  SignUpVC.swift
//  PassDataUsingAPIAndFollowMVC
//
//  Created by Appinventiv Technologies on 15/09/17.
//  Copyright © 2017 Appinventiv Technologies. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    @IBAction func getData(_ sender: UIButton) {
       let personInfo = sinUPLoginApi(userName: userName.text!, passowrd: password.text!)
        sleep(10)
        print(personInfo.userName)
        print(personInfo.passWord)
        
    }
    
    
}
