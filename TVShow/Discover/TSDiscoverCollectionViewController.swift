//
//  TSDiscoverCollectionViewController.swift
//  TVShow
//
//  Created by imeng on 16/4/8.
//  Copyright © 2016年 imeng. All rights reserved.
//

import UIKit

private let reuseIdentifier = "TSDiscoverCollectionViewCell"

class TSDiscoverCollectionViewController: UICollectionViewController {
    var objects:Array<TSSeasonResponseObject>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        objects = Array()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.registerClass(TSDiscoverCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView!.registerNib(UINib(nibName: reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        
        // Do any additional setup after loading the view.
        
        let parameters = ["order": "desc","sort": "createTime","mark": "update","page": "1","rows": "100"]
        
        TSNetRequestManager.sharedInstance.request(.GET, "http://api.rrmj.tv/v2/video/search", parameters: parameters).responseJSON { response in
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
                let array:Array<NSDictionary> = (JSON.objectForKey("data")?.objectForKey("results"))! as! Array<NSDictionary>
                
                for var dic in array {
                    let season = TSSeasonResponseObject.yy_modelWithJSON(dic)
                    self.objects.append(season!)
                }
                self.collectionView!.reloadData()
            }
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

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
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! TSDiscoverCollectionViewCell
    
        // Configure the cell
        let season = objects[indexPath.item]
        
        cell.titleLabel?.text = season.title
        cell.catalogLabel?.text = season.cat
        cell.coverImageView?.kf_setImageWithURL(NSURL(string: season.cover)!, completionHandler: { (image, error, cacheType, imageURL) -> () in
//            cell!.setNeedsLayout()
        })
        
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
