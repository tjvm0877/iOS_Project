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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! movieCell
        
        cell.title?.text = row.title
        cell.desc?.text = row.description
        cell.openDate?.text = row.openDate
        cell.rating?.text = "\(row.rating!)"
        
        DispatchQueue.main.async(execute: {
            cell.thumbnail.image = self.getThumbnailImage(indexPath.row)
        })
        
        return cell
    }
    
    func getThumbnailImage(_ index: Int) -> UIImage {
        let mvo = self.list[index]
        
        if let saveImage = mvo.thumbnailImage {
            return saveImage
        } else {
            let url: URL! = URL(string: mvo.thumbnail!)
            let imageData = try! Data(contentsOf: url)
            mvo.thumbnailImage = UIImage(data: imageData)
            
            return mvo.thumbnailImage!
        }
    }
    
    func callMovieApi() {
        let url = "http://swiftapi.rubypaper.co.kr:2029/hoppin/movies?version=1&page=\(self.page)&count=30&genreId=&order=releasedateasc"
        let apiUrl: URL! = URL(string: url)
        let apiData = try! Data(contentsOf: apiUrl)
        let log = NSString(data: apiData, encoding: String.Encoding.utf8.rawValue) ?? ""
        NSLog("API Result=\( log )")
        
        do {
            let apiDictionary = try JSONSerialization.jsonObject(with: apiData, options: []) as! NSDictionary
            
            let hoppin = apiDictionary["hoppin"] as! NSDictionary
            let movies = hoppin["movies"] as! NSDictionary
            let movie = movies["movie"] as! NSArray
            
            for row in movie {
                let r = row as! NSDictionary
                let mvo = MovieVO()
                
                mvo.title = r["title"] as? String
                mvo.description = r["genreNames"] as? String
                mvo.thumbnail = r["thumbnailImage"] as? String
                mvo.detail = r["linkUrl"] as? String
                mvo.rating = ((r["ratingAverage"] as! NSString).doubleValue)
                
                let url: URL! = URL(string: mvo.thumbnail!)
                let imageData = try! Data(contentsOf: url)
                mvo.thumbnailImage = UIImage(data: imageData)
                
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
