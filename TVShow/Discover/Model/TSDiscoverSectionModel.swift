//
//  TSDiscoverSectionModel.swift
//  TVShow
//
//  Created by lkx on 16/5/13.
//  Copyright © 2016年 imeng. All rights reserved.
//

import UIKit

import AlamofireObjectMapper
import Alamofire
import SwiftyJSON

let DiscoverListURL = "http://api.rrmj.tv/v2/video/search"

class TSDiscoverSectionModel: NSObject,UICollectionViewDataSource, UICollectionViewDelegate {
    var objects = [TSSeasonResponseObject]()
    var collectionViewController: UICollectionViewController?
    
    init(json:JSON) {
        super.init()
        if let array = json.array {
            for item in array {
                let obj = TSSeasonResponseObject(json: item)
//                obj.sid = item["id"].string
                obj.cat = "***"
                objects.append(obj)
            }
        }
    }

    //
    //        // MARK: - Navigation
    //
    //        // In a storyboard-based application, you will often want to do a little preparation before navigation
    //        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    //            // Get the new view controller using [segue destinationViewController].
    //            // Pass the selected object to the new view controller.
    //
    //            if let indexPath = self.collectionView?.indexPathsForSelectedItems() {
    //                let object = self.objects[indexPath[0].item]
    //                let controller = segue.destinationViewController as? TSSeasonDetailViewController
    //                if let sid = object.sid {
    //                    controller?.seasonID = sid
    //                }
    //            }
    //        }
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return objects.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let reusedCell = collectionView.dequeueReusableCellWithReuseIdentifier(DiscoverCellreuseIdentifier, forIndexPath: indexPath) as? TSDiscoverCollectionViewCell
        let cell = reusedCell ?? TSDiscoverCollectionViewCell()
        
        // Configure the cell
        let season = objects[indexPath.item]
        
        cell.titleLabel?.text = season.title
        cell.catalogLabel?.text = season.cat
        if let cover = season.cover, URL = NSURL(string: cover) {
            cell.coverImageView?.kf_setImageWithURL(URL, completionHandler: { (image, error, cacheType, imageURL) -> () in
                //            cell.setNeedsLayout()
            })
        }
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        if let detailViewController = UIStoryboard(name: "Detail", bundle: NSBundle.mainBundle()).instantiateInitialViewController(){
            if let detail = detailViewController as? TSSeasonDetailViewController {
                detail.seasonObject = objects[indexPath.item]
                self.collectionViewController?.navigationController?.pushViewController(detail, animated: true)
            }
        }
    }
}
