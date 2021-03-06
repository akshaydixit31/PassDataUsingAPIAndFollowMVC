//
//  SignUpVC.swift
//  PassDataUsingAPIAndFollowMVC
//
//  Created by Appinventiv Technologies on 15/09/17.
//  Copyright © 2017 Appinventiv Technologies. All rights reserved.
//

import UIKit


class SignUpVC: UIViewController {
    
    // MARK:- Outlet's --------------------
    @IBOutlet weak var signUpTableView: UITableView!
    @IBOutlet weak var doneButton: UIButton!
    
    //   MARK:- Variable's --------
    
    let textFieldData = ["userName","password","reEnterPassword","name","email","contact","gender"]
    let forwardElement = ["userName","name","email","contact","gender"]
    
    var dictOfTextElement = [String: String]()
    var dataToForward = [String: String]()
    var cellIndex = 0
    
    //   MARK:- ViewLifeCycle --------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.navigationItem.title = "SignUp"
        
        // MARK:- Register Cell -----------------
        
        let cellNib = UINib(nibName: "SignUpCell",
                            bundle: nil)
        signUpTableView.register(cellNib,
                                 forCellReuseIdentifier: "SignUpCellId")
        
        //        ---------- TableView Data source and delegate ......
        
        signUpTableView.dataSource = self
        signUpTableView.delegate = self
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        self.view.endEditing(true)
        
    }
    
    //    MARK:- IBAction.......
    
    @IBAction func getData(_ sender: UIButton) {
        
        APIController().signUp(dictData: self.dictOfTextElement,
                               success: {(person) in
                                
                                self.dataToForward["userName"] = person.userName
                                self.dataToForward["name"] = person.name
                                self.dataToForward["email"] = person.email
                                self.dataToForward["contact"] = person.contact
                                self.dataToForward["gender"] = String(describing: person.gender)
                                
                                DispatchQueue.main.async {
                                    
                                    guard let showDataScene = self.storyboard?
                                        .instantiateViewController(withIdentifier: "ShowDataVCId") as? ShowDataVC else{
                                            
                                            fatalError("Not get VC")
                                            
                                    }
                                    
                                    showDataScene.dataShowDict = self.dataToForward
                                    showDataScene.keyValue = self.forwardElement
                                    self.navigationController?.pushViewController(showDataScene,
                                                                                  animated: true)
                                }
                                
        })
    }
    
    @objc func appendDataInDictionary(_ textField: UITextField) {
        
        guard   let cell = getCell(textField) as? SignUpCell else{
            
            fatalError("SignUpCell not found")
            
        }
        
        guard let indexPath = self.signUpTableView.indexPath(for: cell) else {
            
            fatalError("Don't have indexPath")
            
        }
        
        dictOfTextElement[textFieldData[indexPath.row]] = cell.dataCellTextField.text           //------ Append data in dictionary.....
        
    }
    
    @objc func checkTextFields(_ textField: UITextField) -> Bool {      //------- For Check textField data.....
        
        guard   let cell = getCell(textField) as? SignUpCell else{
            
            fatalError("SignUpCell not found")
            
        }
        
        if (cell.dataCellTextField.text?.isEmpty)! {
            
            doneButton.isEnabled = false
            
            let alert = UIAlertController(title: "Error",
                                          message: "\(textFieldData[textField.tag])  can't be empty:",
                preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK",
                                          style: UIAlertActionStyle.default,
                                          handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
        else {
            
            doneButton.isEnabled = true
            
        }
        
        return true
        
    }
    
    func getCell(_ textField: UITextField) -> UITableViewCell{      //--- For get cell .......
        
        var cell : UIView = textField
        
        while !(cell is SignUpCell) {
            
            if let super_view = cell.superview {
                
                cell = super_view
                
            }
            
        }
        
        guard let tableCell = cell as? SignUpCell else {
            
            fatalError()
            
        }
        
        return tableCell
    }
    
}

//MARK:- Extension of UITableViewDataSource & UITableViewDelegate .....

extension SignUpVC: UITableViewDataSource,
UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
        
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        
        return textFieldData.count
        
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SignUpCellId",
                                                       for: indexPath) as? SignUpCell else{
                                                        
                                                        fatalError("Cell not found:")
                                                        
        }
        cell.dataCellTextField.tag = indexPath.row
        cell.dataCellTextField.placeholder = textFieldData[indexPath.row]
        if textFieldData[indexPath.row] == "password" || textFieldData[indexPath.row] == "reEnterPassword"{
            
            cell.dataCellTextField.isSecureTextEntry = true
            
        }
        
        cell.dataCellTextField.addTarget(self,
                                         action: #selector(appendDataInDictionary),
                                         for: .editingChanged)
        
        return cell
    }
    
}





























