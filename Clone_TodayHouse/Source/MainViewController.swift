//
//  MainViewController.swift
//  RisingCamp1
//
//  Created by 장석우 on 2022/06/06.
//

import Foundation
import UIKit
class MainViewController : UIViewController, UIScrollViewDelegate{
    
    //MARK: - Properties
    
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

    var images : [String] = [ "ad1" ,"ad2" ,"ad3" ,"ad4" ,"ad5" ]
    
    private let bookMarkNavBtn : UIButton = {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 25 , height: 25))
        btn.setBackgroundImage(UIImage(systemName: "bookmark"), for: .normal)
        btn.tintColor = .black
        btn.contentMode = .scaleAspectFit
        return btn
    }()
    private let cartNavBarBtn : UIButton = {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
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
    
    
    
    
    @IBOutlet weak var advertiseImageView: UIImageView!
    
    @IBOutlet weak var advertisePageControl: UIPageControl!
    
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
        setDelegate()
        setPageControl()
    }
    
    //MARK: - Custom Method
    
    private func setDelegate(){
        productCollectionView.dataSource = self
        let homeXib = UINib(nibName: "CollectionViewCell", bundle: nil)
        productCollectionView.register(homeXib, forCellWithReuseIdentifier: "CollectionViewCell")
    }
    

    
    private func setComponentLayer(){
        advertiseImageView.layer.cornerRadius = 12
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
    
    private func setPageControl(){
        
        //페이지 컨트롤의 전체 페이지를 images 배열의 전체 개수 값으로 설정
        advertisePageControl.numberOfPages = images.count
                // 페이지 컨트롤의 현재 페이지를 0으로 설정
        advertisePageControl.currentPage = 0
                // 페이지 표시 색상을 밝은 회색 설정
        advertisePageControl.pageIndicatorTintColor = UIColor.lightGray
                // 현재 페이지 표시 색상을 검정색으로 설정
        advertisePageControl.currentPageIndicatorTintColor = UIColor.black
        
        advertiseImageView.image = UIImage(named: images[0])
    }
    
    @IBAction func advertisePageChanged(_ sender: UIPageControl) {
        advertiseImageView.image = UIImage(named: images[advertisePageControl.currentPage])
    }
    
}

//MARK: - Collection View DataSource

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
