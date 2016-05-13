//
//  TSDiscoverBannerHeader.swift
//  TVShow
//
//  Created by lkx on 16/5/12.
//  Copyright © 2016年 imeng. All rights reserved.
//

import UIKit
import MapKit

class TSDiscoverBannerHeader: UICollectionViewCell {
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    // MARK: Public properties
    static let Kind = "StickyHeaderLayoutAttributesKind"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let screenBounds = UIScreen.mainScreen().bounds
        heightConstraint.constant = 0.56 * screenBounds.width
    }
}
