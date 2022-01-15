//
//  ViewController.swift
//  HelloWorld
//
//  Created by Hyun on 2021/11/08.
//

import UIKit

class ViewController: UIViewController {
    
    //아울렛 변수 : 인터페이스 빌더의 레이블을 스위프트 클래스가 참조할 수 있도록 연결된 멤버변수
    @IBOutlet var uiTitle: UILabel!
    
    @IBAction func btnSayHello(_ sender: Any) {
        self.uiTitle.text = "Hello, Swift"
    }
    
    /* ViewDidLoad : UIViewController 클래스에 구현되어 있을 뿐만 아니라,
    적절한 시점에서 시스템에 의해 자동으로 호출되는 콜백 메소드(CallBack Method) */
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

