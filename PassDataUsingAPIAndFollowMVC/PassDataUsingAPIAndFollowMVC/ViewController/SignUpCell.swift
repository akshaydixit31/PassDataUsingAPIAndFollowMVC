//
//  SignUpCell.swift
//  PassDataUsingAPIAndFollowMVC
//
//  Created by Appinventiv Technologies on 18/09/17.
//  Copyright © 2017 Appinventiv Technologies. All rights reserved.
//

import UIKit

class SignUpCell: UITableViewCell {
    
    @IBOutlet weak var dataCellTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>,
                               with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        dataCellTextField?.endEditing(true)
        
    }
    
    
    
}
