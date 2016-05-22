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

class TSDiscoverSectionController: NSObject,UICollectionViewDataSource, UICollectionViewDelegate {
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

    func sectionReuseIdentifier() -> String {
        return"\(DiscoverShelfCellReuseIdentifier)&\(self.objects.count)"
    }
    
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
        let reusedCell = collectionView.dequeueReusableCellWithReuseIdentifier(DiscoverCellReuseIdentifier, forIndexPath: indexPath) as? TSDiscoverCollectionViewCell
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
