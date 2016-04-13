//
//  ViewController.swift
//  TVShow
//
//  Created by imeng on 16/4/6.
//  Copyright © 2016年 imeng. All rights reserved.
//

import UIKit
import Alamofire
import YYModel
import Kingfisher

class TSSeasonListViewController: UITableViewController{

    var manager: Manager!
    var dataSource: Array<TSSeasonResponseObject>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = Array()
//        self.automaticallyAdjustsScrollViewInsets = false
        
        // Do any additional setup after loading the view, typically from a nib.
        let parameters = ["order": "desc","sort": "createTime","mark": "update","page": "1","rows": "100"]
        
        TSNetRequestManager.sharedInstance.request(.GET, "http://api.rrmj.tv/v2/video/search", parameters: parameters).responseJSON { response in
            if let JSON = response.result.value as! NSDictionary? as Dictionary? {
                print("JSON: \(JSON)")
                let array = (JSON["data"]?["results"])! as! Array<NSDictionary>
                
                self.dataSource = self.dataSource + array.map({ dic in
                    TSSeasonResponseObject.yy_modelWithJSON(dic)!
                })
                self.tableView.reloadData()
            }
        }
                
    }
    
    // MARK: - Segues
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let object = dataSource[indexPath.row]
                let controller = segue.destinationViewController as! TSSeasonDetailViewController
                controller.seasonID = object.sid
//                controller.detailItem = object
//                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
//                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("\(object_getClass(self)).viewWillAppear(\(animated))")
    }

    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")!
//        if (cell == nil) {
//            cell = UITableViewCell.init(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell")
//        }
        let season = dataSource[indexPath.row]
        
        cell.textLabel?.text = season.title
        cell.detailTextLabel?.text = season.brief
        cell.imageView?.kf_setImageWithURL(NSURL(string: season.cover)!, completionHandler: { (image, error, cacheType, imageURL) -> () in
            cell.setNeedsLayout()
        })

        return cell
    }
    
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        let viewController = TSSeasonDetailViewController()
//        let season = dataSource[indexPath.row]
//        viewController.seasonID = season.sid
//        navigationController?.pushViewController(viewController, animated: true)
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

