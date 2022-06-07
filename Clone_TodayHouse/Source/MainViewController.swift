//
//  MainViewController.swift
//  RisingCamp1
//
//  Created by 장석우 on 2022/06/06.
//

import Foundation
import UIKit
class MainViewController : UIViewController{
    
    @IBOutlet weak var mainNavigationBar: UINavigationItem!
    
    @IBOutlet weak var advertiseSlideBtn: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBarSetting()
        
        advertiseSlideBtn.layer.cornerRadius = 10
    }
    
    private func navigationBarSetting(){
        
    }
}
