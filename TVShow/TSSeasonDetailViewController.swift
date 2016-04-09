//
//  TSSeasonDetailViewController.swift
//  TVShow
//
//  Created by imeng on 16/4/7.
//  Copyright © 2016年 imeng. All rights reserved.
//

import UIKit

class TSSeasonDetailViewController: UIViewController {

    var seasonID: String!
    
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var enTitleLabel: UILabel!
    @IBOutlet weak var catalogLabel: UILabel!
    @IBOutlet weak var viewCountLabel: UILabel!
    @IBOutlet weak var playStatus: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        seasonID = (seasonID == nil ? "" : seasonID)
        
        let parameters = ["seasonId":seasonID, "userId":""]
        
        TSNetRequestManager.sharedInstance.request(.GET, "http://api.rrmj.tv/v3/video/detail", parameters: parameters).responseJSON { response in
            if let JSON = response.result.value {
                
                print("JSON: \(JSON)")
                let dic = JSON["data"] as? NSDictionary!
                var seasonDetail: TSSeasonDetailResponseObject!
                
                if (dic != nil && dic!.objectForKey("seasonDetail") != nil){
                    seasonDetail = TSSeasonDetailResponseObject.yy_modelWithJSON(dic!.objectForKey("seasonDetail")!)!
                }
                if (seasonDetail == nil) {
                    return
                }
                
                self.coverImageView.kf_setImageWithURL(NSURL(string: seasonDetail.cover)!)
                self.titleLabel.text = seasonDetail.title
                self.enTitleLabel.text = seasonDetail.enTitle
                self.catalogLabel.text = seasonDetail.cat
                self.viewCountLabel.text = String(seasonDetail.viewCount)
                self.playStatus.text = seasonDetail.playStatus
                self.scoreLabel.text = String(seasonDetail.score)
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
