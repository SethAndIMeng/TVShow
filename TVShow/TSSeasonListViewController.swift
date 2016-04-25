//
//  ViewController.swift
//  TVShow
//
//  Created by imeng on 16/4/6.
//  Copyright © 2016年 imeng. All rights reserved.
//
//学习https://onevcat.com/2014/06/walk-in-swift/
//总结:
//"T?": 表示Optional<T>
//"obj?": 若obj为T?类型，则obj?可以安全使用链式语法，而返回对象仍然为T?类型
//"obj!": 若obj为T?类型，则返回对象为T类型
//"obj as? T": 将任意类型转换为T?类型，失败时返回nil
//"obj as! T": 将任意类型转换为T类型，失败时异常

import UIKit
import Alamofire
import AlamofireObjectMapper
import SwiftyJSON
import Kingfisher

class TSSeasonListViewController: UITableViewController{

    var objects = [TSSeasonResponseObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.automaticallyAdjustsScrollViewInsets = false
        
        // Do any additional setup after loading the view, typically from a nib.
        let parameters = ["order": "desc","sort": "createTime","mark": "update","page": "1","rows": "100"]
        TSNetRequestManager.sharedInstance.request(.GET, api, parameters: parameters).responseArray(keyPath:"data.results") { (response: Response<[TSSeasonResponseObject], NSError>) in
            switch response.result {
            case .Success(let result):
                self.objects += result
                self.tableView?.reloadData()
            case .Failure(let errorInfo):
                print(errorInfo)
            }
        }
    }
    // MARK: - Segues
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let object = objects[indexPath.row]
                if let controller = segue.destinationViewController as? TSSeasonDetailViewController {
                    if let sid = object.sid {
                        controller.seasonID = sid
                    }
//                    controller.detailItem = object
//                    controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
//                    controller.navigationItem.leftItemsSupplementBackButton = true
                }
            }
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("\(object_getClass(self)).viewWillAppear(\(animated))")
    }

    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //既然dequeueReusableCellWithIdentifier声明了其optional的可能性，那么就从语法上接受这个假设
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell") ?? UITableViewCell(style: .Default, reuseIdentifier: "cell")
//        if (cell == nil) {
//            cell = UITableViewCell.init(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell")
//        }
        let season = objects[indexPath.row]
        
        cell.textLabel?.text = season.title
        cell.detailTextLabel?.text = season.brief
        if let cover = season.cover, URL = NSURL(string: cover) {
            //URL不允许optional
            cell.imageView?.kf_setImageWithURL(URL, completionHandler: { (image, error, cacheType, imageURL) -> () in
                cell.setNeedsLayout()
            })
        }
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

