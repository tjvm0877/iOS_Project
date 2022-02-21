//
//  ViewController.swift
//  CustomBtn
//
//  Created by Hyun on 2022/02/15.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        let circleBtn = CSButton(type: .circle)
        circleBtn.frame = CGRect(x: 200, y: 200, width: 150, height: 50)
        self.view.addSubview(circleBtn)
        
        circleBtn.style = .rect
   }
}
