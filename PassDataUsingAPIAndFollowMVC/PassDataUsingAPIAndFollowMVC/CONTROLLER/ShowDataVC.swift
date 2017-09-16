//
//  ShowDataVC.swift
//  PassDataUsingAPIAndFollowMVC
//
//  Created by Appinventiv Technologies on 16/09/17.
//  Copyright © 2017 Appinventiv Technologies. All rights reserved.
//

import UIKit

class ShowDataVC: UIViewController {
//------------- Outlet's ----------------
    @IBOutlet weak var showDataView: UIView!
    @IBOutlet weak var userNameLable: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var contactLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
//------------- Variable's --------------
    var userName:String = ""
    var name:String = ""
    var email:String = ""
    var contact:String = ""
    var gender:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userNameLable.text = userName
        nameLabel.text = name
        emailLabel.text = email
        contactLabel.text = contact
        genderLabel.text = gender
    }
    
    @IBAction func okButtonTap(_ sender: UIButton) {
        self.showDataView.isHidden = true
        UIView.animate(withDuration: 3
            , animations: <#T##() -> Void#>, completion: <#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#>)
    }
    
   

}
