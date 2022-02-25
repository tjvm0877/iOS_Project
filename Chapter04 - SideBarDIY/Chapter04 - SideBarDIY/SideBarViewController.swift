//
//  SideBarViewController.swift
//  Chapter04 - SideBarDIY
//
//  Created by Hyun on 2022/02/25.
//

import UIKit

class SideBarViewController: UITableViewController {

    let titles = [
        "메뉴 01",
        "메뉴 02",
        "메뉴 03",
        "메뉴 04",
        "메뉴 05"
    ]
    
    let icons = [
        UIImage(named: "icon01"),
        UIImage(named: "icon02"),
        UIImage(named: "icon03"),
        UIImage(named: "icon04"),
        UIImage(named: "icon05")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let accountlbl = UILabel()
        accountlbl.frame = CGRect(x: 10, y: 30, width: self.view.frame.width, height: 30)
        
        accountlbl.text = "itsmine@gmail.com"
        accountlbl.textColor = .white
        accountlbl.font = UIFont.boldSystemFont(ofSize: 15)
        
        let v = UIView()
        v.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 70)
        v.backgroundColor = .brown
        v.addSubview(accountlbl)
        
        self.tableView.tableHeaderView = v
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.titles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let id = "menucell"
        let cell = tableView.dequeueReusableCell(withIdentifier: id) ?? UITableViewCell(style: .default, reuseIdentifier: id)
        
        // let cell = UITableViewCell()
        
        cell.textLabel?.text = self.titles[indexPath.row]
        cell.imageView?.image = self.icons[indexPath.row]
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
        
        return cell
    }
}
