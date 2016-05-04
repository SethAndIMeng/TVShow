//
//  MainSearchCollectionViewController.swift
//  TVShow
//
//  Created by Seth Jin on 16/5/4.
//  Copyright © 2016年 imeng. All rights reserved.
//

import UIKit

class LeftAlignedFlowLayout: UICollectionViewFlowLayout {
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let oldAttributes = super.layoutAttributesForElementsInRect(rect) else {
            return super.layoutAttributesForElementsInRect(rect)
        }
        let spacing = minimumInteritemSpacing // REPLACE WITH WHAT SPACING YOU NEED
        var newAttributes = [UICollectionViewLayoutAttributes]()
        var leftMargin = sectionInset.left
        var previousAttributes = UICollectionViewLayoutAttributes()
        for i in 0 ..< oldAttributes.count {
            let attributes = oldAttributes[i]
            
            if i == 0 {
                leftMargin = sectionInset.left
            } else {
                if (abs(attributes.frame.origin.y - previousAttributes.frame.origin.y) > 0.1) { //换行
                    leftMargin = sectionInset.left
                }
                else { //不换行
                    var newLeftAlignedFrame = attributes.frame
                    newLeftAlignedFrame.origin.x = leftMargin
                    attributes.frame = newLeftAlignedFrame
                }
            }
            
            attributes.frame.origin.x = leftMargin
            newAttributes.append(attributes)
            
            leftMargin += attributes.frame.width + spacing
            
            previousAttributes = attributes
        }
        return newAttributes
    }
}

class MainSearchCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //在collectionView的collectionViewCell中填写了identifier，这里就不用register了
        /* self.collectionView!.registerClass(MainSearchCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier) */

        // Do any additional setup after loading the view.
        
//        collectionView?.backgroundView?.backgroundColor = UIColor.whiteColor()
//        collectionView?.backgroundColor = UIColor.whiteColor()
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
        return 2
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 13
    }
    
    func stringForKeywordLabelTextAt(indexPath: NSIndexPath) -> String {
        
        let char: Character
        if indexPath.section == 0 {
            char = Character("热")
        } else if indexPath.section == 1 {
            char = Character("近")
        } else {
            char = Character("空")
        }
        let value = String(count: indexPath.row + 1, repeatedValue: char)
        return value
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! MainSearchCollectionViewCell
        
        cell.keywordLabel.text = stringForKeywordLabelTextAt(indexPath);

        // Configure the cell
    
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: "Header", forIndexPath: indexPath) as! MainSearchHeaderCollectionReusableView
        if indexPath.section == 0 {
            header.titleLabel.text = "热门搜索"
        } else if indexPath.section == 1 {
            header.titleLabel.text = "最近搜索"
        }
        return header;
    }
    
    //设置每个cell大小
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let text = stringForKeywordLabelTextAt(indexPath) as NSString
        let size = text.boundingRectWithSize(CGSize(width: 300, height: 50), options: .UsesFontLeading, attributes: [NSFontAttributeName: UIFont.systemFontOfSize(17)], context: nil).size
        
        return CGSize(width: size.width + 4, height: size.height + 4)
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
