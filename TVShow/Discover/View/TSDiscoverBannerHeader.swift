//
//  TSDiscoverBannerHeader.swift
//  TVShow
//
//  Created by lkx on 16/5/12.
//  Copyright © 2016年 imeng. All rights reserved.
//

import UIKit
import MapKit

class TSDiscoverBannerHeader: UICollectionViewCell, InfiniteCollectionViewDataSource {

    @IBOutlet weak var infiniteView: InfiniteCollectionView!
    // MARK: Public properties

    static let Kind = "StickyHeaderLayoutAttributesKind"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.commonInit()
    }
    
    func commonInit() {
        self.infiniteView?.registerNib(UINib.init(nibName: "TSDiscoverBannerCollectionViewCell", bundle: NSBundle.mainBundle()), forCellWithReuseIdentifier:"TSDiscoverBannerCollectionViewCell")
        self.infiniteView.infiniteDataSource = self
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if let layout: UICollectionViewFlowLayout = self.infiniteView?.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.itemSize = bounds.size
        }
    }
    
    func infiniteCollectionView(collectionView: InfiniteCollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func infiniteCollectionView(collectionView: InfiniteCollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let reusedCell = collectionView.dequeueReusableCellWithReuseIdentifier("TSDiscoverBannerCollectionViewCell", forIndexPath: indexPath) as? TSDiscoverBannerCollectionViewCell
        reusedCell?.titleLabel.text = "\(indexPath.row)"
//        reusedCell?.catalogLabel.text = "c\(indexPath.row)"
        return reusedCell!
    }
}