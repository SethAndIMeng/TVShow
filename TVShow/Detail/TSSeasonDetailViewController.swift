//
//  TSSeasonDetailViewController.swift
//  TVShow
//
//  Created by imeng on 16/4/7.
//  Copyright © 2016年 imeng. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class TSSeasonDetailViewController: UIViewController {

    var seasonID = ""
    
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
        
        let parameters = ["seasonId":seasonID, "userId":""]
        
        TSNetRequestManager.sharedInstance.request(.GET, "http://api.rrmj.tv/v3/video/detail", parameters: parameters).responseObject(keyPath:"data.seasonDetail") { (response: Response<TSSeasonDetail, NSError>) in
            switch response.result {
            case .Success(let result):
                self.titleLabel.text = result.title
                self.enTitleLabel.text = result.enTitle
                self.catalogLabel.text = result.cat
                self.playStatus.text = result.playStatus
                if let viewCount = result.viewCount {
                    self.viewCountLabel.text = "\(viewCount)次"
                }
                if let score = result.score {
                    self.scoreLabel.text = "\(score)分"
                }
                if let converString = result.cover {
                    self.coverImageView.kf_setImageWithURL(NSURL(string: converString)!)
                }
                
            case.Failure(let errorInfo):
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
}
