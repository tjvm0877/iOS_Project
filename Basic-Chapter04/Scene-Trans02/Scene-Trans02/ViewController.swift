//
//  ViewController.swift
//  Scene-Trans02
//
//  Created by Hyun on 2021/11/19.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func movePresent(_ sender: Any) {
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") else {
            return
        }
        
        // P203
        self.present(uvc, animated: true)
    }
    @IBAction func moveByNavi(_ sender: Any) {
        // 두 번째 뷰 컨트롤러 인스턴스를 가져온다.
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") else {
            return
        }
        
        // 화면을 전환한다.
        self.navigationController?.pushViewController(uvc, animated: true)
    }
    

}

