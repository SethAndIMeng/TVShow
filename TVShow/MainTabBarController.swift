//
//  MainTabBarController.swift
//  TVShow
//
//  Created by lkx on 16/4/22.
//  Copyright © 2016年 imeng. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    let discoverNavController = UINavigationController(rootViewController: UIStoryboard(name: "Discover",bundle: NSBundle.mainBundle()).instantiateInitialViewController()!);
    let searchNavController = UINavigationController(rootViewController: UIStoryboard(name: "Search",bundle: NSBundle.mainBundle()).instantiateInitialViewController()!);

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        viewControllers = [discoverNavController, searchNavController];
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
