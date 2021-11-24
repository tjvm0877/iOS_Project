//
//  ViewController.swift
//  SubmitValue
//
//  Created by Hyun on 2021/11/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet var email: UITextField!
    @IBOutlet var interval: UIStepper!
    @IBOutlet var isUpdate: UISwitch!
    
    @IBOutlet var isUpdateText: UILabel!
    @IBOutlet var intervalText: UILabel!
    
    /*
     Any타입으로 타입 캐스팅 : UISwitch, UIStepper로 캐스팅 해 주어야 하는데 이들 클래스는 Any보다 계층적으로 하위 클래스이기 때문에 다운 캐스팅으로 처리된다.
     하위 클래스를 보다 높은 범위인 상위 클래스로 캐스팅하는 업 캐스팅은 오류가 발생하지만 반대로 좁은 의미인 하위 클래스로 캐스팅하는 다운 캐스팅은 항상 오루가 밸상할 수 있다.
    */
    @IBAction func onSwitch(_ sender: UISwitch) {
        if (sender.isOn == true) {
            self.isUpdateText.text = "갱신함"
        } else {
            self.isUpdateText.text = "갱신하지 않음"
        }
    }
    
//    @IBAction func onSwitch(_ sender: Any) {
//        // 옵셔널 캐스팅
//        guard let obj = sender as? UISwitch else {
//            return
//        }
//
//        if (obj.isOn == true) {
//            self.isUpdateText.text = "갱신함"
//        } else {
//            self.isUpdateText.text = "갱신하지 않음"
//        }
//    }
    
    
    @IBAction func onStepper(_ sender: UIStepper) {
        let value = Int(sender.value)
        self.intervalText.text = "\(value)분 마다"
    }
    
//    @IBAction func onStepper(_ sender: Any) {
//        //강제 캐스팅
//        let obj = sender as! UIStepper
//
//        let value = Int(obj.value)
//        self.intervalText.text = "\(value)분 마다"
//    }
    
    @IBAction func onSubmit(_ sender: Any) {
        //VC2의 인스턴스 생성
        guard let rvc = self.storyboard?.instantiateViewController(withIdentifier: "RVC") as? ResultViewController else {
            return
        }
        
        // 값 전달
        rvc.paramEmail = self.email.text! // 이메일
        rvc.paramUpdate = self.isUpdate.isOn // 자동갱신 여부
        rvc.paramInterval = self.interval.value // 갱신주기
        
        // 화면 이동
        self.present(rvc, animated: true)
    }
    
}

