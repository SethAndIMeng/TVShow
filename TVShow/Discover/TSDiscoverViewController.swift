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

private let reuseIdentifier = "Cell"

class TSDiscoverViewController: UICollectionViewController {
    var objects = [TSDiscoverSectionModel]()
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
            layout.parallaxHeaderReferenceSize = CGSizeMake(screenBounds.width, 0.56 * screenBounds.width)
            layout.parallaxHeaderMinimumReferenceSize = CGSizeMake(screenBounds.width, 0)
            layout.itemSize = CGSizeMake(UIScreen.mainScreen().bounds.size.width, layout.itemSize.height)
            layout.parallaxHeaderAlwaysOnTop = true
            layout.disableStickyHeaders = true
            self.collectionView?.collectionViewLayout = layout
        }
        for _ in 1...10 {
            objects.append(TSDiscoverSectionModel())
        }
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return objects.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as? TSDiscoverSectionCell {
            cell.titleLabel.text = "\(indexPath.row)"
            let model = objects[indexPath.row]
            model.collectionView = cell.collectionView
            cell.collectionView.dataSource = model
            cell.collectionView.delegate = model
            return cell
        }
        
        return UICollectionViewCell()
    }

    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        if let header = collectionView.dequeueReusableSupplementaryViewOfKind(IOStickyHeaderParallaxHeader, withReuseIdentifier: "header", forIndexPath: indexPath) as? TSDiscoverBannerHeader {
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
