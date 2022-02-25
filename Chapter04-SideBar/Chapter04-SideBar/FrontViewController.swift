//
//  FrontViewController.swift
//  Chapter04-SideBar
//
//  Created by Hyun on 2022/02/24.
//

import UIKit

class FrontViewController: UIViewController {

    @IBOutlet weak var sideBarBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let revealVC = self.revealViewController() {
            self.sideBarBtn.target = revealVC
            self.sideBarBtn.action = #selector(revealVC.revealToggle(_:))
            
            self.view.addGestureRecognizer(revealVC.panGestureRecognizer())
        }
    }
}
