//
//  ViewController.swift
//  AnimationNavigationBarSample
//
//  Created by Kazunori Aoki on 2021/04/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tapGes: UITapGestureRecognizer!
    
    var tabBarFrame: CGRect!
    var navBarFrame: CGRect!
    
    var isTabbarVisivle = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarFrame = (tabBarController?.tabBar.frame)!
        navBarFrame = (navigationController?.navigationBar.frame)!
        
        tapGes.addTarget(self, action: #selector(ViewController.tapped(_ :)))
        view.addGestureRecognizer(tapGes)
    }

    @objc func tapped(_ :UITapGestureRecognizer) {
        
        UIView.animate(withDuration: 0.5, animations: {() -> Void in

                    var frame = self.tabBarFrame
                    var navFrame = self.navBarFrame

                    if self.isTabbarVisivle {
                        // 隠す（不可視領域に追いやる）
                        frame?.origin.y = (self.tabBarFrame?.origin.y)! + (self.tabBarFrame?.size.height)!
                        self.tabBarController?.tabBar.frame = frame!

                        // ★追加　20はステータスバーの高さ
                        navFrame?.origin.y = (self.navBarFrame?.origin.y)! - (self.navBarFrame?.size.height)! - 20
                        self.navigationController?.navigationBar.frame = navFrame!

                    } else {
                        // 出す（不可視領域から復帰させる）
                        self.tabBarController?.tabBar.frame = self.tabBarFrame
                        // ★追加
                        self.navigationController?.navigationBar.frame = self.navBarFrame
                    }

                    // 見えてる・見えてないフラグの更新
                    self.isTabbarVisivle = (self.isTabbarVisivle) ? false : true
        });
    }
}

