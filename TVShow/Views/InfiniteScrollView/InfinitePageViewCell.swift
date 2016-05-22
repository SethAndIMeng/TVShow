//
//  InfinitePageCell.swift
//  TVShow
//
//  Created by imengX on 16/5/19.
//  Copyright © 2016年 imeng. All rights reserved.
//

import UIKit

protocol InfinitePageViewCellProtocol {
    func configViewWithParameters(parameters:AnyObject) -> Void
}

class InfinitePageViewCell: UICollectionViewCell,InfinitePageViewCellProtocol {
    func configViewWithParameters(parameters: AnyObject) {
        
    }
}
