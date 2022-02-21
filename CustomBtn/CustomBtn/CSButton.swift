//
//  CSButton.swift
//  CustomBtn
//
//  Created by Hyun on 2022/02/21.
//

import UIKit

public enum CSButtonType {
    case rect
    case circle
}

class CSButton: UIButton {
    var style: CSButtonType = .rect {
        didSet {
            switch style {
            case .rect :
                self.backgroundColor = .black
                self.layer.borderColor = UIColor.black.cgColor
                self.layer.borderWidth = 2
                self.layer.cornerRadius = 0
                self.setTitleColor(.white, for: .normal)
                self.setTitle("Rect Btn", for: .normal)
            case .circle :
                self.backgroundColor = .red
                self.layer.borderColor = UIColor.blue.cgColor
                self.layer.borderWidth = 2
                self.layer.cornerRadius = 50
                self.setTitleColor(.white, for: .normal)
                self.setTitle("Circle Btn", for: .normal)
            }
        }
    }
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        self.backgroundColor = .green
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.black.cgColor
        self.setTitle("버튼", for: .normal)
    }
    
    // 매게변수(frame)를 받는 초기화 매소드
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .gray
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.black.cgColor
        self.setTitle("Code", for: .normal)
    }
    
    // 매개변수가 없는 초기화 메소드
    init() {
        super.init(frame: CGRect.zero) // 이 값을 사용하여 객체를 생성할 경우 CGRect(x: 0, Y: 0, width: 0, height: 0) 으로 초기화
    }
    
    convenience init(type: CSButtonType) {
        self.init()
        
        self.addTarget(self, action: #selector(counting(_:)), for: .touchUpInside)
        
        switch type {
        case .rect :
            self.backgroundColor = .black
            self.layer.borderColor = UIColor.black.cgColor
            self.layer.borderWidth = 2
            self.layer.cornerRadius = 0
            self.setTitleColor(.white, for: .normal)
            self.setTitle("Rect Btn", for: .normal)
        case .circle :
            self.backgroundColor = .red
            self.layer.borderColor = UIColor.blue.cgColor
            self.layer.borderWidth = 2
            self.layer.cornerRadius = 50
            self.setTitleColor(.white, for: .normal)
            self.setTitle("Circle Btn", for: .normal)
        }
    }
    
    @objc func counting(_ sender: UIButton) {
        sender.tag = sender.tag + 1
        sender.setTitle("\(sender.tag) 번째 클릭", for: .normal)
    }
}
