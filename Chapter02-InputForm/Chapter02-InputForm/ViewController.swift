//
//  ViewController.swift
//  Chapter02-InputForm
//
//  Created by Hyun on 2022/01/28.
//

import UIKit

class ViewController: UIViewController {
    var paramEmail: UITextField!
    var paramUpdate: UISwitch!
    var paramInterval: UIStepper!
    var txtUpadte: UILabel!
    var txtInterval: UILabel!
    
    override func viewDidLoad() {
        self.navigationItem.title = "설정"
        
        let lblEmail = UILabel()
        lblEmail.frame = CGRect(x: 30, y: 100, width: 100, height: 30)
        lblEmail.text = "이메일"
        lblEmail.font = UIFont.systemFont(ofSize: 14)
        self.view.addSubview(lblEmail)
        
        let lblUpadte = UILabel()
        lblUpadte.frame = CGRect(x: 30, y: 150, width: 100, height: 30)
        lblUpadte.text = "자동갱신"
        lblUpadte.font = UIFont.systemFont(ofSize: 14)
        self.view.addSubview(lblUpadte)
        
        let lblInterval = UILabel()
        lblInterval.frame = CGRect(x: 30, y: 200, width: 100, height: 30)
        lblInterval.text = "갱신주기"
        lblInterval.font = UIFont.systemFont(ofSize: 14)
        self.view.addSubview(lblInterval)
        
        self.paramEmail = UITextField()
        self.paramEmail.frame = CGRect(x: 120, y: 100, width: 220, height: 30)
        self.paramEmail.font = UIFont.systemFont(ofSize: 13)
        self.paramEmail.borderStyle = .roundedRect
        self.paramEmail.autocapitalizationType = .none
        self.paramEmail.autocorrectionType = .no
        self.view.addSubview(self.paramEmail)
        
        self.paramUpdate = UISwitch()
        self.paramUpdate.frame = CGRect(x: 120, y: 150, width: 50, height: 30)
        self.paramUpdate.setOn(true, animated: true)
        self.view.addSubview(self.paramUpdate)
        
        self.paramInterval = UIStepper()
        self.paramInterval.frame = CGRect(x: 120, y: 200, width: 50, height: 30)
        self.paramInterval.minimumValue = 0
        self.paramInterval.maximumValue = 100
        self.paramInterval.stepValue = 1
        self.paramInterval.value = 0
        self.view.addSubview(self.paramInterval)
        
        self.txtUpadte = UILabel()
        self.txtUpadte.frame = CGRect(x: 250, y: 150, width: 100, height: 30)
        self.txtUpadte.font = UIFont.systemFont(ofSize: 12)
        self.txtUpadte.textColor = UIColor.red
        self.txtUpadte.text = "갱신함"
        self.view.addSubview(self.txtUpadte)
        
        self.txtInterval = UILabel()
        self.txtInterval.frame = CGRect(x: 250, y: 200, width: 100, height: 30)
        self.txtInterval.font = UIFont.systemFont(ofSize: 12)
        self.txtInterval.textColor = UIColor.red
        self.txtInterval.text = "0분마다"
        self.view.addSubview(self.txtInterval)
        
        self.paramUpdate.addTarget(self, action: #selector(presentUpdateValue(_:)), for: .valueChanged)
        self.paramInterval.addTarget(self, action: #selector(presentIntervalValue(_:)), for: .valueChanged)
        
        let submitBtn = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(submit(_:)))
        self.navigationItem.rightBarButtonItem = submitBtn
    }

    @objc func presentUpdateValue(_ sender: UISwitch) {
        self.txtUpadte.text = (sender.isOn == true ? "갱신함" : "갱신하지 않음")
    }
    @objc func presentIntervalValue(_ sender: UIStepper) {
        self.txtInterval.text = ("\(Int(sender.value))분마다")
    }
    @objc func submit(_ sender: Any) {
        let rvc = ReadVC()
        rvc.pEmail = self.paramEmail.text
        rvc.pUpadte = self.paramUpdate.isOn
        rvc.pInterval = self.paramInterval.value
        
        self.navigationController?.pushViewController(rvc, animated: true)
    }

}

