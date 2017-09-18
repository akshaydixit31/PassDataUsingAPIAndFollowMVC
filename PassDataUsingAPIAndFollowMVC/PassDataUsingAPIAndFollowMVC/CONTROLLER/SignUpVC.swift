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
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var reEnterPasswordTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var contactTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
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
        
            guard let showDataScene = self.storyboard?.instantiateViewController(withIdentifier: "ShowDataVCId") as? ShowDataVC else{fatalError("Not get VC")}
            let apiControllerOb = APIController()
        guard let userName = userNameTextField.text else {fatalError("User Name is empty:")}
            apiControllerOb.sinUPLoginApi(userName: userName, passowrd: self.passwordTextField.text!, reEnterPassword: self.reEnterPasswordTextField.text!, name: self.nameTextField.text!, email: self.emailTextField.text!, contact: self.contactTextField.text!, gender: self.genderTextField.text!){ person in
                
                
                print(person.userName)
                showDataScene.userName = person.userName
                showDataScene.name = person.name
                showDataScene.email = person.email
                showDataScene.contact = person.contact
                showDataScene.gender = person.gender
                
            }
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5), execute: {
            self.navigationController?.pushViewController(showDataScene, animated: true)
        })
    }
}
