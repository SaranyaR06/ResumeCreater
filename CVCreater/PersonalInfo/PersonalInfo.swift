//
//  PersonalInfo.swift
//  CVCreater
//
//  Created by Saranya Rathinasamy on 29/05/19.
//  Copyright © 2019 Infosys. All rights reserved.
//

import Foundation
import UIKit
class PersonalInfo:UIViewController
{
    override func loadView() {
        self.view = Bundle.main.loadNibNamed("PersonalInfo", owner: self, options: nil) as! UIView
    }
}
