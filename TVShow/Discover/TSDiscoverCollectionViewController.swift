//
//  TSDiscoverCollectionViewController.swift
//  TVShow
//
//  Created by imeng on 16/4/8.
//  Copyright © 2016年 imeng. All rights reserved.
//

import UIKit
import ObjectMapper
import AlamofireObjectMapper
import Alamofire

let DiscoverListURL = "http://api.rrmj.tv/v2/video/search"


class TSDiscoverCollectionViewController: UICollectionViewController {
    var objects = [TSSeasonResponseObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView!.backgroundColor = UIColor.lightGrayColor()
        
        let parameters = ["order": "desc","sort": "createTime","mark": "update","page": "1","rows": "100"]
        
        TSNetRequestManager.sharedInstance.request(.GET, DiscoverListURL, parameters: parameters).responseArray(keyPath:"data.results") { (response: Response<[TSSeasonResponseObject], NSError>) in
            switch response.result {
            case .Success(let result):
                self.objects += result
                self.collectionView?.reloadData()
            case .Failure(let errorInfo):
                print(errorInfo)
            }
        }
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("\(object_getClass(self)).viewWillAppear(\(animated))")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        
        if let indexPath = self.collectionView?.indexPathsForSelectedItems() {
            let object = self.objects[indexPath[0].item]
            let controller = segue.destinationViewController as? TSSeasonDetailViewController
            if let sid = object.sid {
                controller?.seasonID = sid
            }
        }
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return objects.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
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

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
