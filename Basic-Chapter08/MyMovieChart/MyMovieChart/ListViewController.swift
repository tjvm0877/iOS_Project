//
//  ListViewController.swift
//  MyMovieChart
//
//  Created by Hyun on 2021/11/29.
//

import UIKit

class ListViewController: UITableViewController {
    
    // 튜플 아이템을 가진 배열로 정의된 데이터 세트
    var dataset = [
        ("다크나이트", "영웅물에 철학에 음악까지 더해져 예술이 되다.", "2009-09-04", 8.95),
        ("호우시절", "때를 알고 내리는 좋은 비", "2008-10-08", 7.31),
        ("말할 수 없는 비밀", "여기서 너까지 다섯 걸음", "2015-05-07", 9.19),
    ]
    
    // 테이블 뷰를 구성할 리스트 데이터
    /*
     lazy 키워드?
     1) 키워드데이터가 참조되는 시점에 맞추어 초기화 되므로 메모리 낭비를 줄일 수 있다.
     2) lazy가 붙이지 않은 프로퍼티들은 다른 프로퍼티를 참조할 수 없다.
        list배열 변수를 초기화하는 데에는 dataset 프로퍼티가 필요하다.
        하지만 프로퍼티들이 초기화 되는 순서는 우리가 컨트롤할 수 있는 범위를 벗어나기 때문에 list배열의 클로저가 실행되는 시점에 dataset배열이 초기화되어 있다고 보장할 수 없다. 이때문에 저장 프로퍼티끼리는 서로를 참조할 수 없다.
        lazy 키워드가 붙은 프로퍼티의 경우 초기화 되는 시점을 통제할 수 있기 때문에 초기화 클로저 구문 내에서는 다른 일반 프로퍼티를 참조하는 것도 가능하다.
        
     */
    lazy var list : [MoviceVo] = {
        var datalist = [MoviceVo]()
        for (title, desc, opendate, rating) in self.dataset {
            let mvo = MoviceVo()
            mvo.title = title
            mvo.description = desc
            mvo.opendate = opendate
            mvo.rating = rating
            
            datalist.append(mvo)
        }
        return datalist
    }()
    
    override func viewDidLoad() {

    }
    
    
}
