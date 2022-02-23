//
//  CSStepper.swift
//  Chapter03-CSStepper
//
//  Created by Hyun on 2022/02/23.
//

import UIKit
@IBDesignable
public class CSStepper: UIView {
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        let btnwidth = self.frame.height
        let lblwidth = self.frame.width - (btnwidth * 2)
        
        self.leftBtn.frame = CGRect(x: 0, y: 0, width: btnwidth, height: btnwidth)
        self.centerlbl.frame = CGRect(x: btnwidth, y: 0, width: lblwidth, height: btnwidth)
        self.rightBtn.frame = CGRect(x: btnwidth + lblwidth, y: 0, width: btnwidth, height: btnwidth)
    }
    
    public var maximumValue:Int = 100
    public var minimumValue:Int = -100
    public var leftBtn = UIButton(type: .system)
    public var rightBtn = UIButton(type: .system)
    public var centerlbl = UILabel()
    
    @IBInspectable
    public var value:Int = 0 {
        didSet {
            self.centerlbl.text = String(value)
        }
    }
    
    @IBInspectable
    public var leftTitle: String = "↑" {
        didSet {
            self.leftBtn.setTitle(leftTitle, for: .normal)
        }
    }
    
    @IBInspectable
    public var rightTitle: String = "↓" {
        didSet {
            self.rightBtn.setTitle(rightTitle, for: .normal)
        }
    }
    
    @IBInspectable
    public var stepValue: Int = 1
    
    @IBInspectable
    public var bgColor: UIColor = UIColor.cyan {
        didSet {
            self.centerlbl.backgroundColor = backgroundColor
        }
    }
    
    private func setup() {
        let borderWidth: CGFloat = 0.5
        let borderColor = UIColor.blue.cgColor
        
        // 좌측 버튼
        self.leftBtn.tag = -1
        self.leftBtn.setTitle(self.leftTitle, for: .normal)
        self.leftBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        
        self.leftBtn.layer.borderWidth = borderWidth
        self.leftBtn.layer.borderColor = borderColor
        
        // 우측 버튼
        self.rightBtn.tag = 1
        self.rightBtn.setTitle(self.rightTitle, for: .normal)
        self.rightBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        
        self.rightBtn.layer.borderWidth = borderWidth
        self.rightBtn.layer.borderColor = borderColor
        
        // 중앙 레이블
        self.centerlbl.text = String(value)
        self.centerlbl.font = UIFont.systemFont(ofSize: 16)
        self.centerlbl.textAlignment = .center
        self.centerlbl.backgroundColor = self.bgColor
        self.centerlbl.layer.borderWidth = borderWidth
        self.centerlbl.layer.borderColor = borderColor
        
        self.addSubview(self.leftBtn)
        self.addSubview(self.rightBtn)
        self.addSubview(self.centerlbl)
        
        self.leftBtn.addTarget(self, action: #selector(valueChange(_:)), for: .touchUpInside)
        self.rightBtn.addTarget(self, action: #selector(valueChange(_:)), for: .touchUpInside)
    }
    
    @objc public func valueChange(_ sender: UIButton) {
        self.value += sender.tag * self.stepValue
    }
}
