//
//  HomeViewController.swift
//  CVCreater
//
//  Created by Saranya Rathinasamy on 29/05/19.
//  Copyright © 2019 Infosys. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.addTapGesture()
    }
    @IBOutlet var resumeCreater: UIImageView!
    
    func addTapGesture() -> Void {
        let tapResume = UITapGestureRecognizer(target: self, action:#selector(openResumeTemplate))
        
        resumeCreater.isUserInteractionEnabled = true
        resumeCreater.addGestureRecognizer(tapResume)
    }
    @objc func openResumeTemplate() -> Void {
        let dashboardController = Dashboard()
        self.navigationController?.pushViewController(dashboardController, animated: true)
    }
//    @IBAction func tapGesture(_ sender: Any) {
//        let dashboardController = Dashboard()
//        self.navigationController?.pushViewController(dashboardController, animated: true)
//
//    }
}

