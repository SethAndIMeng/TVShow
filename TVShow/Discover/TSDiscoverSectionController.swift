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
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return objects.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DiscoverCellReuseIdentifier, for: indexPath) as! TSDiscoverCollectionViewCell
        
        // Configure the cell
        let season = objects[indexPath.item]
        
        cell.titleLabel.text = season.title
        cell.catalogLabel.text = season.cat
        if let cover = season.cover, let url = URL(string: cover) {
            cell.coverImageView.kf.setImage(with: url)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let detailViewController = UIStoryboard(name: "Detail", bundle: Bundle.main).instantiateInitialViewController() as? TSSeasonDetailViewController {
            detailViewController.seasonObject = objects[indexPath.item]
            collectionViewController?.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
}
