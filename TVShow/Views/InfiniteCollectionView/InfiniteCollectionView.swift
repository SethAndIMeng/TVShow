//
//  InfiniteScrollView.swift
//  TVShow
//
//  Created by imengX on 16/5/19.
//  Copyright © 2016年 imeng. All rights reserved.
//

import UIKit

@objc
public protocol InfiniteCollectionViewDataSource {
//    func cellForItemAtIndexPath(collectionView: UICollectionView, dequeueIndexPath: NSIndexPath, indexPath: NSIndexPath) -> UICollectionViewCell
    optional var infiniteCount: Int {get}
    
    @available(iOS 6.0, *)
    func infiniteCollectionView(collectionView: InfiniteCollectionView, numberOfItemsInSection section: Int) -> Int
    
//    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    @available(iOS 6.0, *)
    func infiniteCollectionView(collectionView: InfiniteCollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
}

public class InfiniteCollectionView: UICollectionView {
    var autoScroll = true {
        didSet {
            self.setUpTimer()
        }
    }
    var timeInterval = 5.0 {
        didSet {
            self.setUpTimer()
        }
    }
    
    public weak var infiniteDataSource: InfiniteCollectionViewDataSource?
//    override public var dataSource: UICollectionViewDataSource?//{
//        get{
//            return infiniteDataSource
//        }
//        set{
//            if newValue is InfiniteCollectionViewDataSource {
//                infiniteDataSource = newValue as? InfiniteCollectionViewDataSource
//            }else {
//                print("incorrect UICollectionViewDataSource type for InfiniteCollectionView")
//            }
//        }
//    }
    
    private static let defaultIdentifier = "Cell"
    private var timer: NSTimer?
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    override public init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        configure()
    }
    
    func configure() {
        self.pagingEnabled = true
        self.dataSource = self
        self.delegate = self
        self.setUpTimer()
    }
    
    // MARK: - Timer

    func setUpTimer() {
        self.tearDownTimer()
        if !self.autoScroll {return}
        
        timer = NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: #selector(timerFire), userInfo: nil, repeats: true)
        NSRunLoop.mainRunLoop().addTimer(timer!, forMode: NSRunLoopCommonModes)
    }
    func tearDownTimer() {
        self.timer?.invalidate()
    }
    
    func timerFire(timer: NSTimer) {
        let layout = self.collectionViewLayout as! UICollectionViewFlowLayout
        let currentOffset = self.contentOffset.x
        let targetOffset = currentOffset + layout.itemSize.width + layout.minimumLineSpacing + layout.sectionInset.left + layout.sectionInset.right
        self.setContentOffset(CGPoint(targetOffset,contentOffset.y), animated: true)
    }
}

extension InfiniteCollectionView: UICollectionViewDataSource  {
    var infiniteCount: Int {
        return 3
    }
    
    public func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let number = (infiniteDataSource!.infiniteCollectionView(collectionView as! InfiniteCollectionView, numberOfItemsInSection: section) * infiniteCount)
        return number
    }
    
    public func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let originIndexPath = NSIndexPath(forItem: (indexPath.item % infiniteCount), inSection: indexPath.section)
        return infiniteDataSource!.infiniteCollectionView(collectionView as! InfiniteCollectionView, cellForItemAtIndexPath: originIndexPath)
    }
}

// MARK: - private
extension InfiniteCollectionView: UICollectionViewDelegate {
    
    public func scrollViewDidScroll(scrollView: UIScrollView) {
        let layout = self.collectionViewLayout as! UICollectionViewFlowLayout
        let itemCount = self.infiniteDataSource?.infiniteCollectionView(self, numberOfItemsInSection: 0)
        
        let pageWidth = layout.itemSize.width + layout.minimumLineSpacing + layout.sectionInset.left + layout.sectionInset.right
        let periodOffset = pageWidth * CGFloat(itemCount!)
        let offsetActivatingMoveToBeginning = pageWidth * CGFloat(itemCount! * 2)
        let offsetActivatingMoveToEnd = pageWidth * CGFloat(itemCount! * 1)
        
        let offsetX = scrollView.contentOffset.x;
        if (offsetX > offsetActivatingMoveToBeginning) {
            scrollView.contentOffset = CGPointMake((offsetX - periodOffset), 0);
        } else if (offsetX < offsetActivatingMoveToEnd) {
            scrollView.contentOffset = CGPointMake((offsetX + periodOffset), 0);
        }
    }
}
