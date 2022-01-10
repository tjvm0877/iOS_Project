//
//  ListViewVC.swift
//  TableView
//
//  Created by Hyun on 2022/01/10.
//

import UIKit

class ListViewVC: UITableViewController {
    var page = 1
    lazy var list : [MovieVO] = {
        var dataList = [MovieVO]()
        
        return dataList
    }()
    
    
}
