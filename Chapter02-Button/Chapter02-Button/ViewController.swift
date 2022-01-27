//
//  ViewController.swift
//  Chapter02-Button
//
//  Created by Hyun on 2022/01/27.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 버튼 객체 생성, 속성 설정
        let btn = UIButton(type: .system)
        btn.frame = CGRect(x: 50, y:100, width:150, height: 30)
        btn.setTitle("테스트 버튼", for: .normal)
        
        // 버튼을 수평 중앙 정렬
        btn.center = CGPoint(x: self.view.frame.size.width / 2, y: 100)
        
        // 루트 뷰에 버튼을 추가
        self.view.addSubview(btn)
        
        // 버튼의 이벤트, 메소드를 연결
        btn.addTarget(self, action: #selector(btnOnClick(_:)), for: .touchUpInside)
    }
    
    @objc func btnOnClick(_ sender: Any) {
        if let btn = sender as? UIButton {
            btn.setTitle("Clicked", for: .normal)
        }
    }
}

