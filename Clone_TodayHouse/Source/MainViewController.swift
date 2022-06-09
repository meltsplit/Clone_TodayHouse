//
//  MainViewController.swift
//  RisingCamp1
//
//  Created by 장석우 on 2022/06/06.
//

import Foundation
import UIKit
class MainViewController : UIViewController, UIScrollViewDelegate{
    
    @IBOutlet weak var mainNavigationBar: UINavigationItem!
    
    private let productDataArray : [ProductData] = [
        ProductData(productImageName: "c1", productName: "소파"),
        ProductData(productImageName: "c2", productName: "이불"),
        ProductData(productImageName: "c3", productName: "조명"),
        ProductData(productImageName: "c4", productName: "TV"),
        ProductData(productImageName: "c5", productName: "주방기구"),
        ProductData(productImageName: "c6", productName: "화분"),
        ProductData(productImageName: "c7", productName: "수납"),
        ProductData(productImageName: "c8", productName: "가구"),
    ]

    
    private let bookMarkNavBtn : UIButton = {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 25 , height: 25))
        btn.setBackgroundImage(UIImage(systemName: "bookmark"), for: .normal)
        btn.tintColor = .black
        btn.contentMode = .scaleAspectFit
        return btn
    }()
    private let cartNavBarBtn : UIButton = {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        btn.setBackgroundImage(UIImage(systemName: "cart"), for: .normal)
        btn.tintColor = .black
        btn.contentMode = .scaleAspectFit
        return btn
    }()
    
    private let searchBar : UISearchBar = {
        let bar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 280, height: 0))
        bar.placeholder = "오늘의 집 통합검색"
        return bar
    }()
    
    
    
    
    @IBOutlet weak var advertiseScrollView: UIScrollView!
    
    @IBOutlet weak var productCollectionView: UICollectionView!
    
    
    @IBOutlet var categoryBtn: [UIButton]!
    @IBOutlet var roomImageView: [UIImageView]!
    
    @IBAction func bookmarkBtnPressed(_ sender: UIButton) {
        sender.tintColor = .cyan
    }
    
    let advertiseImageNameArray : Array<String> = ["ad1","ad2","ad3","ad4","ad5"]
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarItems()
        setComponentLayer()
        setAdvertiseImage()
        setScrollView()
        setDelegate()
    }
    
    //MARK: - Custom Method
    
    private func setDelegate(){
        productCollectionView.dataSource = self
        let homeXib = UINib(nibName: "CollectionViewCell", bundle: nil)
        productCollectionView.register(homeXib, forCellWithReuseIdentifier: "CollectionViewCell")
    }
    private func setAdvertiseImage(){
        
        for i in 0..<advertiseImageNameArray.count{
            let imageView = UIImageView()
            imageView.contentMode = .scaleToFill
            imageView.image = UIImage(named: advertiseImageNameArray[i])
            let xpos = CGFloat(i)*self.view.bounds.size.width
            imageView.frame = CGRect(x: xpos, y: 0, width: view.frame.size.width , height: advertiseScrollView.frame.size.height)
            advertiseScrollView.addSubview(imageView)
        }
    }
    
    private func setScrollView(){
        advertiseScrollView.contentSize = CGSize(width: view.frame.size.width * 5.0, height: view.frame.height)
        advertiseScrollView.delegate = self // scroll범위에 따라 pageControl의 값을 바꾸어주기 위한 delegate
        advertiseScrollView.alwaysBounceVertical = false
        advertiseScrollView.showsHorizontalScrollIndicator = false
        advertiseScrollView.showsVerticalScrollIndicator = false
        advertiseScrollView.isScrollEnabled = true
        advertiseScrollView.isPagingEnabled = true
        advertiseScrollView.bounces = false // 경계지점에서 bounce될건지 체크 (첫 or 마지막 페이지에서 바운스 스크롤 효과 여부)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = advertiseScrollView.contentOffset.x/scrollView.frame.width
    }
    
    
    private func setComponentLayer(){
        advertiseScrollView.layer.cornerRadius = 10
        
        for i in categoryBtn { i.layer.cornerRadius = 12 }
        for i in roomImageView { i.layer.cornerRadius = 6 }
    }
    
    private func setNavigationBarItems(){
        
        let bookmarknavItem = UIBarButtonItem(customView: bookMarkNavBtn)
        let cartNavItem = UIBarButtonItem(customView: cartNavBarBtn)
        let searchBarItem = UIBarButtonItem(customView: searchBar)
        
        navigationItem.leftBarButtonItem = searchBarItem
        navigationItem.rightBarButtonItems = [cartNavItem,bookmarknavItem]
        
        
        
    }
    
}

extension MainViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell else {return UICollectionViewCell() }
        cell.setData(data: productDataArray[indexPath.row])
        
        return cell
    }
    
    
    
}
