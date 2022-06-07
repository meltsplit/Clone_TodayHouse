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
    
    
    @IBOutlet var categoryBtn: [UIButton]!
    
    @IBOutlet var roomImageView: [UIImageView]!
    
    
    
    @IBAction func bookmarkBtnPressed(_ sender: UIButton) {
        
        sender.tintColor = .cyan
      
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setComponentLayout()
        
        
    }
    
    private func setComponentLayout(){
        advertiseSlideBtn.layer.cornerRadius = 10
        
        for i in categoryBtn{
            i.layer.cornerRadius = 12
        }
        for i in roomImageView{
            i.layer.cornerRadius = 6        }
        
    }
}
