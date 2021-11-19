//
//  SecondViewController.swift
//  Scene-Trans01
//
//  Created by Hyun on 2021/11/19.
//

import UIKit

class SecondVIewController: UIViewController {
    @IBAction func back(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
}
