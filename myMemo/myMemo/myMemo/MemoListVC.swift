//
//  MemoListVC.swift
//  myMemo
//
//  Created by Hyun on 2022/01/13.
//

import UIKit

class MemoListVC: UITableViewController {
    // 앱 델리게이트 객체의 참조 정보를 읽어옴
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    // 디바이스 스크린에 뷰 컨트롤러가 나타날 때마다 호출되는 메소드
    override func viewWillAppear(_ animated: Bool) {
        /*
         viewWillAppear메소드에 넣은 로직의 실행 시점
            1. 다른 화면으로 이동했다가 다시 목록으로 돌아왔을 때,
            2. 홈버튼을 눌러 앱이 백그라운드 모드로 내려간 후 다시 활성화 되었을 때
            3. 기타 상황으로 뷰 컨트롤러가 스크린에 표시될 때
         */
        
        // 테이블 데이터를 다시 읽어들인다. 이레 따라 행을 구성하는 로직이 다시 실행
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = self.appDelegate.memolist.count
        return count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // memolist 배열 데이터에서 주어진 행에 맞는 데이터를 불러온다.
        let row = self.appDelegate.memolist[indexPath.row]
        
        // 이미지의 유무를 확인, 유무에 따른 cell 모양 결정
        let cellID = row.image == nil ? "memoCell" : "memoCellWithImage"
        
        // 재사용 큐로부터 프로토타입 셀의 인스턴스를 전달
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as! MemoCell
        
        // memoCell의 내용 구성
        cell.subject?.text = row.title
        cell.contents?.text = row.contents
        cell.img?.image = row.image
        
        // Data타입의 날짜를 yyyy-MM-dd HH:mm:ss 포멧으로 변경
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        cell.regDate?.text = formatter.string(from: row.regdate!)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // memolist 배열에서 선택한 행에 맞는 데이터를 꺼낸다.
        let row = self.appDelegate.memolist[indexPath.row]
        
        // 상세 화면의 인스턴스를 생성
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "MemoRead") as? MemoReadVC else{
            return
        }
        
        // 값 전달 및 상새화면으로 이동
        vc.param = row
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
