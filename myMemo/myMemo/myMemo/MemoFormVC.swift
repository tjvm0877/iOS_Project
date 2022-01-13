//
//  MemoFormVC.swift
//  myMemo
//
//  Created by Hyun on 2022/01/13.
//

import UIKit

class MemoFormVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate {
    var subject: String!
    
    override func viewDidLoad() {
        self.content.delegate = self
    }
    
    @IBOutlet weak var content: UITextView!
    @IBOutlet weak var preview: UIImageView!
    
    // 저장 버튼 메소드
    @IBAction func save(_ sender: Any) {
        guard self.content.text?.isEmpty == false else {
            let alert = UIAlertController(title: nil, message: "내용을 입력해 주세요.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
            return
        }
        
        let data = MemoData()
        
        data.title = self.subject
        data.contents = self.content.text
        data.image = self.preview.image
        data.regdate = Date()
        
        // 앱 델리게이트 객체를 읽고 memolist배열에 MemoData 객체를 추가
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.memolist.append(data)
        
        // 작성폼 화면 종료, 이전 화면으로 복귀
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    // 이미지 선택 버튼 메소드
    @IBAction func pick(_ sender: Any) {
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.allowsEditing = true
        
        self.present(picker, animated: true)
    }
    
    // 이미지를 선택하기 위해 이미지 피커를 불러오는 메소드
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        self.preview.image = info[.editedImage] as? UIImage
        
        picker.dismiss(animated: true)
    }
    
    // 내용의 처음 15자를 제목으로 만들어주는 메소드
    func textViewDidChange(_ textView: UITextView) {
        let contents = textView.text as NSString
        let length = ( (contents.length > 15) ? 15 : contents.length )
        self.subject = contents.substring(with: NSRange(location: 0, length: length) )
        
        self.navigationItem.title = self.subject
    }
}
