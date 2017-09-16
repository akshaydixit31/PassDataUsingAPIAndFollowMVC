//
//  SignUpVC.swift
//  PassDataUsingAPIAndFollowMVC
//
//  Created by Appinventiv Technologies on 15/09/17.
//  Copyright © 2017 Appinventiv Technologies. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {
//------------ Outlet's --------------------
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var reEnterPassword: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var contact: UITextField!
    @IBOutlet weak var gender: UITextField!
//    ---------- variable's --------
    let myActivityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
    override func viewDidLoad() {
        super.viewDidLoad()
        myActivityIndicator.center = view.center
        myActivityIndicator.sizeToFit()
        myActivityIndicator.color = UIColor.blue
        myActivityIndicator.isHidden = true
        view.addSubview(myActivityIndicator)
        
        // Do any additional setup after loading the view.
    }
    @IBAction func getData(_ sender: UIButton) {
            self.myActivityIndicator.isHidden = false
        let personInfo = sinUPLoginApi(userName: userName.text!, passowrd: password.text!,reEnterPassword:reEnterPassword.text!, name:name.text!, email:email.text!, contact:contact.text!, gender:gender.text!)
        

            self.myActivityIndicator.isHidden = true
            guard let ob = self.storyboard?.instantiateViewController(withIdentifier: "ShowDataVCId") as? ShowDataVC else{fatalError("Not get VC")}
            print(personInfo.userName)
            print(personInfo.passWord)
            ob.userName = personInfo.userName
            ob.name = personInfo.name
            ob.email = personInfo.email
            ob.contact = personInfo.contact
            ob.gender = personInfo.gender
            self.navigationController?.pushViewController(ob, animated: true)

        
        
        
        
    }
    
    
}
