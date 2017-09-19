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
    @IBOutlet weak var showDataList: UITableView!
    
//------------- Variable's --------------
    var dataShowDict: [String: String] = [:]
    var keyValue = [String]()
   
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let cellNib = UINib(nibName: "ShowDataListCell", bundle: nil)           //----- Register nib for cell........
        showDataList.register(cellNib,
                              forCellReuseIdentifier: "ShowDataListCellId")
        
        showDataList.dataSource = self
        showDataList.delegate = self
       
    }
    
   
    
}

extension ShowDataVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataShowDict.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ShowDataListCellId",
                                                       for: indexPath) as? ShowDataListCell else{
                                                                                                    fatalError("")
                                                                                                }
        
            cell.showKeyValueLabel.text = keyValue[indexPath.row] + ":"
        
            cell.dataShowInListLabel.text =  dataShowDict[keyValue[indexPath.row]]
        
       return cell
    }
    
    
    
    
    
}













