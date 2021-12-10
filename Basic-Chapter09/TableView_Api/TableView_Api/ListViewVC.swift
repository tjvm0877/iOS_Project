//
//  ListViewVC.swift
//  TableView_Api
//
//  Created by Hyun on 2021/12/10.
//

import UIKit

class ListViewVC: UITableViewController {
    var dataset = [
        ("다크나이트", "영웅물에 철학에 음악까지 더해져 예술이 되다.", "2009-09-04", 8.95),
        ("호우시절", "때를 알고 내리는 좋은 비", "2008-10-08", 7.31),
        ("말할 수 없는 비밀", "여기서 너까지 다섯 걸음", "2015-05-07", 9.19),
    ]
    
    lazy var list : [MovieVo] = {
        var datalist = [MovieVo]()
        for (title, desc, opendate, rating) in self.dataset {
            let mvo = MovieVo()
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
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = self.list[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell")!
        cell.textLabel?.text = row.title
        
        return cell
    }
}
