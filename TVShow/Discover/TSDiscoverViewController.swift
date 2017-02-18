//
//  TSDiscoverViewController.swift
//  TVShow
//
//  Created by lkx on 16/4/28.
//  Copyright © 2016年 imeng. All rights reserved.
//

import UIKit
import AlamofireObjectMapper
import Alamofire
import SwiftyJSON

private let reuseIdentifier = "Cell"

//let DiscoverSectionURL = "http://api.douban.com/v2/movie/top250"
let DiscoverSectionURL = "http://api.douban.com/v2/movie/in_theaters"
//let DiscoverSectionURL = "https://m.douban.com/rexxar/api/v2/subject_collection/movie_showing/items?os=ios"

class TSDiscoverViewController: UICollectionViewController {
    var responseObjectData:JSON? {
        didSet {
            let sectionModel = TSDiscoverSectionController(json: (responseObjectData!["subjects"]))
            self.collectionView?.register(UINib.init(nibName: "TSDiscoverShelfCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier:sectionModel.sectionReuseIdentifier())
            print(sectionModel.sectionReuseIdentifier())
            contentObjects.append(sectionModel)
            
            self.collectionView?.reloadData()
            
//            if let listArray = responseObjectData?["subjects"].array {
//                for sectionItem in listArray {
//                    let sectionModel = TSDiscoverSectionController(json: sectionItem)
//                    self.collectionView?.register(UINib.init(nibName: "TSDiscoverShelfCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier:sectionModel.sectionReuseIdentifier())
//                    print(sectionModel.sectionReuseIdentifier())
//                    contentObjects.append(sectionModel)
//                }
//                self.collectionView?.reloadData()
//            }
//            if let listArray = responseObjectData?["album"].array {
//                bannerObjects += listArray
//            }
        }
    }
    
    var contentObjects = [TSDiscoverSectionController]()
    var bannerObjects = [JSON]()
    
    // MARK: - Left Cycle
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register cell classes
        let headerNib = UINib(nibName: "TSDiscoverBannerHeader", bundle: Bundle.main)
        self.collectionView!.register(headerNib, forSupplementaryViewOfKind: IOStickyHeaderParallaxHeader, withReuseIdentifier: "header")
        
        let screenBounds = UIScreen.main.bounds
        // setup layout
        if let layout: IOStickyHeaderFlowLayout = self.collectionView?.collectionViewLayout as? IOStickyHeaderFlowLayout {
            layout.parallaxHeaderReferenceSize = CGSize(width: screenBounds.width, height:0.54 * screenBounds.width)
            layout.parallaxHeaderMinimumReferenceSize = CGSize(width: screenBounds.width, height: 0)
            layout.itemSize = CGSize(width: UIScreen.main.bounds.size.width, height: layout.itemSize.height)
            layout.parallaxHeaderAlwaysOnTop = true
            layout.disableStickyHeaders = true
        }
        
        TSNetRequestManager.sharedInstance.request(DiscoverSectionURL).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                self.responseObjectData = JSON(value)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return contentObjects.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = contentObjects[indexPath.section]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: model.sectionReuseIdentifier(), for: indexPath) as! TSDiscoverShelfCollectionViewCell
        
        model.collectionViewController = self
        cell.collectionView.dataSource = model
        cell.collectionView.delegate = model

        print(cell)
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if UICollectionElementKindSectionHeader == kind {
            let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "sectionHeader", for: indexPath) as! TSDiscoverSectionHeader
            
            if let string = responseObjectData?["index"][indexPath.section]["title"].string {
                sectionHeader.textLabel.text = string
            }
            
            return sectionHeader
        } else {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: IOStickyHeaderParallaxHeader, withReuseIdentifier: "header", for: indexPath) as! TSDiscoverBannerHeader
            header.objects = self.bannerObjects
            return header
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
