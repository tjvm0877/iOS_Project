//
//  MemoReadVC.swift
//  myMemo
//
//  Created by Hyun on 2022/01/16.
//

import UIKit

class MemoReadVC: UIViewController {
    // 리스트에서 콘텐츠 데이터를 받고 저장하는 변수
    var param: MemoData?
    
    @IBOutlet weak var subject: UILabel!
    @IBOutlet weak var contents: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    override func viewDidLoad() {
        self.subject.text = param?.title
        self.contents.text = param?.contents
        self.img.image = param?.image
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd일 HH:mm분에 작성됨"
        let dateString = formatter.string(from: (param?.regdate)!)
        
        // 네비게이션 타이틀에 날짜를 표시
        self.navigationItem.title = dateString
    }
}
