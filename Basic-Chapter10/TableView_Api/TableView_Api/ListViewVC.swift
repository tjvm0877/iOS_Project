//
//  ListViewVC.swift
//  TableView_Api
//
//  Created by Hyun on 2021/12/10.
//

import UIKit

class ListViewVC: UITableViewController {
//    var dataset = [
//        ("다크나이트", "영웅물에 철학에 음악까지 더해져 예술이 되다.", "2009-09-04", 8.95, "darknight.jpeg"),
//        ("호우시절", "때를 알고 내리는 좋은 비", "2008-10-08", 7.31, "rain.jpeg"),
//        ("말할 수 없는 비밀", "여기서 너까지 다섯 걸음", "2015-05-07", 9.19, "secret.jpeg"),
//    ]

    lazy var list : [MovieVo] = {
        var datalist = [MovieVo]()
//        for (title, desc, opendate, rating, thumnail) in self.dataset {
//            let mvo = MovieVo()
//            mvo.title = title
//            mvo.description = desc
//            mvo.opendate = opendate
//            mvo.rating = rating
//            mvo.thumnail = thumnail
//
//            datalist.append(mvo)
//        }
        return datalist
    }()
    
    var page = 1
    
    @IBOutlet var moreBtn: UIButton!
    @IBAction func more(_ sender: Any) {
        self.page += 1
        
        self.callMovieApi()
        
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        callMovieApi()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = self.list[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as! MovieCell
        
        cell.title?.text = row.title
        cell.desc?.text = row.description
        cell.opendate?.text = row.opendate
        cell.rating?.text = "\(row.rating!)"
        
        let url: URL! = URL(string: row.thumnail!)
        
        let imageData = try! Data(contentsOf: url)
        
        cell.img.image = UIImage(data: imageData)
//        cell.img.image = UIImage(named: row.thumnail!)
        
        return cell
    }
    
    func callMovieApi() {
        let url = "http://swiftapi.rubypaper.co.kr:2029/hoppin/movies?version=1&page=\(self.page)&count=30&genreId=&order=releasedateasc"
        
        let apiURI: URL! = URL(string: url)
        
        let apidata = try! Data(contentsOf: apiURI)
        
        let log = NSString(data: apidata, encoding: String.Encoding.utf8.rawValue) ?? ""
        NSLog("API Result=\( log )")
        
        do {
            let apiDictionary = try JSONSerialization.jsonObject(with: apidata, options: []) as! NSDictionary
            
            let hoppin = apiDictionary["hoppin"] as! NSDictionary
            let movies = hoppin["movies"] as! NSDictionary
            let movie = movies["movie"] as! NSArray
            
            for row in movie {
                let r = row as! NSDictionary
                
                let mvo = MovieVo()
                
                mvo.title = r["title"] as? String
                mvo.description = r["genreNames"] as? String
                mvo.thumnail = r["thumbnailImage"] as? String
                mvo.detail = r["linkUrl"] as? String
                mvo.rating = ((r["ratingAverage"] as! NSString).doubleValue)
                
                self.list.append(mvo)
            }
            let totalCount = (hoppin["totalCount"] as? NSString)!.integerValue
            
            if (self.list.count >= totalCount) {
                self.moreBtn.isHidden = true
            }
        } catch {
            NSLog("Parse Error")
        }
    }
}
