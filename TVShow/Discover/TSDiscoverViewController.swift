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

let DiscoverSectionURL = "http://api.rrmj.tv/v2/video/indexInfo"

class TSDiscoverViewController: UICollectionViewController {
    var responseObjectData:JSON? {
        didSet {
            if let listArray = responseObjectData!["index"].array {
                for sectionItem in listArray {
                    let sectionModel = TSDiscoverSectionController(json: sectionItem["seasonList"])
                    self.collectionView?.registerNib(UINib.init(nibName: "TSDiscoverShelfCollectionViewCell", bundle: NSBundle.mainBundle()), forCellWithReuseIdentifier:sectionModel.sectionReuseIdentifier())
                    print(sectionModel.sectionReuseIdentifier())
                    contentObjects.append(sectionModel)
                }
                self.collectionView?.reloadData()
            }
        }
    }
    
    var contentObjects = [TSDiscoverSectionController]()
    // MARK: - Left Cycle
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register cell classes
        let headerNib = UINib(nibName: "TSDiscoverBannerHeader", bundle: NSBundle.mainBundle())
        self.collectionView!.registerNib(headerNib, forSupplementaryViewOfKind: IOStickyHeaderParallaxHeader, withReuseIdentifier: "header")
        
        let screenBounds = UIScreen.mainScreen().bounds
        // setup layout
        if let layout: IOStickyHeaderFlowLayout = self.collectionView?.collectionViewLayout as? IOStickyHeaderFlowLayout {
            layout.parallaxHeaderReferenceSize = CGSizeMake(screenBounds.width, 0.58 * screenBounds.width)
            layout.parallaxHeaderMinimumReferenceSize = CGSizeMake(screenBounds.width, 0)
            layout.itemSize = CGSizeMake(UIScreen.mainScreen().bounds.size.width, layout.itemSize.height)
            layout.parallaxHeaderAlwaysOnTop = true
            layout.disableStickyHeaders = true
        }
        
        TSNetRequestManager.sharedInstance.request(.GET, DiscoverSectionURL).validate().responseJSON { response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    self.responseObjectData = JSON(value)["data"]
                }
            case .Failure(let error):
                print(error)
            }
        }
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return contentObjects.count
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let model = contentObjects[indexPath.section]
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier(model.sectionReuseIdentifier(), forIndexPath: indexPath) as? TSDiscoverShelfCollectionViewCell {
            model.collectionViewController = self
            cell.collectionView.dataSource = model
            cell.collectionView.delegate = model
            print(cell)
            return cell
        }
        return UICollectionViewCell()
    }

    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        if UICollectionElementKindSectionHeader == kind  {
            if let sectionHeader = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "sectionHeader", forIndexPath: indexPath) as? TSDiscoverSectionHeader {
                
                if let string = responseObjectData?["index"][indexPath.section]["title"].string {
                    sectionHeader.textLabel.text = string
                }
                return sectionHeader
            }
        }else if let header = collectionView.dequeueReusableSupplementaryViewOfKind(IOStickyHeaderParallaxHeader, withReuseIdentifier: "header", forIndexPath: indexPath) as? TSDiscoverBannerHeader {
            return header
        }
        return UICollectionReusableView()
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
