//
//  ViewController.swift
//  IBTest
//
//  Created by Hyun on 2021/11/10.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBOutlet var uiTitle01: UILabel!
    @IBOutlet var uiTitle02: UILabel!
    @IBOutlet var uiTitle03: UILabel!
    @IBOutlet var uiTitle04: UILabel!
    @IBOutlet var uiTitle05: UILabel!
    
    @IBAction func clickBtn01(_ sender: Any) {
        self.uiTitle01.text = "On"
    }
    @IBAction func clickBtn02(_ sender: Any) {
        self.uiTitle02.text = "On"
    }
    @IBAction func clickBtn03(_ sender: Any) {
        self.uiTitle03.text = "On"
    }
    @IBAction func clickBtn04(_ sender: Any) {
        self.uiTitle04.text = "On"
    }
    @IBAction func clickBtn05(_ sender: Any) {
        self.uiTitle05.text = "On"
    }
    

}

