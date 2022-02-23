//
//  ViewController.swift
//  Chapter03-CSStepper
//
//  Created by Hyun on 2022/02/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
            
        let stepper = CSStepper()
        stepper.frame = CGRect(x: 30, y: 100, width: 130, height: 30)
        self.view.addSubview(stepper)
    }
}

