//
//  SecondViewController.swift
//  Scene-Trans02
//
//  Created by Hyun on 2021/11/21.
//

import UIKit

class SecondViewController: UIViewController {
    @IBAction func back(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    @IBAction func back2(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
