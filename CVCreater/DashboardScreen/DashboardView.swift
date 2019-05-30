//
//  DashboardView.swift
//  CVCreater
//
//  Created by Saranya Rathinasamy on 29/05/19.
//  Copyright © 2019 Infosys. All rights reserved.
//

import Foundation
import UIKit
class Dashboard:UIViewController,UITableViewDataSource,UITableViewDelegate
{
    override func loadView() {
        self.view = Bundle.main.loadNibNamed("DashboardView", owner: self, options: nil) as UIView
    }
    
    enum options: String{
         case PersonalInformation
         case Education
         case TopicsOfKnowledge
    }
    var dashboardOptions = ["Personal Information","Education","Topics of Knowledge","Past Project","Past Experience","Additional Info"];
    
    //TableView Datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dashboardOptions.count
    }
    
    //TableView Delegates
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "indexCell", for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch(dashboardOptions[indexPath.row])
        {
        case "Personal Information":
            let personaldetails = PersonalInfo()
            self.navigationController?.pushViewController(personaldetails, animated: true)
        default:
            break
        }
    }
    
}

